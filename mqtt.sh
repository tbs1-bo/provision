
echo "# update package sources"
sudo apt update

echo "# enable snap"
sudo mv /etc/apt/preferences.d/nosnap.pref ~/Dokumente/nosnap.backup
sudo apt install snapd

echo "# install mqtt explorer"
# sudo snap install mqtt-explorer
# snap installation currently not working: 
# https://github.com/thomasnordquist/MQTT-Explorer/issues/611

wget https://github.com/thomasnordquist/MQTT-Explorer/releases/download/v0.4.0-beta.6/MQTT-Explorer-0.4.0-beta.6.AppImage -O ~/Schreibtisch/MQTT-Explorer.AppImage
chmod +x ~/Schreibtisch/MQTT-Explorer.AppImage

echo "# install mosquitto, paho-mqtt"
sudo apt install mosquitto python3-paho-mqtt

echo "# creating mqtt config file"
curl https://raw.githubusercontent.com/tbs1-bo/provision/refs/heads/main/allow_anon.conf | sudo tee /etc/mosquitto/conf.d/allow_anon.conf

echo "# restarting broker"
sudo systemctl restart mosquitto

