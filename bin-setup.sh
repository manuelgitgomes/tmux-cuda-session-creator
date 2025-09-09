#!/bin/bash

# Get script directory and executable file path
SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
EXEC_FILE=~/.local/bin/tmux-creator


# Create file ~/.local/bin
if [ -e $EXEC_FILE ]; then
  echo "File already exist in $EXEC_FILE. Confirm removing to continue ..."
  rm $EXEC_FILE -i
  if [ -e $EXEC_FILE ]; then
    exit 1
  fi
fi

# Create a symlink 
ln -s $SCRIPT_DIR/tmux-creator.sh $EXEC_FILE
