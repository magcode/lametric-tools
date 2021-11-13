# this needs to be done on a linux machine
sudo apt-get install python-pip
sudo pip install virtualenv
virtualenv -p /usr/bin/python2.7 ~/virtual
source ~/virtual/bin/activate
pip install gtts
scp -r virtual/lib/python2.7/site-packages lametric:/mnt/user/custom/tts/pythonlib
rm -rf ~/virtual
