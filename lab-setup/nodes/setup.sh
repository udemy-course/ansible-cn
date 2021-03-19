# open password auth for backup if ssh key doesn't work, bydefault, username=vagrant password=vagrant
# please comment these two lines if you want to disable username/password login
sudo sed -i 's/#PasswordAuthentication yes/PasswordAuthentication yes/g' /etc/ssh/sshd_config
sudo service sshd restart
