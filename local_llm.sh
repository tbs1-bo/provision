# default port 11434 sometimes not working
OLLAMA_HOST="127.0.0.1:11435"

echo "install ollama https://github.com/ollama/ollama"
curl -fsSL https://ollama.com/install.sh | sh 

echo "pull a ollama model for tests"
ollama pull llama3.2:1b

echo "installing docker"
sudo apt install docker.io 

echo "addind current user to docker group (maybe restart required)"
sudo usermod -a -G docker $USER 

echo "starting docker container"
docker run -d --network=host \
  -v open-webui:/app/backend/data \
  -e OLLAMA_BASE_URL=http://$OLLAMA_HOST \
  --name open-webui \
  --restart always \
  ghcr.io/open-webui/open-webui:main


echo "installing ollama as a systemd service"
curl https://raw.githubusercontent.com/tbs1-bo/provision/refs/heads/main/ollama.service | sudo tee /etc/systemd/system/ollama.service

sudo systemctl daemon-reload
sudo systemctl enable ollama
sudo systemctl start ollama

