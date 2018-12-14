sudo pip install virtualenv
virtualenv -p /usr/bin/python2.7 virtual
source virtual/bin/activate
pip install gtts
rm -r tools/tts/pythonlib
cp -r virtual/lib/python2.7/site-packages tools/tts/pythonlib
rm -r virtual