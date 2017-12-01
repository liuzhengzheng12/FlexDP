#! /bin/bash
git clone https://github.com/p4lang/behavioral-model.git bmv2
cd bmv2
./install_deps.sh
./autogen.sh
./configure
make -j8
sudo make install