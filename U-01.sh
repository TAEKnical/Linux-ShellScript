#! /bin/bash
source myfunctions.sh

#u-01 'pts' is nowhere
#STEP 1"
echo "[U-01] ���� ���� ���� ����"
if [ !$(find /etc -name securetty | grep pts) ]; then
   pass
   echo "/etc/securetty�� pts ������ �������� �ʽ��ϴ�."
else
   warning
   echo "/etc/securetty�� pts ���� ������ �������� �ʾƾ� �մϴ�." 
fi

#STEP 2
if [ !$(find /etc/pam.d -name login | grep "auth required /lib/security/pam_securetty.so") ];then
   warning
   echo "/etc/pam.d/login ���Ͽ� auth required /lib/security/pam_securetty.so�� �����ϴ�."
else
   pass
   echo "/etc/pam.d/login ���Ͽ� auth required /lib/security/pam_securetty.so�� �ֽ��ϴ�."

fi
echo -e -n "\n"