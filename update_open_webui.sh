echo "stopping and removing container"
docker stop open-webui
docker rm open-webui

echo "update docker image"
docker pull ghcr.io/open-webui/open-webui

echo "starting new container"
docker run -d --network=host \
  -v open-webui:/app/backend/data
  -e OLLAMA_BASE_URL=http://127.0.0.1:11435 \
  --name open-webui \
  --restart always \
  ghcr.io/open-webui/open-webui:main

