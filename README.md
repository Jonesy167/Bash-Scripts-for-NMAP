# Bash-Scripts-for-NMAP #NOT TO BE USED FOR ILLEGAL OR NEFARIOUS PURPOSES
Bash scripts which run multiple NMAP NSE scripts i.e a single bash script to run all SMB/SAMBA (nmap_smb_vulns.sh) or HTTP (nmap_http_vulns.sh).

The scripts first identify vulnerable systems and then creates a single file containing a clear and concise list of vulnerable systems (vulns_summary file). The naming convention for the vulns_summary file is output file name specified at run time with "vulns_summary" appended 


Verbose output is also saved from each NSE script should you wish to analyse it, this takes the bellow naming convention: 
individual NSE script name with output file name specified at runtime appended

Useage example bellow 

nmap_smb_vulns.sh./ <iprange e.g 192.168.1/24> <port - multple ports can be entered either as 13,445 or 100-200> <outputfile name>

(nmap_http_vulns.sh uses exactly the same synthax)
