# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_linear_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_lr.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_lightgbm_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_lgb.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_doubleensemble_fs_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_doubleensemble_fs.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_doubleensemble_sr_fs_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_doubleensemble_sr_fs.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_mlp_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_mlp.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_xgboost_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_xgb.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_adarnn_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_adarnn.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_gru_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_gru.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_lstm_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_lstm.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_transformer_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_transformer.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_alstm_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_alstm.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_add_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_add.log 2>&1 &

############################################################
## Rolling
############################################################
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_linear_Alpha158.yaml --exp_name lr_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_lr_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.lr.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_lightgbm_Alpha158.yaml --exp_name lgb_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_lgb_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.lgb.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_mlp_Alpha158.yaml --exp_name mlp_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_mlp_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.mlp.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_xgboost_Alpha158.yaml --exp_name xgb_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_xgb_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.xgb.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_lstm_Alpha158.yaml --exp_name lstm_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_lstm_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.lstm.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_transformer_Alpha158.yaml --exp_name transformer_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_transformer_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.transformer.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_gru_Alpha158.yaml --exp_name gru_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_gru_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.gru.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_alstm_Alpha158.yaml --exp_name alstm_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_alstm_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.alstm.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_add_Alpha158.yaml --exp_name add_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_add_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.add.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_adarnn_Alpha158.yaml --exp_name adarnn_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_adarnn_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.adarnn.log 2>&1
cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_doubleensemble_fs_Alpha158.yaml --exp_name doubleensemble_fs_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_doubleensemble_fs_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.doubleensemble_fs.log 2>&1

