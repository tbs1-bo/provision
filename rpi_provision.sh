# Mit diesem Skript lässt sich ein Raspberry Pi mit den notwendigen Programmen
# und Bibliotheken einrichten.
#

echo "# update package sources"
sudo apt update

echo "# enable snap"
sudo mv /etc/apt/preferences.d/nosnap.pref ~/Dokumente/nosnap.backup
sudo apt install snapd

echo "# install mqtt explorer"
snap install mqtt-explorer

echo "# install vscode"
snap install code --classic

echo "# install mosquitto, paho-mqtt, arduino"
sudo apt install mosquitto python3-paho-mqtt arduino

echo "# create a file /etc/mosquitto/conf.d/allow_anon.conf"
curl https://raw.githubusercontent.com/tbs1-bo/robo/refs/heads/main/allow_anon.conf | sudo tee /etc/mosquitto/conf.d/allow_anon.conf

echo "# restart broker:"
sudo systemctl restart mosquitto

