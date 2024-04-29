# export ROLLING_DIR=/home/zhonghao/code/qlib/examples/benchmarks_dynamic/baseline
# export DDGDA_DIR=/home/zhonghao/code/qlib/examples/benchmarks_dynamic/DDG-DA
# export QLIB_EXP_LOG=/home/zhonghao/code/qlib/logs
# export QLIB_YAML_DIR=/home/zhonghao/code/qlib/exp_yaml


############################################################
## baseline
############################################################
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/workflow_config_linear_Alpha158.yaml > $QLIB_EXP_LOG/baseline_lr.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/workflow_config_lightgbm_Alpha158.yaml > $QLIB_EXP_LOG/baseline_lgb.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/workflow_config_doubleensemble_fs_Alpha158.yaml > $QLIB_EXP_LOG/baseline_doubleensemble_fs.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/workflow_config_doubleensemble_sr_fs_Alpha158.yaml > $QLIB_EXP_LOG/baseline_doubleensemble_sr_fs.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/workflow_config_mlp_Alpha158.yaml > $QLIB_EXP_LOG/baseline_mlp.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun /home/zhonghao/code/qlib/examples/benchmarks/MLP/workflow_config_mlp_Alpha360.yaml > $QLIB_EXP_LOG/baseline_mlp_a360.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun $QLIB_YAML_DIR/workflow_config_xgboost_Alpha158.yaml > $QLIB_EXP_LOG/baseline_xgb.log 2>&1 &


############################################################
## nerual network
############################################################
# cd $QLIB_YAML_DIR && qrun /home/zhonghao/code/qlib/examples/benchmarks/ALSTM/workflow_config_alstm_Alpha158.yaml > $QLIB_EXP_LOG/nn_alstm.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun /home/zhonghao/code/qlib/examples/benchmarks/LSTM/workflow_config_lstm_Alpha158.yaml > $QLIB_EXP_LOG/nn_lstm.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun /home/zhonghao/code/qlib/examples/benchmarks/Transformer/workflow_config_transformer_Alpha158.yaml > $QLIB_EXP_LOG/nn_transformer.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun /home/zhonghao/code/qlib/examples/benchmarks/GRU/workflow_config_gru_Alpha158.yaml > $QLIB_EXP_LOG/nn_gru.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun /home/zhonghao/code/qlib/examples/benchmarks/ADD/workflow_config_add_Alpha360.yaml > $QLIB_EXP_LOG/nn_add_a360.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun /home/zhonghao/code/qlib/examples/benchmarks/ADARNN/workflow_config_adarnn_Alpha360.yaml > $QLIB_EXP_LOG/nn_adarnn_a360.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun /home/zhonghao/code/qlib/examples/benchmarks/ADARNN/workflow_config_adarnn_Alpha158.yaml > $QLIB_EXP_LOG/nn_adarnn.log 2>&1 &

############################################################
## nerual network & feature selection
############################################################
# cd $QLIB_YAML_DIR && qrun /home/zhonghao/code/qlib/examples/benchmarks/feat_selection/workflow_config_alstm_Alpha158.yaml > $QLIB_EXP_LOG/nn_fea_slec_alstm.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun /home/zhonghao/code/qlib/examples/benchmarks/feat_selection/workflow_config_lstm_Alpha158.yaml > $QLIB_EXP_LOG/nn_fea_slec_lstm.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun /home/zhonghao/code/qlib/examples/benchmarks/feat_selection/workflow_config_transformer_Alpha158.yaml > $QLIB_EXP_LOG/nn_fea_slec_transformer.log 2>&1 &
# cd $QLIB_YAML_DIR && qrun /home/zhonghao/code/qlib/examples/benchmarks/feat_selection/workflow_config_gru_Alpha158.yaml > $QLIB_EXP_LOG/nn_fea_slec_gru.log 2>&1 &

############################################################
## Rolling
############################################################
# cd $ROLLING_DIR && python rolling_benchmark.py run > $QLIB_EXP_LOG/rolling_lr.log 2>&1
# cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/workflow_config_lightgbm_Alpha158.yaml run > $QLIB_EXP_LOG/rolling_lgb.log 2>&1
# cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/workflow_config_doubleensemble_fs_Alpha158.yaml run > $QLIB_EXP_LOG/rolling_doubleensemble_fs.log 2>&1
# cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/workflow_config_doubleensemble_sr_fs_Alpha158.yaml run > $QLIB_EXP_LOG/rolling_doubleensemble_sr_fs.log 2>&1
# cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/workflow_config_mlp_Alpha158.yaml run > $QLIB_EXP_LOG/rolling_mlp.log 2>&1
# cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=$QLIB_YAML_DIR/workflow_config_xgboost_Alpha158.yaml run > $QLIB_EXP_LOG/rolling_xgb.log 2>&1
# rolling nerual network
# cd $ROLLING_DIR && python rolling_benchmark.py --conf_path=/home/zhonghao/code/qlib/examples/benchmarks/ALSTM/workflow_config_alstm_Alpha158.yaml run > $QLIB_EXP_LOG/rolling_nn_alstm.log 2>&1



#############################################################
### DDG-DA
#############################################################
# cd $DDGDA_DIR && python workflow.py run > $QLIB_EXP_LOG/ddgda_lr.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/workflow_config_lightgbm_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_lgb.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/workflow_config_mlp_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_mlp.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/workflow_config_xgboost_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_xgb.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/workflow_config_doubleensemble_fs_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_doubleensemble_fs.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/workflow_config_doubleensemble_sr_fs_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_doubleensemble_sr_fs.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=/home/zhonghao/code/qlib/examples/benchmarks/ADARNN/workflow_config_adarnn_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_adann.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=/home/zhonghao/code/qlib/examples/benchmarks/feat_selection/workflow_config_gru_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_gru.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=/home/zhonghao/code/qlib/examples/benchmarks/feat_selection/workflow_config_transformer_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_transformer.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=/home/zhonghao/code/qlib/examples/benchmarks/feat_selection/workflow_config_lstm_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_lstm.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=/home/zhonghao/code/qlib/examples/benchmarks/feat_selection/workflow_config_alstm_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_alstm.log 2>&1

#############################################################
# DDG-DA pre-trained
#############################################################
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/workflow_config_mlp_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_mlp_pre.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/workflow_config_lightgbm_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_lgb_pre.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=/home/zhonghao/code/qlib/examples/benchmarks/ADARNN/workflow_config_adarnn_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_adann_pre.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/workflow_config_xgboost_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_xgb_pre.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/workflow_config_doubleensemble_fs_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_doubleensemble_fs_pre.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=$QLIB_YAML_DIR/workflow_config_doubleensemble_sr_fs_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_doubleensemble_sr_fs_pre.log 2>&1
# cd $DDGDA_DIR && python workflow.py --conf_path=/home/zhonghao/code/qlib/examples/benchmarks/GRU/workflow_config_gru_Alpha158.yaml run > $QLIB_EXP_LOG/ddgda_gru_pre.log 2>&1

#############################################################
# Alpha360
#############################################################
# cd $DDGDA_DIR && python workflow.py --conf_path=/home/zhonghao/code/qlib/examples/benchmarks/LightGBM/workflow_config_lightgbm_Alpha360.yaml run > $QLIB_EXP_LOG/ddgda_lgb360.log 2>&1 &
# cd $DDGDA_DIR && python workflow.py --conf_path=/home/zhonghao/code/qlib/examples/benchmarks/LightGBM/workflow_config_lightgbm_Alpha360.yaml run > $QLIB_EXP_LOG/ddgda_lgb360.log 2>&1 &


#############################################################
# ADARNN tunning
#############################################################
# cd $QLIB_YAML_DIR && qrun /home/zhonghao/code/qlib/examples/benchmarks/ADARNN/workflow_config_adarnn_Alpha158.yaml > $QLIB_EXP_LOG/nn_adarnn_drot0.3.log 2>&1 &