useradd deploy
mkdir /home/deploy
mkdir /home/deploy/.ssh
chmod 700 /home/deploy/.ssh
chown deploy:deploy /home/deploy -R

cd
npm install -g bittorrent-tracker
bittorrent-tracker -p --port 80
