# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.

import numpy as np
import pandas as pd
from typing import Text, Union
from qlib.log import get_module_logger
from qlib.data.dataset.weight import Reweighter
from sklearn.ensemble import RandomForestRegressor

from ...model.base import Model
from ...data.dataset import DatasetH
from ...data.dataset.handler import DataHandlerLP


class RandomForestModel(Model):

    estimator = RandomForestRegressor()

    def __init__(self):
        pass

    def fit(self, dataset: DatasetH, reweighter: Reweighter = None):
        df_train = dataset.prepare("train", col_set=["feature", "label"], data_key=DataHandlerLP.DK_L)
        if df_train.empty:
            raise ValueError("Empty data from dataset, please check your dataset config.")

        X, y = df_train["feature"].values, np.squeeze(df_train["label"].values)

        self.estimator.fit(X, y)

        return self

    def predict(self, dataset: DatasetH, segment: Union[Text, slice] = "test"):
        x_test = dataset.prepare(segment, col_set="feature", data_key=DataHandlerLP.DK_I)
        # return pd.Series(x_test.values @ self.coef_ + self.intercept_, index=x_test.index)
        return pd.Series(self.estimator.predict(x_test.values), index=x_test.index)