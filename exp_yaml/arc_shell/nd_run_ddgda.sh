cur_time() {
    date "+%Y-%m-%d %H:%M:%S"
}

cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_lightgbm_Alpha158.yaml --train_meta=Ture run > $QLIB_EXP_LOG/nd_ddgda_lgb_pre.log 2>&1
cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_linear_Alpha158.yaml run > $QLIB_EXP_LOG/nd_ddgda_linear_pre.log 2>&1
cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_adarnn_Alpha158.yaml run > $QLIB_EXP_LOG/nd_ddgda_adarnn_pre.log 2>&1
cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_xgboost_Alpha158.yaml run > $QLIB_EXP_LOG/nd_ddgda_xgb_pre.log 2>&1
cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_doubleensemble_fs_Alpha158.yaml run > $QLIB_EXP_LOG/nd_ddgda_doubleensemble_fs_pre.log 2>&1
cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_doubleensemble_sr_fs_Alpha158.yaml run > $QLIB_EXP_LOG/nd_ddgda_doubleensemble_sr_fs_pre.log 2>&1
