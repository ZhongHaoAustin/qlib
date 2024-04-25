# Copyright (c) Microsoft Corporation.
# Licensed under the MIT License.
from pathlib import Path
from typing import Union

import fire

import qlib
from qlib import auto_init
from qlib.constant import REG_CN
from qlib.contrib.rolling.ddgda import DDGDA
from qlib.tests.data import GetData


class DDGDABench(DDGDA):
    def __init__(
        self, conf_path: Union[str, Path], horizon=20, train_meta: bool=False, working_dir=None, **kwargs
    ) -> None:
        # This code is for being compatible with the previous old code
        conf_path = Path(conf_path)
        super().__init__(
            conf_path=conf_path, horizon=horizon, working_dir=working_dir, train_mate=train_meta, **kwargs
        )

if __name__ == "__main__":
    provider_uri = {"day": "~/.qlib/qlib_data/my_data"}  # target_dir
    qlib.init(provider_uri=provider_uri, region=REG_CN)
    fire.Fire(DDGDABench)
