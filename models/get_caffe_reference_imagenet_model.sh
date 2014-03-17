#!/usr/bin/env sh
# This scripts downloads the caffe reference imagenet model
# for ilsvrc image classification and deep feature extraction

MODEL=caffe_reference_imagenet_model
CHECKSUM=bf44bac4a59aa7792b296962fe483f2b

if [ -f $MODEL ]; then
  echo "Model already exists. Checking md5..."
  checksum=`md5sum $MODEL | awk '{ print $1 }'`
  if [ "$checksum" = "$CHECKSUM" ]; then
    echo "Model checksum is correct. No need to download."
    exit 0
  else
    echo "Model checksum is incorrect. Need to download again."
  fi
fi

echo "Downloading..."

wget -q https://www.dropbox.com/s/n3jups0gr7uj0dv/$MODEL

echo "Done. Please check that the checksum = $CHECKSUM."
