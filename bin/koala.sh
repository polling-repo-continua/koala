#!/bin/sh

DIR=$HOME/.koala

# Run
if [ "$1" ]; then
  cat $DIR/src/info.txt
  docker run --rm -h koala -it alexfgrdo/koala /bin/bash

# Build
elif [ "$1" == "-b" ]; then
  cat $DIR/src/info.txt
  docker build --rm --no-cache -t alexfgrdo/koala $DIR/

# Edit
elif [ "$1" == "-e" ]; then
  vim $DIR/Dockerfile

# Help
elif [ "$1" == "-h" ]; then
  cat $DIR/src/info.txt
  cat $DIR/src/help.txt

# Kill
elif [ "$1" == "-k" ]; then
  docker container kill alexfgrdo/koala

# Remove container
elif [ "$1" == "-r" ]; then
  docker container kill alexfgrdo/koala
  docker container rm alexfgrdo/koala

# Remove container and image
elif [ "$1" == "-R" ]; then
  docker container kill alexfgrdo/koala
  docker container rm alexfgrdo/koala
  docker image rm alexfgrdo/koala

# Upgrade
elif [ "$1" == "-u" ]; then
  chmod +x $DIR/bin/upgrade.sh
  sh $DIR/bin/upgrade.sh

# Uninstall
elif [ "$1" == "-uninstall" ]; then
  chmod +x $DIR/bin/uninstall.sh
  sh $DIR/bin/uninstall.sh

# Version
elif [ "$1" == "-v" ]; then
  cat $DIR/src/version.txt

# Unkown argument
else
  echo "Unknown option argument"
fi
