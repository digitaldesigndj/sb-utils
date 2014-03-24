
#AS long as the spawn planet is still:
#alpha_59_61_-6139775_2_11.world
#This will copy it FROM the saves folder when run.

stop starbound
sleep 2;
cp -f /root/starbound/saves/alpha_59_61_-6139775_2_11.world /root/starbound/universe/alpha_59_61_-6139775_2_11.world
sleep 2;
start starbound
