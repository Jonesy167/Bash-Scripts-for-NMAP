#!/bin/sh

#by Jonesy167, this bash script allows multiple HTTP vulnerability assessment NSE scripts to be run and creates a single summary file to
#view the output and identify HTTP vulnerabilities easily

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
echo "[*] Useage <iprange> <port (multple ports entered either as 80,8080 or 100-200)> <outputfile name>"
echo ""
echo ""
exit 0
fi

echo "testing for http-iis-webdav-vuln"
echo ""
nmap -p $2 --script=http-iis-webdav-vuln $1 -oX $3_http-iis-webdav-vuln|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vmware-path-vuln"
echo ""
nmap -p $2 --script=http-vmware-path-vuln $1 -oX $3_http-vmware-path-vuln|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2006-3392"
echo ""
nmap -p $2 --script=http-vuln-cve2006-3392 $1 -oX $3_http-vuln-cve2006-3392|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2009-3960"
echo ""
nmap -p $2 --script=http-vuln-cve2009-3960 $1 -oX $3_http-vuln-cve2009-3960|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2010-0738"
echo ""
nmap -p $2 --script=http-vuln-cve2010-0738 $1 -oX $3_http-vuln-cve2010-0738|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2010-2861"
echo ""
nmap -p $2 --script=http-vuln-cve2010-2861 $1 -oX $3_http-vuln-cve2010-2861|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2011-3192"
echo ""
nmap -p $2 --script=http-vuln-cve2011-3192 $1 -oX $3_http-vuln-cve2011-3192|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2011-3368"
echo ""
nmap -p $2 --script=http-vuln-cve2011-3368 $1 -oX $3_http-vuln-cve2011-3368|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2012-1823"
echo ""
nmap -p $2 --script=http-vuln-cve2012-1823 $1 -oX $3_http-vuln-cve2012-1823|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2013-0156"
echo ""
nmap -p $2 --script=http-vuln-cve2013-0156 $1 -oX $3_http-vuln-cve2013-0156|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2013-6786"
echo ""
nmap -p $2 --script=http-vuln-cve2013-6786 $1 -oX $3_http-vuln-cve2013-6786|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2013-7091"
echo ""
nmap -p $2 --script=http-vuln-cve2013-7091 $1 -oX $3_http-vuln-cve2013-7091|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2014-2126"
echo ""
nmap -p $2 --script=http-vuln-cve2014-2126 $1 -oX $3_http-vuln-cve2014-2126|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2014-2127"
echo ""
nmap -p $2 --script=http-vuln-cve2014-2127 $1 -oX $3_http-vuln-cve2014-2127|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2014-2128"
echo ""
nmap -p $2 --script=http-vuln-cve2014-2128 $1 -oX $3_http-vuln-cve2014-2128|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2014-2129"
echo ""
nmap -p $2 --script=http-vuln-cve2014-2129 $1 -oX $3_http-vuln-cve2014-2129|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2014-3704"
echo ""
nmap -p $2 --script=http-vuln-cve2014-3704 $1 -oX $3_http-vuln-cve2014-3704|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2014-8877"
echo ""
nmap -p $2 --script=http-vuln-cve2014-8877 $1 -oX $3_http-vuln-cve2014-8877|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2015-1427"
echo ""
nmap -p $2 --script=http-vuln-cve2015-1427 $1 -oX $3_http-vuln-cve2015-1427|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2015-1635"
echo ""
nmap -p $2 --script=http-vuln-cve2015-1635 $1 -oX $3_http-vuln-cve2015-1635|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2017-1001000"
echo ""
nmap -p $2 --script=http-vuln-cve2017-1001000 $1 -oX $3_http-vuln-cve2017-1001000|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2017-5638"
echo ""
nmap -p $2 --script=http-vuln-cve2017-5638 $1 -oX $3_http-vuln-cve2017-5638|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-cve2017-5689"
echo ""
nmap -p $2 --script=http-vuln-cve2017-5689 $1 -oX $3_http-vuln-cve2017-5689|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-misfortune-cookie"
echo ""
nmap -p $2 --script=http-vuln-misfortune-cookie $1 -oX $3_http-vuln-misfortune-cookie|grep 'VULNER\|vulnerable' 
echo ""
echo ""

echo "testing for http-vuln-wnr1000-creds"
echo ""
nmap -p $2 --script=http-vuln-wnr1000-creds $1 -oX $3_http-vuln-wnr1000-creds|grep 'VULNER\|vulnerable' 
echo ""
echo ""


echo "testing for http-huawei-hg5xx-vuln"
echo ""
nmap -p $2 --script=http-huawei-hg5xx-vuln $1 -oX $3_http-huawei-hg5xx-vuln|grep 'VULNER\|vulnerable' 
echo ""
echo ""

clear

echo ""
echo ""
echo "###########  BELLOW IS SUMMARY OF VULNERABLE DEVICES (also written to <filename>vulns_summary file) #####################"
echo ""
echo ""

#cats output files and pulls out any positive results by searching for strings 'vulner' and 'VULNER' then searching for IP address using grep with regex from #result


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

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2006-3392"
echo "devices vulnerable to http-vuln-cve2006-3392" >> $3_vulns_summary
cat $3_http-vuln-cve2006-3392  |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2006-3392  |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to http-vuln-cve2009-3960"
cat $3_http-vuln-cve2009-3960|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-cve2009-3960" > $3_vulns_summary 
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

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2010-2861"
echo "devices vulnerable to http-vuln-cve2010-2861" >> $3_vulns_summary
cat $3_http-vuln-cve2010-2861|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2010-2861|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2011-3192"
cat $3_http-vuln-cve2011-3192|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-cve2011-3192" > $3_vulns_summary 
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

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2012-1823"
echo "devices vulnerable to http-vuln-cve2012-1823" >> $3_vulns_summary
cat $3_http-vuln-cve2012-1823 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2012-1823 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to http-vuln-cve2013-0156"
cat $3_http-vuln-cve2013-0156|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-cve2013-0156" > $3_vulns_summary 
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

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2013-7091"
echo "devices vulnerable to http-vuln-cve2013-7091" >> $3_vulns_summary
cat $3_http-vuln-cve2013-7091 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2013-7091 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to http-vuln-cve2014-2126"
cat $3_http-vuln-cve2014-2126|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-cve2014-2126" > $3_vulns_summary 
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

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2014-2128"
echo "devices vulnerable to http-vuln-cve2014-2128" >> $3_vulns_summary
cat $3_http-vuln-cve2014-2128 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2014-2128 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2014-2129"
cat $3_http-vuln-cve2014-2129|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-cve2014-2129" > $3_vulns_summary 
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

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2014-8877"
echo "devices vulnerable to http-vuln-cve2014-8877" >> $3_vulns_summary
cat $3_http-vuln-cve2014-8877 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2014-8877 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to http-vuln-cve2015-1427"
cat $3_http-vuln-cve2015-1427|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-cve2015-1427" > $3_vulns_summary 
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

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-cve2017-1001000"
echo "devices vulnerable to http-vuln-cve2017-1001000" >> $3_vulns_summary
cat $3_http-vuln-cve2017-1001000 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-cve2017-1001000 |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to http-vuln-cve2017-5638"
cat $3_http-vuln-cve2017-5638|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-cve2017-5638" > $3_vulns_summary 
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

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary


echo "bellow devices vulnerable to http-vuln-misfortune-cookie"
echo "devices vulnerable to http-vuln-misfortune-cookie" >> $3_vulns_summary
cat $3_http-vuln-misfortune-cookie |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
cat $3_http-vuln-misfortune-cookie |grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b" >>  $3_vulns_summary

echo ""
echo "" 

echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo "bellow devices vulnerable to http-vuln-wnr1000-creds"
cat $3_http-vuln-wnr1000-creds|grep -B 7 'VULNER\|vulner'|grep -oE "\b([0-9]{1,3}\.){3}[0-9]{1,3}\b"
echo "devices vulnerable to http-vuln-wnr1000-creds.nse" > $3_vulns_summary 
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


echo    >>  $3_vulns_summary
echo    >>  $3_vulns_summary

echo ""
echo ""

echo SUMMARY OF VULNERABILITIES WRITTEN TO $3_vulns_summary  !!!

echo ""
echo ""
echo "happy pentesting :) "
echo ""
