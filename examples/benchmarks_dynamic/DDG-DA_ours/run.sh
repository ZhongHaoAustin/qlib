if [ ! -d "znorm" ]; then
  mkdir znorm
fi

CUDA_VISIBLE_DEVICES=1 python -u workflow.py run_offline --forecast_model GRU --alpha 158 --alpha2 158  --market csi300 --rank_label False > znorm/offline_csi300_158_ic_158.log 2>&1
CUDA_VISIBLE_DEVICES=1 python -u workflow.py run_online --forecast_model GRU --alpha 360 --alpha2 158  --market csi300 --rank_label False > znorm/gru_csi300_360_ic_158.log 2>&1
CUDA_VISIBLE_DEVICES=1 python -u workflow.py run_online --forecast_model LSTM --alpha 360 --alpha2 158 --market csi300 --rank_label False > znorm/lstm_csi300_360_ic_158.log 2>&1
CUDA_VISIBLE_DEVICES=1 python -u workflow.py run_online --forecast_model ALSTM --alpha 360 --alpha2 158 -market csi300 --rank_label False > znorm/alstm_csi300_360_ic_158.log 2>&1
CUDA_VISIBLE_DEVICES=1 python -u workflow.py run_online --forecast_model Transformer --alpha 360 --alpha2 158  --market csi300 --rank_label False > znorm/tfm_csi300_360_ic_158.log 2>&1

if [ ! -d "rank_norm" ]; then
  mkdir rank_norm
fi

CUDA_VISIBLE_DEVICES=1 python -u workflow.py run_online --forecast_model GRU --alpha 360 --alpha2 158  --market csi300 --rank_label True > rank_norm/gru_csi300_360_ic_158.log 2>&1
CUDA_VISIBLE_DEVICES=1 python -u workflow.py run_online --forecast_model LSTM --alpha 360 --alpha2 158 --market csi300 --rank_label True > rank_norm/lstm_csi300_360_ic_158.log 2>&1
CUDA_VISIBLE_DEVICES=1 python -u workflow.py run_online --forecast_model ALSTM --alpha 360 --alpha2 158 -market csi300 --rank_label True > rank_norm/alstm_csi300_360_ic_158.log 2>&1
CUDA_VISIBLE_DEVICES=1 python -u workflow.py run_online --forecast_model Transformer --alpha 360 --alpha2 158  --market csi300 --rank_label True > rank_norm/tfm_csi300_360_ic_158.log 2>&1
