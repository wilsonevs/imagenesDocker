sudo apt-get update -y
sudo apt-get upgrade -y

sudo apt-get install curl

sudo ubuntu-drivers devices
sudo ubuntu-drivers autoinstall

curl -sSL https://get.docker.com | sh
sudo usermod -a -G docker $USER
docker version

docker run -d -p 8000:8000 -p 9000:9000 --name=portainer --restart=always -v /var/run/docker.sock:/var/run/docker.sock -v portainer_data:/data portainer/portainer-ce

curl -L "https://github.com/docker/compose/releases/download/1.29.2/docker-compose-$(uname -s)-$(uname -m)" -o /usr/local/bin/docker-compose
sudo chmod +x /usr/local/bin/docker-compose

distribution=$(. /etc/os-release;echo $ID$VERSION_ID)
curl -s -L https://nvidia.github.io/nvidia-docker/gpgkey | sudo apt-key add -
curl -s -L https://nvidia.github.io/nvidia-docker/$distribution/nvidia-docker.list | sudo tee /etc/apt/sources.list.d/nvidia-docker.list
sudo apt-get update && sudo apt-get install -y nvidia-container-toolkit
sudo systemctl restart docker


docker run --gpus all --name=NVIDIA nvidia/cuda:9.0-base nvidia-smi

docker pull tensorflow/tensorflow:latest-gpu
docker pull tensorflow/tensorflow:latest-gpu-jupyter

docker run -u $(id -u):$(id -g) --gpus all -d --name tensorflow -v /home/rh/Documentos/docker/tensorflow:/tf -p 8888:8888 -p 6006:6006 tensorflow/tensorflow:latest-gpu-jupyter

docker pull tensorflow/tensorflow:latest-gpu
docker pull tensorflow/tensorflow:latest-gpu-jupyter

sudo reboot