#!/bin/bash


incip(){
    ip=$1
    IFS='.' read -r -a octt <<< "$ip"

    octt[3]=$((octt[3] + 1))

    ip_incrementato="${octt[0]}.${octt[1]}.${octt[2]}.${octt[3]}"
    echo $ip_incrementato
    
}

SCANNER_PATH=sshscan

if ! which ping;
then
    echo "[*] Installing ping utils"
    apt-get install -y iputils-ping
fi

echo "[*] Generating user file..."

cat << EOF > "$SCANNER_PATH/users.txt"
admin
willy
root
EOF

echo "[*] Generating password file..."

cat << EOF > "$SCANNER_PATH/pwd.txt"
admin
root
password
password123
gandalf
EOF

cat << EOF > $SCANNER_PATH/goscan.sh
#!/bin/bash

EOF

for hstnum in $(seq 1 5);
do
    ip=$(ping -c 1 ssh-server$hstnum | grep -oE '[0-9]+\.[0-9]+\.[0-9]+\.[0-9]+' | head -n1 |  awk '{print $1}')
    incip=$(incip $ip)
    echo "python sshscan.py scan $ip $incip users.txt pwd.txt -v -t 5 -c 2 -c \"ls -all\"" >> $SCANNER_PATH/goscan.sh
done


cd $SCANNER_PATH && chmod +x goscan.sh
./goscan.sh