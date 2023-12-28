#!/bin/bash

rm -rf sshscan
git clone https://github.com/killercd/sshscan.git
cd sshscan
pip install -r requirements.txt