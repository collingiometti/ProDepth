# CUDA_VISIBLE_DEVICES=4 \
DATA_PATH="./kitti_data"
model_name="prodepth_kitti"
PY_ARGS=${@:3}

EXP_DIR=./log
LOG_DIR=$EXP_DIR/$model_name

for ((i=19; i<=19; i++))
do
    python -m ProDepth.evaluate_kitti_depth \
        --data_path $DATA_PATH \
        --dataset kitti \
        --load_weights_folder $EXP_DIR/$model_name/models/weights_19\
        --height 192 \
        --width 640 \
        --batch_size 1 \
        --eval_split eigen \
        --eval_mono \
        --encoder lite \
        --log_dir $EXP_DIR/$model_name \
        --png \
        $PY_ARGS | tee -a $EXP_DIR/$model_name/log_test.txt
done
