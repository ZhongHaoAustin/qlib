# -*- coding: utf-8 -*-


TRAIN_START = "2010-01-01"
TRAIN_END = "2017-07-31"
VALID_START = "2017-08-01"
VALID_END = "2018-07-31"
TEST_START = "2018-08-01"
TEST_END = "2020-08-01"


MARKET_CSI100 = "csi100"
BENCHMARK_CSI100 = "SH000903"

DATA_HANDLER = {
    "start_time": TRAIN_START,
    "end_time": TEST_END,
    "fit_start_time": TRAIN_START,
    "fit_end_time": TRAIN_END,
    "instruments": MARKET_CSI100,
}

DATASET = {
    "class": "DatasetH",
    "module_path": "qlib.data.dataset",
    "kwargs": {
        "handler": {
            "class": "Alpha158",
            "module_path": "qlib.contrib.data.handler",
            "kwargs": DATA_HANDLER,
        },
        "segments": {
            "train": [TRAIN_START, TRAIN_END],
            "valid": [VALID_START, VALID_END],
            "test": [TEST_START, TEST_END],
        },
    },
}

PROT_ANALYSIS = {
    "executor": {
        "class": "SimulatorExecutor",
        "module_path": "qlib.backtest.executor",
        "kwargs": {
            "time_per_step": "day",
            "generate_portfolio_metrics": True,
        },
    },
    "strategy": {
        "class": "TopkDropoutStrategy",
        "module_path": "qlib.contrib.strategy.signal_strategy",
        "kwargs": {
            "signal": (model, dataset),
            "topk": 50,
            "n_drop": 5,
        },
    },
    "backtest": {
        "start_time": "2017-01-01",
        "end_time": "2020-08-01",
        "account": 100000000,
        "benchmark": CSI300_BENCH,
        "exchange_kwargs": {
            "freq": "day",
            "limit_threshold": 0.095,
            "deal_price": "close",
            "open_cost": 0.0005,
            "close_cost": 0.0015,
            "min_cost": 5,
        },
    },
}
