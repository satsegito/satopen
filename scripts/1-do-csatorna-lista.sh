#!/bin/sh

# zakaz modyfikowania skryptu na własną rękę
# zakaz modyfikowania list kanałów i ich późniejsze udostępnianie
# No permission to modify this PLUGIN !!!
# protection by Sanchooo!!!
# julius6 Thanks Sanchooo !!!

cd /tmp/
wget https://github.com/satsegito/satopen/raw/main/do-thor-card-list.zip -q -O /tmp/lamedb.zip
FILE=/tmp/lamedb.zip

if [ -e $FILE ]; then
    size=`ls -l $FILE | sed -e 's/  */ /g' | cut -d' ' -f5`
    if [ $size -le 500 ]; then
        echo "Érvénytelen $FILE! próbálja később..."
        exit 0
    else
		cd /tmp/
		mkdir chlista
        unzip lamedb.zip -d ./chlista
        cd chlista
        if [ -f satellites.xml ]; then
            rm -rf /etc/tuxbox/satellites.xml
            mv /tmp/chlista/satellites.xml /etc/tuxbox/
            cd /etc/enigma2
            rm -rf *.tv
            rm -rf *.radio
            rm -rf blacklist
            rm -rf lamedb
			cd /tmp/chlista
            mv * /etc/enigma2

            rmdir -rf /tmp/chlista
            rm -rf /tmp/lamedb.zip

            wget -qO - http://127.0.0.1/web/servicelistreload?mode=0
            wget -qO - http://127.0.0.1/web/servicelistreload?mode=1		  
            wget -qO - http://127.0.0.1/web/servicelistreload?mode=2

            echo "Az új csatornalista feltöltése sikeresen befejeződött..."
			echo "--------------------------------------------------------"
			echo " "
			echo "Újaindítás"
			echo " "			
			echo "--------------------------------------------------------"
			sleep 5
			killall -9 enigma2
        else
            echo "Hiba! Nincs lista! Kérem, próbálkozzon újra később..."
        fi
   fi
else
    echo "Hiba! Nincs csatornalista fájl! Kérem, próbálkozzon újra később..."
fi