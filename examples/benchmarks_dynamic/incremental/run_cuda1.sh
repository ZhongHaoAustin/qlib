cur_time=$(date "+%Y%m%d.%H%M%S")
log_dir="./csi500.logs.$cur_time"
if [ ! -d $log_dir ]; then
    mkdir $log_dir
fi
CUDA_VISIBLE_DEVICES=1 python -u main.py run_all --forecast_model GRU         -num_head 8 --train_start='2008-01-01' --train_end='2018-12-31' --valid_start='2019-01-01' --valid_end='2020-03-31' --test_start='2020-04-01' --test_end='2024-03-31' --tau 10 --lr_da 0.01  --market csi500 --data_dir crowd_data --rank_label False --begin_valid_epoch 30 > $log_dir/gru500.log 2>&1
CUDA_VISIBLE_DEVICES=1 python -u main.py run_all --forecast_model LSTM        -num_head 8 --train_start='2008-01-01' --train_end='2018-12-31' --valid_start='2019-01-01' --valid_end='2020-03-31' --test_start='2020-04-01' --test_end='2024-03-31' --tau 10 --lr_da 0.01  --market csi500 --data_dir crowd_data --rank_label False --begin_valid_epoch 20 > $log_dir/lstm500.log 2>&1
CUDA_VISIBLE_DEVICES=1 python -u main.py run_all --forecast_model ALSTM       -num_head 8 --train_start='2008-01-01' --train_end='2018-12-31' --valid_start='2019-01-01' --valid_end='2020-03-31' --test_start='2020-04-01' --test_end='2024-03-31' --tau 10 --lr_da 0.01  --market csi500 --data_dir crowd_data --rank_label False --begin_valid_epoch 30 > $log_dir/alstm500.log 2>&1
CUDA_VISIBLE_DEVICES=1 python -u main.py run_all --forecast_model Transformer -num_head 8 --train_start='2008-01-01' --train_end='2018-12-31' --valid_start='2019-01-01' --valid_end='2020-03-31' --test_start='2020-04-01' --test_end='2024-03-31' --tau 10 --lr_da 0.001 --market csi500 --data_dir crowd_data --rank_label False --begin_valid_epoch 20 > $log_dir/tfm500.log 2>&1
