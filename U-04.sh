#! /bin/bash


source myfunctions.sh

#[U-04]
echo "[U-04] 패스워드 파일 보호"
#step1
if [ $(find "/etc/shadow") ];then
   pass
   echo "/etc/shadow 존재"
else
   warning
   echo "/etc/shadow 부재"
fi

#step2
error=0
while read line
do
   if [[ !("$line" =~ ":x:") ]];then
      warning
      echo "두 번째 필드가 x로 설정되지 않은 계정이 있습니다."
      error=1
      break
   fi
done < /etc/passwd

if [ $error -eq 0 ];then
   pass
   echo "패스워드 파일 보호"
fi

echo -e -n "\n"
