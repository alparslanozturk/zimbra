#!/bin/bash


aktar_script=/tmp/hesap-aktar.sh
echo  '' > ${aktar_script}
sayac=0

accounts=`zmprov -l gaa | egrep -v 'admin|wiki|galsync|spam|ham|virus|stimpson'`;
for account in ${accounts}; do
  echo "Cikarilan Hesap: ${account} ..."
  dn=`zmprov -l ga ${account} displayName | grep displayName | sed 's/displayName: //'`;
  up=`zmprov -l ga ${account} userPassword | grep userPassword | sed 's/userPassword: //'`;
  
  # import script olusturuluyor
  echo "echo 'Aktarilan Hesap: ${account}'" >> ${aktar_script} 
  echo "zmprov ca ${account} ${up} displayName '${dn}'" >> ${aktar_script}
  echo "zmprov ma ${account} userPassword '${up}'" >> ${aktar_script}
  echo '' >>  ${aktar_script}
  let sayac=sayac+1    
done

echo "Bitti";
echo "scp ${aktar_script} 172.16.54.x:";
