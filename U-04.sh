#! /bin/bash


source myfunctions.sh

#[U-04]
echo "[U-04] �н����� ���� ��ȣ"
#step1
if [ $(find "/etc/shadow") ];then
   pass
   echo "/etc/shadow ����"
else
   warning
   echo "/etc/shadow ����"
fi

#step2
error=0
while read line
do
   if [[ !("$line" =~ ":x:") ]];then
      warning
      echo "�� ��° �ʵ尡 x�� �������� ���� ������ �ֽ��ϴ�."
      error=1
      break
   fi
done < /etc/passwd

if [ $error -eq 0 ];then
   pass
   echo "�н����� ���� ��ȣ"
fi

echo -e -n "\n"
