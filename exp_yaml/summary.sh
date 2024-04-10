# dir_name=("baseline" "nd_ro" "loer_ro" "nd_dg_metalinear" "loer_dg_metalinear" "nd_dg_metagbdt" "loer_dg_metagbdt")

dir_name=("baseline" "nd_ro" "nd_dg_metalinear" "nd_dg_metagbdt" "loer_ro" "loer_dg_metalinear" "loer_dg_metagbdt")

SUMMARY_LOG="$QLIB_EXP_LOG/summary.log"

if [ -f $SUMMARY_LOG ]; then
    rm $SUMMARY_LOG
fi

for dir in "${dir_name[@]}"
do
    echo "--------------------------------------------" >> $SUMMARY_LOG
    echo "Summary for $dir" >> $SUMMARY_LOG
    echo "--------------------------------------------" >> $SUMMARY_LOG
    # skip pretrain.log
    for file in $(find $QLIB_EXP_LOG/$dir -name "*.log")
    do
        if [[ $file == *"pretrain.log"* ]]; then
            continue
        fi
        echo "Model: $file" >> $SUMMARY_LOG
        cat $file | grep annualized_return | tee -a $SUMMARY_LOG
    done
    echo "--------------------------------------------" >> $SUMMARY_LOG
    echo "" >> $SUMMARY_LOG
done