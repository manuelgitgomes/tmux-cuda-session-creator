#!/usr/bin/bash


SCRIPT_DIR=$( cd -- "$( dirname -- "${BASH_SOURCE[0]}" )" &> /dev/null && pwd )
EXEC_FILE=~/.local/bin/tmux-create

if [ -e $EXEC_FILE ]; then
  echo "File already exist in $EXEC_FILE. Confirm removing to continue ..."
  rm $EXEC_FILE -i
  if [ -e $EXEC_FILE ]; then
    exit 1
  fi
fi

echo "#!/usr/bin/bash" >> $EXEC_FILE
echo "exec $SCRIPT_DIR/tmux-creator.sh \$1" >> $EXEC_FILE 

chmod u+x $EXEC_FILE
