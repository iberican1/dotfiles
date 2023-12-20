#!/bin/zsh

# Create a tmux session named "mylayout"
tmux new-session -d -s mylayout

# Split the terminal vertically
tmux split-window -v -p 50

# Split the top pane horizontally
tmux split-pane -h -p 50

# Resize the panes
tmux resize-pane -t 0 -x 500 -y 500
tmux resize-pane -t 1 -x 500 -y 500
tmux resize-pane -t 2 -y 300

# Launch kitty in each pane
tmux send-keys -t 0 'kitty' C-m
tmux send-keys -t 1 'kitty' C-m
tmux send-keys -t 2 'kitty' C-m

# Attach to the tmux session
tmux attach-session -t mylayout
