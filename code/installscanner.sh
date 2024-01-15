#!/bin/bash

rm -rf sshscan
git clone https://github.com/killercd/sshscan.git
cd sshscan
pip install -r requirements.txt
cd -


rm -rf ssh_user_enum
#git clone https://github.com/nccgroup/ssh_user_enum.git



rm -rf sshenum

git clone https://github.com/sodomak/sshenum.git

cat << EOF > sshenum/user.txt
bonito
lovvo
scudento
willy
ninjagrum
wonka
kivmas
agamennonx
ibiscus
root
EOF
