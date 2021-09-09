_id1=$(id pi)
_hn1=$(hostname)
_ip1=$(hostname -I)
printf "\nStart instellen van NFS server op \n" $_ip1 ".local\n"
sudo apt-get install -y nfs-kernel-server nfs-common
sudo mkdir /mnt/nfsshare
sudo chown -R pi:pi /mnt/nfsshare
sudo find /mnt/nfsshare/ -type d -exec chmod 755 {} \;
sudo find /mnt/nfsshare/ -type f -exec chmod 644 {} \;
sudo cp /etc/exports ~/exp1.tmp

sudo printf "\n HANDMATIG toevoegen aan /etc/exports/  : \n/mnt/nfsshare *(rw,all_squash,insecure,async,no_subtree_check,anonuid=1000,anongid=1000)\n"
sudo exportfs -ra
printf "\nNFS bestanddeling is ingesteld\n -- MacOS verbind aan nfs://$_hn1.local/nfsshare  of nfs://$_ip1/nfsshare \n -- Windows verbind aan //$ip1.local/nfsshare\n\nIP adres $_ip1\n"
sudo service nfs-server restart
printf "\nHandmatig uitvoeren:\n  sudo service nfs-server restart\n"
