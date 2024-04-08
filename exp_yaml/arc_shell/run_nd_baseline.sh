cur_time() {
    date "+%Y%m%d%H%M%S%N"
}
NEW_DATA_DIR=$QLIB_YAML_DIR/new_data/workflow_config_
NEW_DATA_LOG_DIR=$QLIB_EXP_LOG/nd_ro
if [ ! -d $NEW_DATA_LOG_DIR ]; then
    mkdir -p $NEW_DATA_LOG_DIR
fi
