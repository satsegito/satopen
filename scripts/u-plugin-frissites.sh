#!/bin/sh

# satsegito

cd /tmp/
wget https://raw.githubusercontent.com/satsegito/satopen/main/encoding.conf -q -O /tmp/encoding.conf
FILE=/tmp/encoding.conf

if [ -e $FILE ]; then
    size=`ls -l $FILE | sed -e 's/  */ /g' | cut -d' ' -f5`
    if [ $size -le 500 ]; then
        echo "Érvénytelen $FILE! próbálja később..."
        exit 0
    else
            rm -rf /usr/share/enigma2/encoding.conf
            cp /tmp/encoding.conf /usr/share/enigma2/encoding.conf
            rm -rf /tmp/encoding.conf			
            echo "Az encoding.conf csere sikeresen befejeződött..."
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
