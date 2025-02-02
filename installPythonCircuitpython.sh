#/usr/bin/sh
LOGFILE=$HOME/logs/installPythonCircuitpython-`date +%Y-%m-%d`.log
mkdir $HOME/logs/

bash ./installNutsfuncties.sh 2>&1 | tee -a $LOGFILE

for addonnodes in gpio dialout
sudo adduser pi gpio 2>&1 | tee -a $LOGFILE
sudo usermod pi dialout 2>&1 | tee -a $LOGFILE
sudo usermod pi i2c  2>&1 | tee -a $LOGFILE
sudo usermod pi tty  2>&1 | tee -a $LOGFILE


echo "Installeer nieuwe python3 virtuale omgeving" 2>&1 | tee -a $LOGFILE
source ~/venv/venv3.7/bin/activate 
time python -m ensurepip  2>&1 | tee -a $LOGFILE

time wget https://raw.githubusercontent.com/adafruit/Raspberry-Pi-Installer-Scripts/master/raspi-blinka.py 2>&1 | tee -a $LOGFILE
python3 raspi-blinka.py 2>&1 | tee -a $LOGFILE

sudo raspi-config nonint do_i2c 0

for addonnodes in  do_i2c  do_spi do_serial do_ssh do_camera disable_raspi_config_at_boot  ; do
    printstatus "CircuitPython activeren  : \"${addonnodes}\""
    sudo raspi-config nonint ${addonnodes} 2>&1 | tee -a $LOGFILE
done

for addonnodes in wiringpi adafruit-python-shell adafruit-blinka adafruit-micropython-blinka adafruit-circuitpython-ble-adafruit adafruit-circuitpython-neopixel adafruit-circuitpython-ina219 adafruit-circuitpython-tinylora adafruit-circuitpython-ssd1306  DotStar_Emulator \
                  adafruit-circuitpython-miniqr adafruit-circuitpython-turtle adafruit-circuitpython-74hc595 adafruit-circuitpython-display-button adafruit-circuitpython-mpu6050 adafruit-circuitpython-ina260 adafruit-circuitpython-ssd1306 adafruit-circuitpython-ble  adafruit-circuitpython-ble-heart-rate adafruit-circuitpython-ble-broadcastnet adafruit-circuitpython-binascii  adafruit-circuitpython-onewire adafruit-circuitpython-motor  adafruit-circuitpython-hts221 adafruit-circuitpython-midi adafruit-circuitpython-bmp280  adafruit-circuitpython-bme680 adafruit-circuitpython-dotstar  adafruit-circuitpython-max7219 adafruit-circuitpython-display-text adafruit-circuitpython-rfm69 adafruit-circuitpython-dht adafruit-circuitpython-ble-apple-media adafruit-circuitpython-bme280 adafruit-circuitpython-bitbangio adafruit-circuitpython-led-animation adafruit-circuitpython-ble-midi adafruit-circuitpython-sd adafruit-circuitpython-neopixel adafruit-circuitpython-hid adafruit-circuitpython-gps  adafruit-circuitpython-rfm9x  circuitpython-base64 circuitpython-base64 circuitpython-esp32connection adafruit-circuitpython-ble-radio circuitpython-nrf24l01 thonny-circuitpython  \
                  Adafruit_Libraries Adafruit-PCA9685 Adafruit-GPIO  raspiSensors  oled-text  pi-ina219 adafruit-ads1x15 adafruit-pureio  OctoPyClient tentacle ledDriver  ampy micropython-uploader adafruit-circuitpython-ht16k33 \
                  msteamsconnector matplotlib numpy imutils pyodbc  Adafruit-GPIO SQLAlchemy aniso8601 croniter flask-restful flask-sqlalchemy natsort pih2o python-dateutil pytz  ; do
    printstatus "Installeren CircuitPython bibliotheek: \"${addonnodes}\""
    pip install $NQUIET --upgrade ${addonnodes} 2>&1 | tee -a $LOGFILE
done

python demo/blinkatest.py  2>&1 | tee -a $LOGFILE &
python demo/ina219demo.py  2>&1 | tee -a $LOGFILE &
# python demo/oatmealDemo.py
echo "" 2>&1 | tee -a $LOGFILE
echo "Circuitpython install afgerond.  Test met: python3 ./demo/blinkatest.py" 2>&1 | tee -a $LOGFILE
echo "" 2>&1 | tee -a $LOGFILE
