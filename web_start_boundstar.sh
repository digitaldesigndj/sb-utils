forever stopall
cd ~/commandstar/
bash forever.sh
echo 'started commandstar'

cd ~/boundstar/
export WEBHOOK_KEY=TDY721
forever start app.js
echo 'started boundstar'