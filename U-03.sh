#! /bin/bash


source myfunctions.sh


#[U-03]
echo "[U-03] ���� ��� �Ӱ谪 ����"
while read A B C
do
if [[ "$A" == "auth" ]];then
   if [[ !("$C" =~ "no_magic_root") ]];then
      warning
      echo "$A $B $C�� ���� ��� �Ӱ谪 ������ �����մϴ�."
   elif [[ !("$C" =~ "deny") ]];then
      warning
      echo "$A $B $C�� ���� ��� �Ӱ谪 ������ �����մϴ�."
   elif [[ !("$C" =~ "unlock_time") ]];then
      warning
      echo "$A $B $C�� ���� ��� �Ӱ谪 ������ �����մϴ�."
   elif [[ !("$C" =~ "reset") ]];then
      warning
      echo "$A $B $C�� ���� ��� �Ӱ谪 ������ �����մϴ�."
   else
      pass
      echo "���� ��� �Ӱ谪 ����"
   fi
fi
done < /etc/pam.d/system-auth

echo -e -n "\n"