# 
sleep 1
mkdir /home/ubuntu/apiServer
cd /home/ubuntu/apiServer
pwd >> /tmp/file
#Edit AWS S3 readonly credentials Here

sudo -i -u ubuntu aws configure set aws_access_key_id AKIA5PZ2OHIXPSS7AEXB
sudo -i -u ubuntu aws configure set aws_secret_access_key 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
sudo -i -u ubuntu aws configure set default.region us-east-1
sudo -i -u ubuntu aws configure set output None
echo "end of aws credentials" >> /tmp/file

echo "creating dir apiServer" >> /tmp/file

echo "install node" >> /tmp/file
sudo apt update
sudo apt install nodejs -y

echo "Install npm express pg" >> /tmp/file
sudo apt install npm -y
sudo npm install express pg
sudo npm install pm2@latest -g
#enter s3 bucketbelow for copy
chown -R ubuntu:ubuntu /home/ubuntu/apiServer
ls -ld /home/ubuntu/apiServer >> /tmp/file
sudo -i -u ubuntu aws s3 cp s3://wecloud-projects/project2/index.js /home/ubuntu/apiServer
ls -la /home/ubuntu/apiServer >> /tmp/file
cd /home/ubuntu/apiServer 
pm2 start /home/ubuntu/apiServer/index.js
pm2 startup
sudo env PATH=$PATH:/usr/bin /usr/local/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu


#pm2 startup /home/ubuntu/apiServer/index.js
#sudo -i -u ubuntu pm2 start index.js
#sleep 1
#sudo -i -u ubuntu pm2 startup
#sudo env PATH=$PATH:/usr/bin /usr/local/lib/node_modules/pm2/bin/pm2 startup systemd -u ubuntu --hp /home/ubuntu
#sudo systemctl enable pm2-ubuntu.service
###


echo "end of user data ***" >> /tmp/file