_hn="http://"$(hostname).local":8123"
echo "Installeren Homeassistant"
virtualenv ~/venv/homeassistant
source ~/venv/homeassistant/bin/activate
pip3 install homeassistant
sudo echo "source /home/pi/venv/homeassistant/bin/activate" >> /usr/local/bin/homeassistant
sudo chmod +x /usr/local/bin/homeassistant
sudo echo "/home/pi/venv/homeassistant/bin/hass" >> /usr/local/bin/homeassistant
recho "pip install --upgrade pip homebridge"
sudo systemctl enable homeassistant.service
sudo service homeassistant restart

sudo echo "/home/pi/venv/homeassistant/bin/hass" >> /usr/local/bin/homeassistant
sudo echo "source /home/pi/venv/venv3.7/bin/activate"  >> /usr/local/bin/homeassistant

printf "\nStart homeassitant op http://$_hn.local:8123\n"
