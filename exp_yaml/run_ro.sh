cur_time() {
    date "+%Y%m%d%H%M%S%N"
}

get_ro_run_cmd() {
    local model_name=$1
    local data_type=$2 # nd or loer
    local ro_type=$3 # ro or dg_metalinear or dg_metagbdt
    local work_flow_config="$QLIB_YAML_DIR/${data_type}/workflow_config_${model_name}_Alpha158.yaml"
    echo "model_name: $model_name"
    echo "data_type: $data_type"
    echo "work_flow_config: $work_flow_config"
 
    if [ ! -f "$work_flow_config" ]; then
        echo "$work_flow_config not found"
        exit 1
    fi

    local log_dir="$QLIB_EXP_LOG/${data_type}_${ro_type}"
    if [ ! -d "$log_dir" ]; then
        mkdir -p "$log_dir"
        echo "$log_dir created"
    fi
    echo "save log to $log_dir/${model_name}.log"

    if [ "$ro_type" = "ro" ]; then
        cd "$ROLLING_DIR" && python rolling_benchmark.py --conf_path="$work_flow_config" --exp_name="ens_ro_${model_name}_$(cur_time)" --rolling_exp="ro_${model_name}_$(cur_time)" run > "$log_dir/${model_name}.log" 2>&1 &
    else
        cd $QLIB_EXP_LOG/${data_type}_${ro_type} && python workflow.py --conf_path="$work_flow_config" --exp_name="ens_dg_${model_name}_$(cur_time)" --rolling_exp="dg_${model_name}_$(cur_time)" --working_dir=$log_dir --meta_exp_name="${data_type}_${ro_type}" run > "$log_dir/${model_name}.log" 2>&1 &
        # echo "run cmd: cd $log_dir && python workflow.py --conf_path=$work_flow_config --exp_name=ens_dg_${model_name}_$(cur_time) --rolling_exp=dg_${model_name}_$(cur_time) --working_dir=$log_dir --meta_exp_name=${data_type}_${ro_type} run > $log_dir/${model_name}.log 2>&1 &"
    fi
}

model_names=("linear" "lightgbm" "mlp" "xgboost" "catboost")
for model_name in "${model_names[@]}"
do
    # get_ro_run_cmd "$model_name" "nd" "dg_metalinear"
    # get_ro_run_cmd "$model_name" "nd" "dg_metagbdt"
    # get_ro_run_cmd "$model_name" "loer" "dg_metagbdt"
    # get_ro_run_cmd "$model_name" "loer" "dg_metalinear"
    get_ro_run_cmd "$model_name" "nd" "ro"
    get_ro_run_cmd "$model_name" "loer" "ro"
done

get_run_baseline_cmd() {
    if [ -d "$QLIB_EXP_LOG/baseline" ]; then
        mkdir -p "$QLIB_EXP_LOG/baseline"
        echo "$QLIB_EXP_LOG/baseline created"
    fi

    echo "run cmd: cd $QLIB_EXP_LOG && /home/zhonghao/miniconda3/envs/qlib_env/bin/qrun $QLIB_YAML_DIR/nd/workflow_config_$1_Alpha158.yaml --exp_name=baseline_$1_$2 run > $QLIB_EXP_LOG/baseline_$1_$2.log 2>&1 &"
    # cd $QLIB_EXP_LOG && /home/zhonghao/miniconda3/envs/qlib_env/bin/qrun $QLIB_YAML_DIR/nd/workflow_config_$1_Alpha158.yaml --exp_name=baseline_$1_$2 run > $QLIB_EXP_LOG/baseline_$1_$2.log 2>&1 & 
}

get_run_baseline_cmd lightgbm nd