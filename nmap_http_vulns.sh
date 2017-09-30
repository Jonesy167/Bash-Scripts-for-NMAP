#!/bin/sh

#by Jonesy167, this bash script allows multiple HTTP vulnerability assessment NSE scripts to be run and creates a single summary file to
#view the output and identify HTTP vulnerabilities easily. Live hosts are first identified by running a standard NMAP scan on the ports
# specified at runtime, the NSE scripts will only be ran against the identified live hosts, again on the same ports as are specified on startup. 


#NOT TO BE USED FOR ILLEGAL OR NEFARIOS PURPOSES


#check if 3 arguements given, if not print instructions
#-iL target_list is first arguement, check if arguement given, if not print instructions
if [ $# -ne 3 ]; then
echo ""
echo ""
echo "[*] script to first enumerate live hosts and then run all HTTP vuln scripts back to back against them"
echo "[*] will will produce an easy to intepret summary file containing a clear list of vulnerabilities named <outpufile name_vulns_summary>"
echo ''
echo " if verbose output from each NSE script is required hash last 3 lines of this file, each will produce an output named <filename>_ms08-67 etc"
echo ""
echo "[*] Useage <iprange> <port (multple ports entered either as 80,8080 or 100-200)> <outputfile name>"
echo ""
echo ""
exit 0
fi


# enumerate live hosts using standard NMAP scan and create 'clean file' with live hosts IP's which is used as target list for NSE scripts
nmap -p $2 $1 -oX nmap_output_80_8080  #identify live hosts and save standard nmap xml output to file  
grep -oE '\b([0-9]{1,3}\.){3}[0-9]{1,3}\b' nmap_output_80_8080 > target_list2  # creates file containing only live hosts
sort -u target_list2 > target_list #removes duplicates and creates new target list which is used as target list for NSE scripts



echo "testing for http-iis-webdav-vuln"
echo ""
nmap -Pn -p $2 --script=http-iis-webdav-vuln -iL target_list -oX $3_http-iis-webdav-vuln|grep 'VULNER\|vulnerable' #search XML output for strings 'VULNER' and 'vulner' if present display line
echo ""
echo ""
echo ""

echo "testing for http-vmware-path-vuln"
echo ""
nmap -p $2 --script=http-vmware-path-vuln -iL target_list -oX $3_http-vmware-path-vuln|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2006-3392"
echo ""
nmap -p $2 --script=http-vuln-cve2006-3392 -iL target_list -oX $3_http-vuln-cve2006-3392|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2009-3960"
echo ""
nmap -p $2 --script=http-vuln-cve2009-3960 -iL target_list -oX $3_http-vuln-cve2009-3960|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2010-0738"
echo ""
nmap -p $2 --script=http-vuln-cve2010-0738 -iL target_list -oX $3_http-vuln-cve2010-0738|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2010-2861"
echo ""
nmap -p $2 --script=http-vuln-cve2010-2861 -iL target_list -oX $3_http-vuln-cve2010-2861|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2011-3192"
echo ""
nmap -p $2 --script=http-vuln-cve2011-3192 -iL target_list -oX $3_http-vuln-cve2011-3192|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2011-3368"
echo ""
nmap -p $2 --script=http-vuln-cve2011-3368 -iL target_list -oX $3_http-vuln-cve2011-3368|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2012-1823"
echo ""
nmap -p $2 --script=http-vuln-cve2012-1823 -iL target_list -oX $3_http-vuln-cve2012-1823|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2013-0156"
echo ""
nmap -p $2 --script=http-vuln-cve2013-0156 -iL target_list -oX $3_http-vuln-cve2013-0156|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2013-6786"
echo ""
nmap -p $2 --script=http-vuln-cve2013-6786 -iL target_list -oX $3_http-vuln-cve2013-6786|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2013-7091"
echo ""
nmap -p $2 --script=http-vuln-cve2013-7091 -iL target_list -oX $3_http-vuln-cve2013-7091|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2014-2126"
echo ""
nmap -p $2 --script=http-vuln-cve2014-2126 -iL target_list -oX $3_http-vuln-cve2014-2126|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2014-2127"
echo ""
nmap -p $2 --script=http-vuln-cve2014-2127 -iL target_list -oX $3_http-vuln-cve2014-2127|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2014-2128"
echo ""
nmap -p $2 --script=http-vuln-cve2014-2128 -iL target_list -oX $3_http-vuln-cve2014-2128|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2014-2129"
echo ""
nmap -p $2 --script=http-vuln-cve2014-2129 -iL target_list -oX $3_http-vuln-cve2014-2129|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2014-3704"
echo ""
nmap -p $2 --script=http-vuln-cve2014-3704 -iL target_list -oX $3_http-vuln-cve2014-3704|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2014-8877"
echo ""
nmap -p $2 --script=http-vuln-cve2014-8877 -iL target_list -oX $3_http-vuln-cve2014-8877|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2015-1427"
echo ""
nmap -p $2 --script=http-vuln-cve2015-1427 -iL target_list -oX $3_http-vuln-cve2015-1427|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2015-1635"
echo ""
nmap -p $2 --script=http-vuln-cve2015-1635 -iL target_list -oX $3_http-vuln-cve2015-1635|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2017-1001000"
echo ""
nmap -p $2 --script=http-vuln-cve2017-1001000 -iL target_list -oX $3_http-vuln-cve2017-1001000|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2017-5638"
echo ""
nmap -p $2 --script=http-vuln-cve2017-5638 -iL target_list -oX $3_http-vuln-cve2017-5638|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-cve2017-5689"
echo ""
nmap -p $2 --script=http-vuln-cve2017-5689 -iL target_list -oX $3_http-vuln-cve2017-5689|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-misfortune-cookie"
echo ""
nmap -p $2 --script=http-vuln-misfortune-cookie -iL target_list -oX $3_http-vuln-misfortune-cookie|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for http-vuln-wnr1000-creds"
echo ""
nmap -p $2 --script=http-vuln-wnr1000-creds -iL target_list -oX $3_http-vuln-wnr1000-creds|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""


echo "testing for http-huawei-hg5xx-vuln"
echo ""
nmap -p $2 --script=http-huawei-hg5xx-vuln -iL target_list -oX $3_http-huawei-hg5xx-vuln|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

echo "testing for heartbleed"
echo ""
nmap -p $2 --script=ssl-heartbleed -iL target_list -oX $3_ssl-heartbleed|grep 'VULNER\|vulnerable' 
echo ""
echo ""
echo ""

clear

echo ""
echo ""
echo "###########  BELLOW IS SUMMARY OF VULNERABLE DEVICES (also written to <filename>vulns_summary file) #####################"
echo ""
echo ""
echo ""

#cats output files and pulls out any positive results by searching for strings 'vulner' and 'VULNER', then searches and displays IP address's using grep with regex

echo "bellow devices vulnerable to http-iis-webdav-vuln"
cat $3_http-iis-webdav-vuln|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-iis-webdav-vuln" > $3_vulns_summary 
cat $3_http-iis-webdav-vuln|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary
echo ""
echo ""
echo ""

#add new line to vulns summary so it isn't messy
echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vmware-path-vuln"
echo "devices vulnerable to http-vmware-path-vuln" >> $3_vulns_summary
cat $3_http-vmware-path-vuln|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vmware-path-vuln|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary
echo ""
echo ""
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2006-3392"
echo "devices vulnerable to http-vuln-cve2006-3392" >> $3_vulns_summary
cat $3_http-vuln-cve2006-3392  |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2006-3392  |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to http-vuln-cve2009-3960"
cat $3_http-vuln-cve2009-3960|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-cve2009-3960" >> $3_vulns_summary 
cat $3_http-vuln-cve2009-3960|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary
echo ""
echo ""
echo ""

#add new line to vulns summary so it isn't messy
echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2010-0738"
echo "devices vulnerable to http-vuln-cve2010-0738" >> $3_vulns_summary
cat $3_http-vuln-cve2010-0738|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2010-0738|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary
echo ""
echo ""
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2010-2861"
echo "devices vulnerable to http-vuln-cve2010-2861" >> $3_vulns_summary
cat $3_http-vuln-cve2010-2861|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2010-2861|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2011-3192"
cat $3_http-vuln-cve2011-3192|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-cve2011-3192" >> $3_vulns_summary 
cat $3_http-vuln-cve2011-3192|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary
echo ""
echo ""
echo ""

#add new line to vulns summary so it isn't messy
echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2011-3368"
echo "devices vulnerable to http-vuln-cve2011-3368" >> $3_vulns_summary
cat $3_http-vuln-cve2011-3368|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2011-3368|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary
echo ""
echo ""
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2012-1823"
echo "devices vulnerable to http-vuln-cve2012-1823" >> $3_vulns_summary
cat $3_http-vuln-cve2012-1823 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2012-1823 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to http-vuln-cve2013-0156"
cat $3_http-vuln-cve2013-0156|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-cve2013-0156" >> $3_vulns_summary 
cat $3_http-vuln-cve2013-0156|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary
echo ""
echo ""
echo ""

#add new line to vulns summary so it isn't messy
echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2013-6786"
echo "devices vulnerable to http-vuln-cve2013-6786" >> $3_vulns_summary
cat $3_http-vuln-cve2013-6786|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2013-6786|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary
echo ""
echo ""
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2013-7091"
echo "devices vulnerable to http-vuln-cve2013-7091" >> $3_vulns_summary
cat $3_http-vuln-cve2013-7091 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2013-7091 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to http-vuln-cve2014-2126"
cat $3_http-vuln-cve2014-2126|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-cve2014-2126" >> $3_vulns_summary 
cat $3_http-vuln-cve2014-2126|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary
echo ""
echo ""
echo ""

#add new line to vulns summary so it isn't messy
echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2014-2127"
echo "devices vulnerable to http-vuln-cve2014-2127" >> $3_vulns_summary
cat $3_http-vuln-cve2014-2127|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2014-2127|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary
echo ""
echo ""
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2014-2128"
echo "devices vulnerable to http-vuln-cve2014-2128" >> $3_vulns_summary
cat $3_http-vuln-cve2014-2128 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2014-2128 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2014-2129"
cat $3_http-vuln-cve2014-2129|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-cve2014-2129" >> $3_vulns_summary 
cat $3_http-vuln-cve2014-2129|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary
echo ""
echo ""
echo ""

#add new line to vulns summary so it isn't messy
echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2014-3704"
echo "devices vulnerable to http-vuln-cve2014-3704" >> $3_vulns_summary
cat $3_http-vuln-cve2014-3704|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2014-3704|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary
echo ""
echo ""
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2014-8877"
echo "devices vulnerable to http-vuln-cve2014-8877" >> $3_vulns_summary
cat $3_http-vuln-cve2014-8877 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2014-8877 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to http-vuln-cve2015-1427"
cat $3_http-vuln-cve2015-1427|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-cve2015-1427" >> $3_vulns_summary 
cat $3_http-vuln-cve2015-1427|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary

echo ""
echo ""
echo ""

#add new line to vulns summary so it isn't messy
echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2015-1635"
echo "devices vulnerable to http-vuln-cve2015-1635" >> $3_vulns_summary
cat $3_http-vuln-cve2015-1635|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2015-1635|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo ""
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2017-1001000"
echo "devices vulnerable to http-vuln-cve2017-1001000" >> $3_vulns_summary
cat $3_http-vuln-cve2017-1001000 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2017-1001000 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to http-vuln-cve2017-5638"
cat $3_http-vuln-cve2017-5638|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-cve2017-5638" >> $3_vulns_summary 
cat $3_http-vuln-cve2017-5638|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary

echo ""
echo ""
echo ""

#add new line to vulns summary so it isn't messy
echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2017-5689"
echo "devices vulnerable to http-vuln-cve2017-5689" >> $3_vulns_summary
cat $3_http-vuln-cve2017-5689|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2017-5689|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo ""
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-misfortune-cookie"
echo "devices vulnerable to http-vuln-misfortune-cookie" >> $3_vulns_summary
cat $3_http-vuln-misfortune-cookie |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-misfortune-cookie |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to http-vuln-wnr1000-creds"
cat $3_http-vuln-wnr1000-creds|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-wnr1000-creds.nse" >> $3_vulns_summary 
cat $3_http-vuln-wnr1000-creds|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"  >>  $3_vulns_summary

echo ""
echo ""
echo ""

#add new line to vulns summary so it isn't messy
echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-huawei-hg5xx-vuln"
echo "devices vulnerable to http-huawei-hg5xx-vuln" >> $3_vulns_summary
cat $3_http-huawei-hg5xx-vuln|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-huawei-hg5xx-vuln|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo ""
echo ""

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to heartbleed"
echo "devices vulnerable to heartbleed" >> $3_vulns_summary
cat $3_ssl-heartbleed|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_ssl-heartbleed|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo ""
echo ""

echo ""
echo ""

echo "###########  ABOVE IS SUMMARY OF VULNERABLE DEVICES (also written to <filename>vulns_summary file) #####################"
echo ""
echo ""
echo ""

echo "happy pentesting :) "
echo ""
echo ""

#clean up
rm nmap_output_80_8080 -f
rm target_list -f
rm target_list2 -f 

### bellow code is for administration i.e file cleanup

rm nmap_output_80_8080 -f
rm target_list -f
rm target_list2 -f

#### hash bellow 3 lines if you want individual output from each NSE script just the vulns_summary file #####
mv $3_vulns_summary vulns_summary
rm $3_* -f 
mv vulns_summary $3_vulns_summary
