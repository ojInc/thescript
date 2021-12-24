LOGFILE=$HOME/logs/installPartDB-`date +%Y-%m-%d_%Hh%Mm`.log

echo "Start Micropython installatie"  2>&1 | tee -a $LOGFILE
# origineel --> https://www.raspberrypi.org/forums/viewtopic.php?t=191744
sudo apt-get install -y git build-essential libffi-dev
cd ~
git clone https://github.com/micropython/micropython.git 2>&1 | tee -a $LOGFILE
cd ~ && cd micropython/mpy-cross
make 2>&1 | tee -a $LOGFILE
cd ~/micropython/ports/unix/
make clean 2>&1 | tee -a $LOGFILE
make axtls 2>&1 | tee -a $LOGFILE
make 2>&1 | tee -a $LOGFILE
sudo ln -s ~/micropython/ports/unix/micropython /usr/local/bin/micropython
echo "START micropython module intstall" 2>&1 | tee -a $LOGFILE
micropython  -m upip install micropython-urequests 2>&1 | tee -a $LOGFILE
micropython  -m upip install micropython-socket 2>&1 | tee -a $LOGFILE
micropython  -m upip install micropython-machine 2>&1 | tee -a $LOGFILE
micropython  -m upip install micropython-os.path 2>&1 | tee -a $LOGFILE
micropython  -m upip install micropython-umqtt.robust 2>&1 | tee -a $LOGFILE
micropython  -m upip install micropython-pwd 2>&1 | tee -a $LOGFIL 2>&1 | tee -a $LOGFILEE
micropython  -m upip install micropython-smtplib
echo "EINDE micropython $(micropython -V) module install" 2>&1 | tee -a $LOGFILE

