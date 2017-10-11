#!/bin/sh

#y Jonesy167, this bash script allows multiple SMB vulnerability assessment NSE scripts to be run and creates a single summary file to
#view the output and identify SMB vulnerabilities easily. Live hosts are first identified by running a standard NMAP scan on the ports
# specified at runtime, the NSE scripts will only be ran against the identified live hosts, again on the same ports as are specified on startup.

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



# enumerate live hosts using standard NMAP scan and create 'clean file' with live hosts IP's which is used as target list for NSE scripts
nmap -Pn -p $2 $1 -oX nmap_output  #identify live hosts and save standard nmap xml output to file  
grep -oE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' nmap_output > target_list2  # creates file containing only live hosts
sort -u target_list2 > target_list #removes duplicates and creates new target list which is used as target list for NSE scripts



echo "testing for ms08-067"
echo ""
nmap -p $2 --script=smb-vuln-ms08-067 $1 -iL target_list -oX $3_ms08-067
echo ""
echo ""

echo "testing for samba-vuln-cve-2012-1182"
echo ""
nmap -p $2 --script=samba-vuln-cve-2012-1182 $1 -iL target_list -oX $3_samba-vuln-cve-2012-1182
echo ""
echo ""

echo "testing for ms17-10 (eternalblue)"
echo ""
nmap -p $2  --script=smb-vuln-ms17-010.nse $1 -iL target_list -oX $3_ms17-10
echo ""
echo ""
echo ""
echo "testing for ms10-061"
nmap -p $2  --script=smb-vuln-ms10-061.nse $1 -iL target_list -oX $3_ms10-61
echo ""
echo ""
echo ""
echo "testing for ms10-054"
nmap -p $2  --script=smb-vuln-ms10-054.nse $1 -iL target_list -oX $3_ms10-54
echo ""
echo ""
echo ""
echo "testing for ms07-029"
nmap -p $2  --script=smb-vuln-ms07-029.nse $1 -iL target_list -oX $3_ms07-29
echo ""
echo ""
echo ""
echo "testing for ms06-025"
nmap -p $2  --script=smb-vuln-ms06-025.nse $1 -iL target_list -oX $3_ms06-025
echo ""
echo ""
echo ""
echo "testing for smb-vuln-cve-2017-7494"
nmap -p $2  --script=smb-vuln-cve-2017-7494.nse $1 -iL target_list -oX $3_cve_2017-7494
echo ""
echo ""
echo ""
echo "testing for smb-vuln-conficker"
nmap -p $2  --script=smb-vuln-conficker.nse $1 -iL target_list -oX $3_conflicker
echo ""
echo ""
echo ""
echo "testing for smb-vuln-cve2009-3103"
nmap -p $2  --script=smb-vuln-cve2009-3103.nse $1 -iL target_list -oX $3_cve2009-3103
echo ""
echo ""
echo ""
echo "testing for smb-double-pulsar-backdoor"
nmap -p $2  --script=smb-double-pulsar-backdoor.nse $1 -iL target_list -oX $3_double-pulsar-backdoor



clear

echo ""
echo "#####################################################################################################################"
echo ""
echo "##############BELLOW IS SUMMARY OF VULNERABLE DEVICES (also written to <filename>vulns_summary file)##################"
echo ""
echo ""

#cats output files and pulls out any positive results by searching for strings 'vulner' and 'VULNER' then searching for IP address using grep with regex from result
echo "bellow devices vulnerable to ms08-067"
cat $3_ms08-067|grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to ms08-067" > $3_vulns_summary 
cat $3_ms08-067|grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary
echo ""
echo ""
echo ""

#add new line to vulns summary so it isn't messy
echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to samba-vuln-cve-2012-1182"
echo "devices vulnerable to samba-vuln-cve-2012-1182" >> $3_vulns_summary
cat $3_samba-vuln-cve-2012-1182|grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_samba-vuln-cve-2012-1182|grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary
echo ""
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to ms17-010 (eternalblue)"
echo "devices vulnerable to ms17-010 (eternalblue)" >> $3_vulns_summary
cat $3_ms17-10  |grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_ms17-10  |grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to ms10-061"
echo "devices vulnerable to ms10-061" >> $3_vulns_summary
cat $3_ms10-61  |grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_ms10-61  |grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to ms10-054"
echo "devices vulnerable to ms10-054" >> $3_vulns_summary
cat $3_ms10-54 |grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_ms10-54 |grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to ms07-29"
echo "devices vulnerable to ms07-29" >> $3_vulns_summary
cat $3_ms07-29  |grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_ms07-29  |grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to ms06-025"
echo "devices vulnerable to ms06-025" >> $3_vulns_summary
cat $3_ms06-025  |grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_ms06-025 |grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to cve_2017-7494"
echo "devices vulnerable to cve_2017-7494" >> $3_vulns_summary
cat $3_cve_2017-7494|grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_cve_2017-7494|grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to conflicker"
echo "devices vulnerable to conflicker" >> $3_vulns_summary
cat $3_conflicker|grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_conflicker|grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to cve2009-3103"
echo "devices vulnerable to cve2009-3103" >> $3_vulns_summary
cat $3_cve2009-3103|grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_cve2009-3103|grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary
echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo ""
echo "" 

echo "bellow devices have double-pulsar-backdoor"
echo "bellow devices have double-pulsar-backdoor" >> $3_vulns_summary
cat $3_double-pulsar-backdoor|grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_double-pulsar-backdoor|grep -B7 'IS VULNER\|is vulner\|is VULNER\|HAS VULNER\|has vulner\|has VULNER\|State: VULNERABLE\|VULNERABLE (Exploitable)\|VULNERABLE:'  |grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo ""
echo ""

echo SUMMARY OF VULNERABILITIES WRITTEN TO $3_vulns_summary  !!!

echo ""
echo ""
echo "happy pentesting :) "
echo ""
echo ""

### bellow code is for administration i.e file cleanup

rm nmap_output 
rm target_list -f
rm target_list2 -f
mv $3_vulns_summary vulns_summary
mkdir $3_NSE_scripts_output
mv $3* $3_NSE_scripts_output
mv vulns_summary $3_vulns_summary


#### unhash bellow line if you don't want individual output from each NSE script just the vulns_summary file #####
#rm $3_NSE_scripts_output -fr
