#!/bin/sh

# julius6

cd /tmp/

wget -O - -q http://updates.mynonpublic.com/oea/feed -q -O /tmp/feed.sh

FILE=/tmp/feed.sh

if [ -e $FILE ]; then
    size=`ls -l $FILE | sed -e 's/  */ /g' | cut -d' ' -f5`
    if [ $size -le 500 ]; then
        echo "Érvénytelen $FILE! próbálja később..."
        exit 0
    else
        chmod 0755 /tmp/feed.sh
		/tmp/feed.sh
		sleep 5
        rm -rf /tmp/feed.sh			
        echo "A cam feed telepítés sikeresen befejeződött..."
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
