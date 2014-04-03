
# NVM Install
git clone git://github.com/creationix/nvm.git ~/.nvm
printf "\n\n# NVM\nif [ -s ~/.nvm/nvm.sh ]; then\n\tNVM_DIR=~/.nvm\n\tsource ~/.nvm/nvm.sh\nfi" >> ~/.bashrc
NVM_DIR=~/.nvm
source ~/.nvm/nvm.sh

# NVM Setup
nvm install v0.10.16
nvm alias default 0.10
nvm use 0.10

npm install -g forever
cd /root/
git clone https://github.com/seriallos/commandstar

echo -e "serverName: Starbound Today
serverDescription: >
  <strong>Welcome!</strong><br/>
  This is a <a href=\"http://starbound.today\">StarBound Today</a> Server. Connect with your StarBound Client.
starbound:
  binPath: /root/starbound/linux64
  assetsPath: /root/starbound/assets
  dataPath: /root/starbound/linux64/universe
  logFile: /root/starbound/starbound_server.log
  configFile: /root/starbound/starbound.config
features:
  serverStatus: false
  activeSystems: true
  apiFooter: false
ignoreChatPrefixes: \"/#\"
listenPort: 8080
maxRecentChatMessages: 100
serverStatus:
  checkFrequency: 600
customCss:
  - bootstrap-theme.min.css
datastore:
  dataPath: ./data" > /root/commandstar/config/default.yaml

cd /root/commandstar
npm install
#forever start ./node_modules/coffee-script/bin/coffee lib/commandstar.coffee


# create config
echo -e 'server {
  server_name 127.0.0.1;
  location / {
    proxy_http_version 1.1;
    proxy_set_header Upgrade $http_upgrade;
    proxy_set_header Connection "upgrade";
    proxy_set_header X-Real-IP $remote_addr;
    proxy_set_header X-Forwarded-For $proxy_add_x_forwarded_for;
    proxy_set_header Host $http_host;
    proxy_set_header X-NginX-Proxy true;
    proxy_pass http://127.0.0.1:8080/;
    proxy_redirect off;
    proxy_read_timeout 3m;
    proxy_send_timeout 3m;
    proxy_connect_timeout 3m;
  }
}' > /etc/nginx/sites-enabled/default

service nginx restart
