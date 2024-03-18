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

# use default data
provider_uri = "~/.qlib/qlib_data/cn_data"  # target_dir
GetData().qlib_data(target_dir=provider_uri, region=REG_CN, exists_skip=True)
qlib.init(provider_uri=provider_uri, region=REG_CN)

model = init_instance_by_config(CSI300_GBDT_TASK["model"])
dataset = init_instance_by_config(CSI300_GBDT_TASK["dataset"])

# NOTE: This line is optional
# It demonstrates that the dataset can be used standalone.
example_df = dataset.prepare("train")


X = example_df.iloc[:, :-1]
y = example_df.iloc[:, -1]

# get feature importance
lgb_model = lgb.LGBMRegressor()
# lgb_model.fit(example_df.iloc[:, :-1], example_df.iloc[:, -1])
lgb_model.fit(X, y)


feature_importance = lgb_model.feature_importances_
# print top 20 important features
print(example_df.columns[feature_importance.argsort()[::-1][:20]])
"""
Index(['RESI5', 'RESI10', 'ROC60', 'ROC30', 'ROC5', 'RESI30', 'KLEN', 'KSFT',
    'ROC10', 'ROC20', 'RSQR10', 'RESI20', 'KLOW', 'RESI60', 'IMIN5', 'MIN5',
    'CORR10', 'LOW0', 'BETA60', 'BETA5'],
    dtype='object')
"""


#########################################################
# Feature selection by Lasso
#########################################################
from sklearn.linear_model import Lasso

lasso = Lasso(alpha=0.005)


lasso.fit(
    example_df.dropna(axis=1).iloc[:, :-1].values,
    example_df.dropna(axis=1).iloc[:, -1].values,
)


# Access coefficients
selected_features = lasso.coef_

# Identify important features
important_features_indices = [
    i for i, coef in enumerate(selected_features) if abs(coef) > 0
]
important_features = example_df.iloc[:, important_features_indices]

print("Important Features:", important_features_indices)


from sklearn.linear_model import Lasso
from sklearn.datasets import make_regression

# Create synthetic data
X, y = make_regression(n_samples=100, n_features=10, noise=0.1, random_state=42)

# Instantiate Lasso model
lasso = Lasso(alpha=0.01)

# Fit the model
lasso.fit(X, y)

# Access coefficients
selected_features = lasso.coef_

# Identify important features
important_features_indices = [
    i for i, coef in enumerate(selected_features) if abs(coef) > 0
]
important_features = X[:, important_features_indices]

print("Important Features:", important_features_indices)
