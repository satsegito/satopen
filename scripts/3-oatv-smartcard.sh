#!/bin/sh

# satsegito

cd /tmp/
rm -rf /tmp/oscam.server
wget https://raw.githubusercontent.com/satsegito/satopen/main/oscam.server -q -O /tmp/oscam.server
FILE=/tmp/oscam.server

if [ -e $FILE ]; then
    size=`ls -l $FILE | sed -e 's/  */ /g' | cut -d' ' -f5`
    if [ $size -le 500 ]; then
        echo "Érvénytelen $FILE! próbálja később..."
        exit 0
    else
        rm -rf /etc/tuxbox/oscam-stable/oscam.server
        cp /tmp/oscam.server /etc/tuxbox/config/oscam-stable/oscam.server
        rm -rf /tmp/oscam.server
        echo "Az oscam.server csere sikeresen befejeződött..."
	echo "--------------------------------------------------------"
	echo " "
	echo "Újaindítás"
	echo " "			
	echo "--------------------------------------------------------"
	killall -9 enigma2
    fi
else
    echo "Hiba! Nincs fájl! Kérem, próbálkozzon újra később..."
fi
