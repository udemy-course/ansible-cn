# for awx

if [ "$HOSTNAME" = "awx" ]; then
    # install docker
    curl -fsSL get.docker.com -o get-docker.sh
    sh get-docker.sh

    if [ ! $(getent group docker) ]; then
        sudo groupadd docker
    fi

    sudo gpasswd -a $USER docker
    sudo service docker restart

    rm -rf get-docker.sh

    sudo apt-get install -y python3-venv
fi
