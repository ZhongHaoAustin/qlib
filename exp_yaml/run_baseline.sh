get_run_baseline_cmd() {
    if [ -d "$QLIB_EXP_LOG/baseline" ]; then
        mkdir -p "$QLIB_EXP_LOG/baseline"
        echo "$QLIB_EXP_LOG/baseline created"
    fi

    cd $QLIB_EXP_LOG && /home/zhonghao/miniconda3/envs/qlib_env/bin/qrun $QLIB_YAML_DIR/nd/workflow_config_$1_Alpha158.yaml --exp_name=baseline_$1_$2 run > $QLIB_EXP_LOG/baseline/$1_$2.log 2>&1 & 
    # echo "run cmd: cd $QLIB_EXP_LOG && /home/zhonghao/miniconda3/envs/qlib_env/bin/qrun $QLIB_YAML_DIR/nd/workflow_config_$1_Alpha158.yaml --exp_name=baseline_$1_$2 run > $QLIB_EXP_LOG/baseline/$1_$2.log 2>&1 &"
}


model_names=("linear" "lightgbm" "mlp" "xgboost" "catboost")
for model_name in "${model_names[@]}"
do
    get_run_baseline_cmd "$model_name" "nd"
    get_run_baseline_cmd "$model_name" "loer"
done
