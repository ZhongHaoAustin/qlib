rm_mlruns_pkl() {
    rm -rf $1/mlruns
    rm -rf $1/*.pkl
}

run_meta_func() {
    local meta_sim_model=$1 # linear or gbdt
    local data_type=$2 # nd or loer
    local meta_work_dir="$QLIB_EXP_LOG/${data_type}_dg_meta${meta_sim_model}"
    if [ ! -d "$meta_work_dir" ]; then
        mkdir -p "$meta_work_dir"
        echo "$meta_work_dir created"
    else
        rm_mlruns_pkl $meta_work_dir
    fi
    cp $DDGDA_DIR/workflow.py $meta_work_dir
    # change gdbt to lightgbm
    if [ "$meta_sim_model" = "gbdt" ]; then
        config_file_name="lightgbm"
    elif [ "$meta_sim_model" = "linear" ]; then
        config_file_name="linear"
    else
        echo "Invalid meta_sim_model"
        exit 1
    fi
    cd $meta_work_dir && python workflow.py --conf_path=$QLIB_YAML_DIR/${data_type}/workflow_config_${config_file_name}_Alpha158.yaml --train_meta=Ture --working_dir=$meta_work_dir --sim_task_model=$meta_sim_model --meta_exp_name=${data_type}_dg_meta${meta_sim_model} run > $meta_work_dir/pretrain.log 2>&1
}

run_meta_func "linear" "nd"
# run_meta_func "gbdt" "nd"
# run_meta_func "gbdt" "loer"
# run_meta_func "linear" "loer"