# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_linear_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_lr.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_lightgbm_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_lgb.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_doubleensemble_fs_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_doubleensemble_fs.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_doubleensemble_sr_fs_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_doubleensemble_sr_fs.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_mlp_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_mlp.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_xgboost_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_xgb.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_adarnn_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_adarnn.log 2>&1 &

# gru, lstm, transformer, alstm, add
cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_gru_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_gru.log 2>&1 &
cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_lstm_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_lstm.log 2>&1 &
cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_transformer_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_transformer.log 2>&1 &
cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_alstm_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_alstm.log 2>&1 &
cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/new_data/workflow_config_add_Alpha158.yaml > $QLIB_EXP_LOG/nd_baseline_add.log 2>&1 &
