#!/bin/bash

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "======================================="
echo "$dt. Starting container..."

cd $APP_DIR
echo "App dir: $APP_DIR"

# Check if node modules folder exists
if [ ! -d "node_modules" ]; then
  if [ -f "yarn.lock"]; then
    yarn install
  elif [ -f "packag-lock.json"]; then
    npm install
  else
    yarn install
  fi
fi

ember server