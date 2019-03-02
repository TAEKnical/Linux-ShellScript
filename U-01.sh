#! /bin/bash
source myfunctions.sh

#u-01 'pts' is nowhere
#STEP 1"
echo "[U-01] 계정 원격 접속 제한"
if [ !$(find /etc -name securetty | grep pts) ]; then
   pass
   echo "/etc/securetty에 pts 설정이 존재하지 않습니다."
else
   warning
   echo "/etc/securetty에 pts 관련 설정이 존재하지 않아야 합니다." 
fi

#STEP 2
if [ !$(find /etc/pam.d -name login | grep "auth required /lib/security/pam_securetty.so") ];then
   warning
   echo "/etc/pam.d/login 파일에 auth required /lib/security/pam_securetty.so가 없습니다."
else
   pass
   echo "/etc/pam.d/login 파일에 auth required /lib/security/pam_securetty.so이 있습니다."

fi
echo -e -n "\n"