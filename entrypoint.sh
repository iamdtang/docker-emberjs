#!/bin/sh

dt=$(date '+%d/%m/%Y %H:%M:%S');
echo "======================================="
echo "$dt. Starting container..."

cd $APP_DIR

echo "Lets make sure your dependencies are installed"

if [ -f yarn.lock ]; then
  yarn install
elif [ -f package-lock.json ]; then
  npm install
else
  yarn install
fi

if [ -f bower.json ]; then
  echo "Installing Bower dependencies..."
  bower install & wait
fi

echo "Starting ember server: "
ember server
