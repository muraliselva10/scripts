accountname=$1
sgid=`awk -F: '$3>100&&$3<500{print $3}' /etc/group | sort -n | tail -1 | awk '{print $1+1}'`
suid=`awk -F: '$3>100&&$3<500{print $3}' /etc/passwd | sort -n | tail -1 | awk '{print $1+1}'`
addgroup --gid $sgid $accountname
useradd -u $suid -g $sgid -s /bin/false -r $accountname
