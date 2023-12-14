#!/usr/bin/bash


PKGS="docker.io docker-doc docker-compose docker-compose-v2 podman-docker containerd runc"


for pkg in $PKGS; do
  sudo apt-get remove $pkg;
done

sudo apt-get update && sudo apt-get install ca-certificates curl gnupg -y
sudo install -m 0755 -d /etc/apt/keyrings

if ! [ -e "/etc/apt/keyrings/docker.gpg" ] ; then 
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /etc/apt/keyrings/docker.gpg
sudo chmod a+r /etc/apt/keyrings/docker.gpg
fi

# Add the repository to Apt sources:
echo \
  "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.gpg] https://download.docker.com/linux/ubuntu \
  $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
  sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

sudo apt-get update && \
sudo apt-get install \
 docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

sudo apt-get update && sudo apt-get install docker-compose-plugin -y

if ! [ -e "/usr/local/bin/docker-compose" ] ; then 
sudo curl -SL https://github.com/docker/compose/releases/download/v2.23.3/docker-compose-linux-x86_64 \
 -o /usr/local/bin/docker-compose
fi
chmod +x /usr/local/bin/docker-compose

sudo service docker restart
