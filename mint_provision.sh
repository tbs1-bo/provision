# Mit diesem Skript lässt sich ein Linux Mint mit den notwendigen Programmen
# und Bibliotheken einrichten.
#
# Zusätzlich wird ein LTSP-Server eingerichtet, der das fertige Image über 
# Netzboot verteilt.

ADMIN_USER=admin

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

echo "# install ltsp"
sudo apt install --install-recommends ltsp ipxe dnsmasq nfs-kernel-server openssh-server squashfs-tools ethtool net-tools epoptes
sudo gpasswd -a $ADMIN_USER epoptes

echo "# provision LTSP"
sudo ltsp dnsmasq
sudo ltsp image /
sudo ltsp ipxe
sudo ltsp nfs
sudo ltsp initrd

