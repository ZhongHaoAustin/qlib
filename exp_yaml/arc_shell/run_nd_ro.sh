cur_time() {
    date "+%Y%m%d%H%M%S%N"
}
WORKFLOW_CONFIG_DIR=$QLIB_YAML_DIR/loer_data/workflow_config_
LOCAL_LOG_DIR=$QLIB_EXP_LOG/nd_ro
if [ ! -d $LOCAL_LOG_DIR ]; then
    mkdir -p $LOCAL_LOG_DIR
fi

cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$WORKFLOW_CONFIG_DIR"linear_Alpha158.yaml" --exp_name ens_lr_$(cur_time) --rolling_exp ro_lr_$(cur_time) run > $LOCAL_LOG_DIR/lr.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$WORKFLOW_CONFIG_DIR"lightgbm_Alpha158.yaml" --exp_name ens_lgb_$(cur_time) --rolling_exp ro_lgb_$(cur_time) run > $LOCAL_LOG_DIR/lgb.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$WORKFLOW_CONFIG_DIR"mlp_Alpha158.yaml" --exp_name ens_mlp_$(cur_time) --rolling_exp ro_mlp_$(cur_time) run > $LOCAL_LOG_DIR/mlp.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$WORKFLOW_CONFIG_DIR"xgboost_Alpha158.yaml" --exp_name ens_xgb_$(cur_time) --rolling_exp ro_xgb_$(cur_time) run > $LOCAL_LOG_DIR/xgb.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$WORKFLOW_CONFIG_DIR"lstm_Alpha158.yaml" --exp_name ens_lstm_$(cur_time) --rolling_exp ro_lstm_$(cur_time) run > $LOCAL_LOG_DIR/lstm.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$WORKFLOW_CONFIG_DIR"transformer_Alpha158.yaml" --exp_name ens_transformer_$(cur_time) --rolling_exp ro_transformer_$(cur_time) run > $LOCAL_LOG_DIR/transformer.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$WORKFLOW_CONFIG_DIR"gru_Alpha158.yaml" --exp_name ens_gru_$(cur_time) --rolling_exp ro_gru_$(cur_time) run > $LOCAL_LOG_DIR/gru.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$WORKFLOW_CONFIG_DIR"alstm_Alpha158.yaml" --exp_name ens_alstm_$(cur_time) --rolling_exp ro_alstm_$(cur_time) run > $LOCAL_LOG_DIR/alstm.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$WORKFLOW_CONFIG_DIR"add_Alpha158.yaml" --exp_name ens_add_$(cur_time) --rolling_exp ro_add_$(cur_time) run > $LOCAL_LOG_DIR/add.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$WORKFLOW_CONFIG_DIR"adarnn_Alpha158.yaml" --exp_name ens_adarnn_$(cur_time) --rolling_exp ro_adarnn_$(cur_time) run > $LOCAL_LOG_DIR/adarnn.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$WORKFLOW_CONFIG_DIR"doubleensemble_fs_Alpha158.yaml" --exp_name ens_doubleensemble_fs_$(cur_time) --rolling_exp ro_doubleensemble_fs_$(cur_time) run > $LOCAL_LOG_DIR/doubleensemble_fs.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$WORKFLOW_CONFIG_DIR"doubleensemble_sr_fs_Alpha158.yaml" --exp_name ens_doubleensemble_sr_fs_$(cur_time) --rolling_exp ro_doubleensemble_sr_fs_$(cur_time) run > $LOCAL_LOG_DIR/doubleensemble_sr_fs.log 2>&1