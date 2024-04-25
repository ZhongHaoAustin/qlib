#  Copyright (c) Microsoft Corporation.
#  Licensed under the MIT License.
"""
Qlib provides two kinds of interfaces. 
(1) Users could define the Quant research workflow by a simple configuration.
(2) Qlib is designed in a modularized way and supports creating research workflow by code just like building blocks.

The interface of (1) is `qrun XXX.yaml`.  The interface of (2) is script like this, which nearly does the same thing as `qrun XXX.yaml`
"""
import qlib
from qlib.constant import REG_CN
from qlib.utils import init_instance_by_config, flatten_dict
from qlib.workflow import R
from qlib.workflow.record_temp import SignalRecord, PortAnaRecord, SigAnaRecord
from qlib.tests.data import GetData
from qlib.tests.config import CSI300_BENCH, CSI300_GBDT_TASK

import lightgbm as lgb
from qlib import auto_init

# use default data
provider_uri = {"day": "~/.qlib/qlib_data/my_data"}  # target_dir
# provider_uri = "~/.qlib/qlib_data/cn_data"  # target_dir
# GetData().qlib_data(target_dir=provider_uri, region=REG_CN, exists_skip=True)
qlib.init(provider_uri=provider_uri, region=REG_CN)


model = init_instance_by_config(CSI300_GBDT_TASK["model"])


import yaml

model = """
model:
    class: RandomForestModel
    module_path: qlib.contrib.model.random_forest
dataset:
    class: DatasetH
    module_path: qlib.data.dataset
    kwargs:
        handler:
            class: Alpha158
            module_path: qlib.contrib.data.handler
            kwargs:
                start_time: 2010-01-01
                end_time: 2024-12-01
                fit_start_time: 2010-01-01
                fit_end_time: 2019-12-31
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
            train: [2010-01-01, 2019-12-31]
            valid: [2020-01-01, 2021-12-31]
            test: [2022-01-01, 2023-12-31]        
"""
# save load config
config = yaml.safe_load(model)
dataset = init_instance_by_config(config["dataset"])


# NOTE: This line is optional
# It demonstrates that the dataset can be used standalone.
example_df = dataset.prepare("test")
