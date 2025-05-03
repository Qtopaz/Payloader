Payloader – Automated Payload Generation & Listener Setup

This Bash script streamlines the process of generating and deploying a reverse shell payload using Msfvenom and Msfconsole. Upon execution, it:

Prompts the user for a port number and uses the system's IP address to generate a reverse shell .exe payload.

Creates an automated Metasploit resource file (listen.rc) to launch a listener with the correct parameters.

Hosts the payload on a local HTTP server via python3 -m http.server, allowing easy delivery of the file to the victim.

Automatically runs msfconsole with the listener setup.

Use Cases:

Internal Red Team exercises

Payload delivery simulations

Penetration testing automation
