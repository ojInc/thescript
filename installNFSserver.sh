_id1=$(id pi)
_hn1=$(hostname)
_ip1=$(hostname -I)

mkdir ~/tmp
printf "\nStart instellen van NFS server op \n" $_ip1 ".local\n"
sudo apt install -y nfs-kernel-server nfs-common
sudo mkdir /mnt/nfs
sudo chown -R nobody:nogroup /mnt/nfs
sudo cp /etc/exports ~/tmp/exp1.tmp
sudo exportfs -ra
sudo service nfs-server restart
sudo service rpcbind restart
sudo service nfs-kernel-server restart 

sudo mkdir -p /mnt/nfs/acer01/
sudo mkdir -p /mnt/nfs/pi0/
sudo mkdir -p /mnt/nfs/pivhere/
sudo mkdir -p /mnt/nfs/dietpi/
sudo mkdir -p /mnt/nfs/pi4/
sudo mkdir -p /mnt/nfs/pilamp/
sudo mkdir -p /mnt/nfs/spelen02/
sudo mkdir -p /mnt/nfs/p1mon/
sudo mkdir -p /mnt/nfs/retropie/
sudo mkdir -p /mnt/nfs/pi07/
sudo mkdir -p /mnt/nfs/pi08/

sudo chmod 777 -R /mnt/nfs/

printf "\nProbeer netwerk share te mount op /mnt\n"
sudo mount -t auto acer01:/home /mnt/nfs/acer01/ &
sudo mount -t auto pi0:/home /mnt/nfs/pi0/ &
sudo mount -t auto pivhere:/home /mnt/nfs/pivhere/ &
sudo mount -t auto pi04:/home /mnt/nfs/pi4/ &
sudo mount -t auto pilamp:/home /mnt/nfs/pilamp/ &
sudo mount -t auto spelen02:/home /mnt/nfs/spelen02/ &
sudo mount -t auto p1mon:/home /mnt/nfs/p1mon/ &
sudo mount -t auto retropie:/home /mnt/nfs/retropie/ &
sudo mount -t auto pi07:/home /mnt/nfs/pi07/ &
sudo mount -t auto pi08:/home /mnt/nfs/pi08/ &

echo "/home *(rw,all_squash,insecure,async,no_subtree_check)" | sudo tee -a /etc/exports

sudo printf "\n HANDMATIG toevoegen aan /etc/exports/  : \n/home *(rw,all_squash,insecure,async,no_subtree_check)\n"
printf "\nNFS bestanddeling is daarna bereikbaar:\n -- MacOS verbind aan nfs://$_hn1.local/nfsshare  of nfs://$_ip1/nfsshare \n -- Windows verbind aan //$ip1.local/nfsshare\n\nIP adres $_ip1\n"
printf "\nHandmatig uitvoeren:\n  sudo service nfs-server restart\n"
sudo service nfs-server restart


