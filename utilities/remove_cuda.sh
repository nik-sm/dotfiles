# In case of "broken packages" preventing removal:
# see https://askubuntu.com/questions/525088/how-to-delete-broken-packages-in-ubuntu
# sudo dpkg --remove --force-remove-reinstreq package_name 
sudo apt-get --purge -y remove 'cuda*'
sudo apt-get --purge -y remove 'nvidia*'
sudo reboot
