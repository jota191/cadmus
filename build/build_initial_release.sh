#!/usr/bin/env bash
# This is intended to be executed inside an fbs-created Ubuntu VM
# run `fbs buildvm ubuntu` and `fbs runvm ubuntu`, then invoke this script

tar -xvf zlib-1.2.9.tar.gz
cd zlib-1.2.9
sudo -s
./configure; make; make install
cd /lib/x86_64-linux-gnu
ln -s -f /usr/local/lib/libz.so.1.2.9/lib libz.so.1
rm -rf zlib-1.2.9
cd ~/cadmus

pip install -r requirements.txt
fbs freeze
cp src/main/python/librnnoise_ladspa.so target/cadmus
fbs installer