# Script to install and setup environment for ESP8266 Arduino development with Makefiles

# make sure YAML is installed
#sudo apt-get update
#sudo apt-get install libconfig-yaml-perl

declare ARDUINO_VER=1.6.5-r5
declare ESP8266_VER=2.0.0
declare MKSPIFFS_VER=0.1.2
declare ESPTOOL_VER=0.4.6

# save anything that is downloaded for faster reinstalls
declare DOWNLOAD_CACHE=../download
mkdir $DOWNLOAD_CACHE

# Get MKSPIFFS Tool
cp -np $DOWNLOAD_CACHE/mkspiffs-$MKSPIFFS_VER-linux64.tar.gz .
wget --no-clobber https://github.com/igrr/mkspiffs/releases/download/$MKSPIFFS_VER/mkspiffs-$MKSPIFFS_VER-linux64.tar.gz
tar xvfz mkspiffs-$MKSPIFFS_VER-linux64.tar.gz
mv mkspiffs-$MKSPIFFS_VER-linux64/mkspiffs bin
rmdir mkspiffs-$MKSPIFFS_VER-linux64
mv mkspiffs-$MKSPIFFS_VER-linux64.tar.gz $DOWNLOAD_CACHE
chmod +x bin/mkspiffs

# Get Xtensa GCC Compiler
cp -np $DOWNLOAD_CACHE/linux64-xtensa-lx106-elf-gb404fb9.tar.gz .
wget --no-clobber http://arduino.esp8266.com/linux64-xtensa-lx106-elf-gb404fb9.tar.gz
cp linux64-xtensa-lx106-elf-gb404fb9.tar.gz $DOWNLOAD_CACHE
tar xvfz linux64-xtensa-lx106-elf-gb404fb9.tar.gz
rm linux64-xtensa-lx106-elf-gb404fb9.tar.gz

# Get ESPTOOL
cp -np $DOWNLOAD_CACHE/esptool-$ESPTOOL_VER-linux64.tar.gz .
wget --no-clobber https://github.com/igrr/esptool-ck/releases/download/$ESPTOOL_VER/esptool-$ESPTOOL_VER-linux64.tar.gz
cp esptool-$ESPTOOL_VER-linux64.tar.gz $DOWNLOAD_CACHE
tar xvfv esptool-$ESPTOOL_VER-linux64.tar.gz
mv esptool-$ESPTOOL_VER-linux64/esptool bin
rmdir esptool-$ESPTOOL_VER-linux64
chmod +x bin/esptool
mv esptool-$ESPTOOL_VER-linux64.tar.gz $DOWNLOAD_CACHE

# Get Arduino IDE
cp -p $DOWNLOAD_CACHE/arduino-$ARDUINO_VER-linux64.tar.xz .
wget --no-clobber http://arduino.cc/download.php?f=/arduino-$ARDUINO_VER-linux64.tar.xz -O arduino-$ARDUINO_VER-linux64.tar.xz
cp -np arduino-$ARDUINO_VER-linux64.tar.xz $DOWNLOAD_CACHE
unxz arduino-$ARDUINO_VER-linux64.tar.xz
tar xvf arduino-$ARDUINO_VER-linux64.tar
rm arduino-$ARDUINO_VER-linux64.tar

# Get Arduino core for ESP8266 chip
cp -np $DOWNLOAD_CACHE/esp8266-$ESP8266_VER.zip .
wget --no-clobber https://github.com/esp8266/Arduino/releases/download/$ESP8266_VER/esp8266-$ESP8266_VER.zip
cp -np esp8266-$ESP8266_VER.zip $DOWNLOAD_CACHE
unzip esp8266-$ESP8266_VER.zip
rm esp8266-$ESP8266_VER.zip

# Copy ESP8266_Arduino Libraries
mkdir -p arduino-$ARDUINO_VER/hardware/esp8266com
mv  esp8266-$ESP8266_VER arduino-$ARDUINO_VER/hardware/esp8266com/esp8266

