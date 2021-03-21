# for controller

if [ "$HOSTNAME" = "ansible-controller" ]; then
    # install python venv
    sudo yum install -y python3-venv python3-pip
    sudo pip3 install pip --upgrade
    pip3 install ansible
fi

# open password auth for backup if ssh key doesn't work, bydefault, username=vagrant password=vagrant
sudo sed -i 's/PasswordAuthentication no/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo systemctl restart sshd
