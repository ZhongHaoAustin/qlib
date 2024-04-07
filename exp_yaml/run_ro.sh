cur_time() {
    date "+%Y%m%d%H%M%S%N"
}

get_ro_run_cmd() {
    local model_name=$1
    local data_type=$2
    local ro_type=$3
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
        cd "$DDGDA_DIR" && python workflow.py --conf_path="$work_flow_config" --exp_name="ens_dg_${model_name}_$(cur_time)" --rolling_exp="dg_${model_name}_$(cur_time)" --working_dir=$log_dir run > "$log_dir/${model_name}.log" 2>&1 &
    fi
}

model_names=("linear" "lightgbm" "mlp" "xgboost" "lstm" "transformer" "gru" "alstm" "add" "adarnn" "doubleensemble_fs" "doubleensemble_sr_fs")
for model_name in "${model_names[@]}"
do
    get_ro_run_cmd "$model_name" "nd" "ro"
done

# ddg_pre_train() {

# }