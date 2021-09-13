iLOGFILE=$HOME/$0-`date +%Y-%m-%d_%Hh%Mm`.log

printl() {
	printf $1
	echo -e $1 >> $LOGFILE
}

printstatus() {
    Obtain_Cpu_Temp
    h=$(($SECONDS/3600));
    m=$((($SECONDS/60)%60));
    s=$(($SECONDS%60));
    printf "\r\n${BIGreen}==\r\n== ${BIYellow}$1"
    printf "\r\n${BIGreen}== ${IBlue}Total: %02dh:%02dm:%02ds Cores: $ACTIVECORES Temperature: $CPU_TEMP_PRINT \r\n${BIGreen}==${IWhite}\r\n\r\n"  $h $m $s;
	echo -e "############################################################" >> $LOGFILE
	echo -e $1 >> $LOGFILE
}

printstatus "Welkom, setup een nieuwe Raspbian of Ubunto omgeving"


AQUIET="-qq"
NQUIET="-s"
export npm_config_loglevel=silent

echo "alias ls='ls -F --color=auto'" >> ~/.bashrc
echo "alias ll='ls -lF --color=auto'" >> ~/.bashrc
echo "alias la='ls -lFa --color=auto'" >> ~/.bashrc
echo "alias l='ls -F --color=auto'" >> ~/.bashrc

sudo apt install -y git
sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install -y p7zip-full mc sqlite3  i2c-tools ncftp
sudo apt install -y mariadb-server mariadb-client
sudo apt install -y python3 python3-pip python-smbus gedit gparted
sudo apt-get install -y nodejs npm tightvncserver pure-ftpd
sudo apt install -y wiringpi 
sudo apt install -y rpi.gpio
sudo apt-get install -y apache2 php php-mysql php-sqlite3 php-mbstring openssl libapache2-mod-php php-sqlite3 php-xml php-mbstring
sudo apt install -y mosquitto

sudo apt install -y python3-pip

mkdir ~/venv
pip3 install virtualenv
mkdir ~/venv
~/.local/bin/virtualenv ~/venv/venv3.7
echo "source ~/venv/venv3.7/bin/activate" >> ~/.bashrc
source ~/.bashrc

echo "doen usermod"
sudo usermod -aG gpio pi
sudo usermod -aG dialout pi
sudo usermod -aG i2c pi
sudo usermod -aG tty pi

sudo adduser pi gpio
sudo usermod pi dialout
sudo usermod pi i2c
sudo usermod pi tty

sudo apt install -y build-essential cmake rapidjson-dev libgmp-dev libcurl4-gnutls-dev git gcc-8 g++-8
sudo apt install -y libssl

sudo adduser michiele
sudo adduser pi michiele
sudo usermod pi michiele
sudo usermod pi michiele
sudo usermod pi michiele

sudo usermod -aG sudo michiele
sudo usermod -aG sudo pi
sudo usermod -aG gpio michiele
sudo usermod -aG dialout michiele
sudo usermod -aG i2c michiele
sudo usermod -aG spi michiele
sudo usermod -aG tty michiele

echo "Je moet nu REBOOT, daarna ./installVerzamelupdates.sh draaien"

#bash ./setupNodered.sh
