import qlib
from qlib.constant import REG_CN
from qlib.utils import init_instance_by_config, flatten_dict
from qlib.workflow import R
from qlib.workflow.record_temp import SignalRecord, PortAnaRecord, SigAnaRecord
from qlib.tests.data import GetData
from qlib.tests.config import CSI300_BENCH, CSI300_GBDT_TASK

import lightgbm as lgb

# use default data
provider_uri = "~/.qlib/qlib_data/cn_data"  # target_dir
GetData().qlib_data(target_dir=provider_uri, region=REG_CN, exists_skip=True)
qlib.init(provider_uri=provider_uri, region=REG_CN)

model = init_instance_by_config(CSI300_GBDT_TASK["model"])


import yaml

model_c = """
model:
    class: RandomForestModel
    module_path: qlib.contrib.model.random_forest
"""

dataset_c = """
dataset:
    class: DatasetH
    module_path: qlib.data.dataset
    kwargs:
        handler:
            class: Alpha158
            module_path: qlib.contrib.data.handler
            kwargs:
                start_time: 2008-01-01
                end_time: 2020-08-01
                fit_start_time: 2008-01-01
                fit_end_time: 2014-12-31
                instruments: csi300
                infer_processors:
                    - class: RobustZScoreNorm
                      kwargs:
                        fields_group: feature
                        clip_outlier: true
                    - class: Fillna
                      kwargs:
                        fields_group: feature
                learn_processors:
                    - class: DropnaLabel
                    - class: CSRankNorm
                      kwargs:
                        fields_group: label
        segments:
            train: [2008-01-01, 2014-12-31]
            valid: [2015-01-01, 2016-12-31]
            test: [2017-01-01, 2020-08-01]        
"""

model = {
    "class": "RandomForestModel",
    "module_path": "qlib.contrib.model.random_forest",
}

model = init_instance_by_config(model)

model

# save load config


config = yaml.safe_load(model)
dataset = init_instance_by_config(config["dataset"])

rf_model_config = {
    "class": "RandomForestModel",
    "module_path": "qlib.contrib.model.random_forest",
}

rf = init_instance_by_config(rf_model_config)

rf.fit(dataset)


# NOTE: This line is optional
# It demonstrates that the dataset can be used standalone.
example_df = dataset.prepare("train")


X = example_df.iloc[:, :-1]
y = example_df.iloc[:, -1]

# get feature importance
lgb_model = lgb.LGBMRegressor()
# lgb_model.fit(example_df.iloc[:, :-1], example_df.iloc[:, -1])
lgb_model.fit(X, y)


X = example_df.dropna(axis=1).iloc[:, :-1]
y = example_df.dropna(axis=1).iloc[:, -1]


from sklearn.ensemble import RandomForestRegressor

rf = RandomForestRegressor()
rf.fit(X, y)
