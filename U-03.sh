#! /bin/bash


source myfunctions.sh


#[U-03]
echo "[U-03] 계정 잠금 임계값 설정"
while read A B C
do
if [[ "$A" == "auth" ]];then
   if [[ !("$C" =~ "no_magic_root") ]];then
      warning
      echo "$A $B $C의 계정 잠금 임계값 설정이 미흡합니다."
   elif [[ !("$C" =~ "deny") ]];then
      warning
      echo "$A $B $C의 계정 잠금 임계값 설정이 미흡합니다."
   elif [[ !("$C" =~ "unlock_time") ]];then
      warning
      echo "$A $B $C의 게정 잠금 임계값 설정이 미흡합니다."
   elif [[ !("$C" =~ "reset") ]];then
      warning
      echo "$A $B $C의 계정 잠금 임계값 설정이 미흡합니다."
   else
      pass
      echo "계정 잠금 임계값 설정"
   fi
fi
done < /etc/pam.d/system-auth

echo -e -n "\n"