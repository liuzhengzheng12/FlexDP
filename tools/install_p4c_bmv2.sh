#! /bin/bash
git clone https://github.com/p4lang/p4c-bm.git p4c-bmv2
cd p4c-bmv2
sudo pip install -r requirements.txt
sudo python setup.py install