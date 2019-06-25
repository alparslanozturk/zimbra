
#zimbra


1. kurulum aşamaları: 


nmcli connection modify ens32 ipv4.addresses 1.1.1.7/24
nmcli connection modify ens32 ipv4.method manual 
nmcli connection modify ens32 ipv4.dns "127.0.0.1 8.8.8.8"





2. bind doslayalaı


named.conf
named.mhrs
named.mhrs-rev


3. git ayarları: 

git config credential.helper store




