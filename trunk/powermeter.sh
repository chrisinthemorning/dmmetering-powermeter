#!/bin/sh
sh /root/genpm.sh > /tmp/pm

#curl --silent --data-binary "@/tmp/pm"  --header "Content-Type: application/atom+xml" --header "Authorization: AuthSub token=CNWZs4KhFRCn7sWs_v____8BGM78lIgG" "https://www.google.com/powermeter/feeds/user/07733944393685196730/07733944393685196730/variable/DM.ADM15TE.abcdefg.d1/durMeasurement" >> /tmp/curl.log 
  
