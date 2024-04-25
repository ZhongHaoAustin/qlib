cur_time() {
    date "+%Y%m%d%H%M%S%N"
}

# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_lightgbm_Alpha158.yaml --train_meta=Ture run > $QLIB_EXP_LOG/nd_ddgda_lgb_pre.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_linear_Alpha158.yaml run > $QLIB_EXP_LOG/nd_ddgda_linear_pre.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_adarnn_Alpha158.yaml run > $QLIB_EXP_LOG/nd_ddgda_adarnn_pre.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_xgboost_Alpha158.yaml run > $QLIB_EXP_LOG/nd_ddgda_xgb_pre.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_doubleensemble_fs_Alpha158.yaml run > $QLIB_EXP_LOG/nd_ddgda_doubleensemble_fs_pre.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_doubleensemble_sr_fs_Alpha158.yaml run > $QLIB_EXP_LOG/nd_ddgda_doubleensemble_sr_fs_pre.log 2>&1


# cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_gru_Alpha158.yaml --exp_name gru_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_gru_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.gru.log 2>&1
# cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_alstm_Alpha158.yaml --exp_name alstm_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_alstm_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.alstm.log 2>&1
# cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_add_Alpha158.yaml --exp_name add_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_add_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.add.log 2>&1
# cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_adarnn_Alpha158.yaml --exp_name adarnn_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_adarnn_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.adarnn.log 2>&1
# cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/new_data/workflow_config_doubleensemble_fs_Alpha158.yaml --exp_name doubleensemble_fs_$(date +"%Y-%m-%d %H:%M:%S.%N") --rolling_exp rolling_doubleensemble_fs_$(date +"%Y-%m-%d %H:%M:%S.%N") run > $QLIB_EXP_LOG/nd_rolling.doubleensemble_fs.log 2>&1


# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/longer_data/workflow_config_alstm_Alpha158.yaml > $QLIB_EXP_LOG/loer_baseline_alstm.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/longer_data/workflow_config_add_Alpha158.yaml > $QLIB_EXP_LOG/loer_baseline_add.log 2>&1 &


# run_fun() {
#     local cd_dir=$1
#     if [ "$cd_dir" = "dg" ]; then
#         cd_dir=$DDGDA_DIR
#         workflow_file = "workflow.py"
#     elif [ "$cd_dir" = "ro" ]; then
#         cd_dir=$ROLLING_DIR
#         workflow_file = "rolling_benchmark.py"
#     elif [ "$cd_dir" = "ba" ]; then
#         cd_dir=$QLIB_YAML_DIR
#         workflow_file = "qrun"
#     else
#         echo "Invalid cd_dir"
#         exit 1 
#     fi
    
# }
# run_fun "dg"

test_fun() {
    if [ "$1" = "dg" ]; then
        echo "dg"
        echo $2
    fi
}

test_fun "dg"