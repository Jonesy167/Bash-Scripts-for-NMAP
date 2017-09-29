#!/bin/sh

#by Jonesy167, this bash script allows multiple NMAP SMB vulnerability assessment NSE scripts to be run and creates a single summary file to
#view the output and identify SMB/SAMBA vulnerabilities easily

#NOT TO BE USED FOR ILLEGAL OR NEFARIOS PURPOSES

#check if 3 arguement given, if not print instructions
#$1 is first arguement, check if arguement given, if not print instructions
if [ $# -ne 3 ]; then
echo ""
echo ""
echo "[*] script to run all nse smb vuln scripts back to back, will produce single soutput file for each named <filename>_ms08-67 etc"
echo "[*] will also produce an easy to intepret summary file containing a clear list of vulnerabilities named <outpufile name_vulns_summary>"
echo ""
echo ""
echo "[*] Useage <iprange> <port (multple ports entered either as 13,445 or 100-200)> <outputfile name>"
echo ""
echo ""
exit 0
fi


echo "testing for ms08-067"
echo ""
nmap -p $2 --script=smb-vuln-ms08-067 $1 -oX $3_ms08-067|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for samba-vuln-cve-2012-1182"
echo ""
nmap -p $2 --script=samba-vuln-cve-2012-1182 $1 -oX $3_samba-vuln-cve-2012-1182|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for ms17-10 (eternalblue)"
echo ""
nmap -p $2  --script=smb-vuln-ms17-010.nse $1 -oX $3_ms17-10|grep 'VULNER\|vulner' 
echo ""
echo ""
echo "testing for ms10-061"
nmap -p $2  --script=smb-vuln-ms10-061.nse $1 -oX $3_ms10-61|grep 'VULNER\|vulner' 
echo ""
echo ""
echo "testing for ms10-054"
nmap -p $2  --script=smb-vuln-ms10-054.nse $1 -oX $3_ms10-54|grep 'VULNER\|vulner' 
echo ""
echo ""
echo "testing for ms07-029"
nmap -p $2  --script=smb-vuln-ms07-029.nse $1 -oX $3_ms07-29|grep 'VULNER\|vulner' 
echo ""
echo ""
echo "testing for ms06-025"
nmap -p $2  --script=smb-vuln-ms06-025.nse $1 -oX $3_ms06-025|grep 'VULNER\|vulner' 
echo ""
echo ""
echo "testing for smb-vuln-cve-2017-7494"
nmap -p $2  --script=smb-vuln-cve-2017-7494.nse $1 -oX $3_cve_2017-7494|grep 'VULNER\|vulner'
echo ""
echo ""

echo "testing for smb-vuln-conficker"
nmap -p $2  --script=smb-vuln-conficker.nse $1 -oX $3_conflicker|grep 'VULNER\|vulner'
echo ""
echo ""

echo "testing for smb-vuln-cve2009-3103"
nmap -p $2  --script=smb-vuln-cve2009-3103.nse $1 -oX $3_cve2009-3103|grep 'VULNER\|vulner'
echo ""
echo ""

echo "testing for smb-double-pulsar-backdoor"
nmap -p $2  --script=smb-double-pulsar-backdoor.nse $1 -oX $3_double-pulsar-backdoor|grep 'VULNER\|vulner'

clear

echo ""
echo ""
echo "BELLOW IS SUMMARY OF VULNERABLE DEVICES (also written to <filename>vulns_summary file)"
echo ""
echo ""

#cats output files and pulls out any positive results by searching for strings 'vulner' and 'VULNER' then searching for IP address using grep with regex from result
echo "bellow devices vulnerable to ms08-067"
cat $3_ms08-067|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to ms08-067" > $3_vulns_summary 
cat $3_ms08-067|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary

echo ""
echo ""

#add new line to vulns summary so it isn't messy
echo  -e >>  $3_vulns_summary
echo  -e >>  $3_vulns_summary


echo "bellow devices vulnerable to samba-vuln-cve-2012-1182"
echo "devices vulnerable to samba-vuln-cve-2012-1182" >> $3_vulns_summary
cat $3_samba-vuln-cve-2012-1182|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_samba-vuln-cve-2012-1182|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo ""

echo  -e >>  $3_vulns_summary
echo  -e >>  $3_vulns_summary


echo "bellow devices vulnerable to ms17-010 (eternalblue)"
echo "devices vulnerable to ms17-010 (eternalblue)" >> $3_vulns_summary
cat $3_ms17-10  |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_ms17-10  |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 

echo  -e >>  $3_vulns_summary
echo  -e >>  $3_vulns_summary

echo "bellow devices vulnerable to ms10-061"
echo "devices vulnerable to ms10-061" >> $3_vulns_summary
cat $3_ms10-61  |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_ms10-61  |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 

echo  -e >>  $3_vulns_summary
echo  -e >>  $3_vulns_summary

echo "bellow devices vulnerable to ms10-054"
echo "devices vulnerable to ms10-054" >> $3_vulns_summary
cat $3_ms10-54 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_ms10-54 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary

echo ""
echo "" 

echo  -e >>  $3_vulns_summary
echo  -e >>  $3_vulns_summary

echo "bellow devices vulnerable to ms07-29"
echo "devices vulnerable to ms07-29" >> $3_vulns_summary
cat $3_ms07-29  |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_ms07-29  |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary

echo ""
echo "" 

echo  -e >>  $3_vulns_summary
echo  -e >>  $3_vulns_summary

echo "bellow devices vulnerable to ms06-025"
echo "devices vulnerable to ms06-025" >> $3_vulns_summary
cat $3_ms06-025  |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_ms06-025 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary

echo ""
echo "" 

echo  -e >>  $3_vulns_summary
echo  -e >>  $3_vulns_summary

echo "bellow devices vulnerable to cve_2017-7494"
echo "devices vulnerable to cve_2017-7494" >> $3_vulns_summary
cat $3_cve_2017-7494|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_cve_2017-7494|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 

echo  -e >>  $3_vulns_summary
echo  -e >>  $3_vulns_summary

echo "bellow devices vulnerable to conflicker"
echo "devices vulnerable to conflicker" >> $3_vulns_summary
cat $3_conflicker|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_conflicker|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary

echo ""
echo "" 

echo  -e >>  $3_vulns_summary
echo  -e >>  $3_vulns_summary

echo "bellow devices vulnerable to cve2009-3103"
echo "devices vulnerable to cve2009-3103" >> $3_vulns_summary
cat $3_cve2009-3103|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_cve2009-3103|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary
echo  -e >>  $3_vulns_summary
echo  -e >>  $3_vulns_summary

echo ""
echo "" 

echo "bellow devices have double-pulsar-backdoor"
echo "bellow devices have double-pulsar-backdoor" >> $3_vulns_summary
cat $3_double-pulsar-backdoor|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_double-pulsar-backdoor|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary

echo  -e >>  $3_vulns_summary
echo  -e >>  $3_vulns_summary

echo ""
echo ""

echo SUMMARY OF VULNERABILITIES WRITTEN TO $3vulns_summary  !!!

echo ""
echo ""
