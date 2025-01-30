#!/bin/bash

# Get the number of NVIDIA GPUs
NUM_GPUS=$(nvidia-smi --query-gpu=name --format=csv,noheader | wc -l)

# Create a new tmux session
SESSION_NAME="train"
tmux new-session -d -s $SESSION_NAME

# Create the first window for nvidia-smi
tmux rename-window -t $SESSION_NAME:0 "nvidia-smi"
tmux send-keys -t $SESSION_NAME:0 "watch -n 0.1 nvidia-smi" C-m

# Create windows for each GPU
for (( i=0; i<$NUM_GPUS; i++ ))
do
    WINDOW_NAME="GPU$i"
    tmux new-window -t $SESSION_NAME -n $WINDOW_NAME
    tmux send-keys -t $SESSION_NAME:$((i+1)) "export CUDA_VISIBLE_DEVICES=$i" C-m
done

# Attach to the tmux session
tmux attach -t $SESSION_NAME