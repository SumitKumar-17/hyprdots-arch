
# installing Dokcer on Arch Linux
https://itsfoss.com/install-docker-arch-linux/
Follow this link
```bash
sudo pacman -S docker
sudo systemctl start docker.service
sudo systemctl enable docker.service
sudo usermod -aG docker $USER
newgrp docker
docker run hello-world
```


Docker Desktop
```bash
wget https://download.docker.com/linux/static/stable/x86_64/docker-27.2.1.tgz -qO- | tar xvfz - docker/docker --strip-components=1
mv ./docker /usr/local/bin
```

Download Docker Desktop from Docker.hub
```bash
sudo pacman -U --overwrite /usr/lib/docker/cli-plugins/docker-compose ./docker-desktop-x86_64.pkg.tar.zst
```
