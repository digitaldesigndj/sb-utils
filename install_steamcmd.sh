apt-get install lib32gcc1
mkdir steamcmd
cd steamcmd
wget http://media.steampowered.com/installer/steamcmd_linux.tar.gz
tar -xvzf steamcmd_linux.tar.gz
echo '|   starting steam cmd'
echo '|   Do this in steamcmd to install Starbound'
echo '# login <username>
# <steamid>
# <password prompt>
# force_install_dir /root/starbound
# app_update 211820
# exit'
./steamcmd

