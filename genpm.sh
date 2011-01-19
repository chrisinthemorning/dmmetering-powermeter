#!/bin/sh
cat <<End-of-message
<?xml version='1.0' encoding='utf-8'?>
<entry xmlns='http://www.w3.org/2005/Atom'
 xmlns:meter='http://schemas.google.com/meter/2008'>
   <meter:endTime meter:uncertainty="1.0">`date +%Y-%m-%dT%H:%M:%S.000Z`</meter:endTime>
   <meter:duration meter:uncertainty="1.0">600</meter:duration>
   <meter:quantity meter:uncertainty="0.001" meter:unit="kW h">`perl /root/readpower.pl`</meter:quantity>
</entry>
End-of-message
