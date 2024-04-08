rm_mlruns_pkl() {
    rm -rf $1/mlruns
    rm -rf $1/*.pkl
}

# if [ ! -d "$QLIB_EXP_LOG/nd_dg_metalr" ]; then
#     mkdir -p "$QLIB_EXP_LOG/nd_dg_metalr"
#     echo "$QLIB_EXP_LOG/nd_dg_metalr created"
# else
#     rm_mlruns_pkl $QLIB_EXP_LOG/nd_dg_metalr
# fi
# cp $DDGDA_DIR/workflow.py $QLIB_EXP_LOG/nd_dg_metalr
# cd $QLIB_EXP_LOG/nd_dg_metalr && python workflow.py --conf_path=$QLIB_YAML_DIR/nd/workflow_config_linear_Alpha158.yaml --train_meta=Ture --working_dir=$QLIB_EXP_LOG/nd_dg_metalr --sim_task_model=linear --meta_exp_name=nd_dg_metalr run > $QLIB_EXP_LOG/nd_dg_metalr/pretrain.log 2>&1 &
 
# if [ ! -d "$QLIB_EXP_LOG/nd_dg_metalgb" ]; then
#     mkdir -p "$QLIB_EXP_LOG/nd_dg_metalgb"
#     echo "$QLIB_EXP_LOG/nd_dg_metalgb created"
# else
#     rm_mlruns_pkl $QLIB_EXP_LOG/nd_dg_metalgb
# fi
# cp $DDGDA_DIR/workflow.py $QLIB_EXP_LOG/nd_dg_metalgb
# cd $QLIB_EXP_LOG/nd_dg_metalgb && python workflow.py --conf_path=$QLIB_YAML_DIR/nd/workflow_config_lightgbm_Alpha158.yaml --train_meta=Ture --working_dir=$QLIB_EXP_LOG/nd_dg_metalgb --sim_task_model=gbdt --meta_exp_name=nd_dg_metalgb run > $QLIB_EXP_LOG/nd_dg_metalgb/pretrain.log 2>&1

# if [ ! -d "$QLIB_EXP_LOG/loer_dg_metalr" ]; then
#     mkdir -p "$QLIB_EXP_LOG/loer_dg_metalr"
#     echo "$QLIB_EXP_LOG/loer_dg_metalr created"
# else
#     rm_mlruns_pkl $QLIB_EXP_LOG/loer_dg_metalr
# fi
# cp $DDGDA_DIR/workflow.py $QLIB_EXP_LOG/loer_dg_metalr
# cd $QLIB_EXP_LOG/loer_dg_metalr && python workflow.py --conf_path=$QLIB_YAML_DIR/loer/workflow_config_linear_Alpha158.yaml --train_meta=Ture --working_dir=$QLIB_EXP_LOG/loer_dg_metalr --sim_task_model=linear --meta_exp_name=loer_dg_metalr run > $QLIB_EXP_LOG/loer_dg_metalr/pretrain.log 2>&1

# if [ ! -d "$QLIB_EXP_LOG/loer_dg_metalgb" ]; then
#     mkdir -p "$QLIB_EXP_LOG/loer_dg_metalgb"
#     echo "$QLIB_EXP_LOG/loer_dg_metalgb created"
# else
#     rm_mlruns_pkl $QLIB_EXP_LOG/loer_dg_metalgb
# fi
# cp $DDGDA_DIR/workflow.py $QLIB_EXP_LOG/loer_dg_metalgb
# cd $QLIB_EXP_LOG/loer_dg_metalgb && python workflow.py --conf_path=$QLIB_YAML_DIR/loer/workflow_config_lightgbm_Alpha158.yaml --train_meta=Ture --working_dir=$QLIB_EXP_LOG/loer_dg_metalgb --sim_task_model=gbdt --meta_exp_name=loer_dg_metalgb run > $QLIB_EXP_LOG/loer_dg_metalgb/pretrain.log 2>&1

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
    # cd $meta_work_dir && python workflow.py --conf_path=$QLIB_YAML_DIR/${data_type}/workflow_config_${config_file_name}_Alpha158.yaml --train_meta=Ture --working_dir=$meta_work_dir --sim_task_model=$meta_sim_model --meta_exp_name=${data_type}_dg_meta${meta_sim_model} run
}

run_meta_func "linear" "nd"
run_meta_func "gbdt" "nd"
run_meta_func "gbdt" "loer"
run_meta_func "linear" "loer"