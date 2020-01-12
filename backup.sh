#!/bin/bash
clear
echo SAPHIRE:  initializing network backup....
sleep 3
clear
echo SAPHIRE:  starting network backup on RASPO
sleep 3
rsync -vrahe ssh --delete --exclude-from=bkp-ignore-list.txt ~/ pi@192.168.1.100:~/bkp_saphire_notebook
