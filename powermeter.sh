#!/bin/sh
sh /root/genpm.sh > /tmp/pm

#curl --silent --data-binary "@/tmp/pm"  --header "Content-Type: application/atom+xml" --header "Authorization: AuthSub token=yourtoken" "https://www.google.com/powermeter/feeds/user/userid/userid/variable/devicename.d1/durMeasurement" >> /tmp/curl.log 
  
