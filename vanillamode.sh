echo 'Making sure that starbound and starry py are off'
stop starbound
stop pystarbound
cd /root/starbound
rm starbound.config
cp starbound.configVanillaPort starbound.config
echo 'Configuring the game port in starbound.config to 25024'
start starbound
echo 'Starbound started in vanilla mode'

