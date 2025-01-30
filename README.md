# tmux-cuda-session-creator
A simple script to create a tmux session with multiple windows for development with CUDA GPUs.

It create a tmux session with the following windows:
1. A window with `nvidia-smi` running continuously, to monitor the GPU usage.
2. A window for each GPU detected, with the `CUDA_VISIBLE_DEVICES` environment variable set to the GPU index.

![Example](docs/example.png)

And that's it! You can now run your code in the terminal windows of the GPUs you want to use.

To use it, just run the script:
```bash
./tmux-creator.sh
```
