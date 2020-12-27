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

    # install python venv
    sudo apt-get install -y python3-venv python3-pip
    # install docker-compose
    sudo pip3 install docker-compose
    sudo pip3 install ansible==2.9.*
    pip3 install docker
fi

# open password auth for backup if ssh key doesn't work, bydefault, username=vagrant password=vagrant
# please comment these two lines if you want to disable username/password login
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo service sshd restart
