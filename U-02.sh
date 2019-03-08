#! /bin/bash


source myfunctions.sh

#u-02
echo "[U-02] �н����� ���⼺ ����"
#Step1 is not important"
#step2
if [ -n "$(cat "/proc/version" |grep "Red Hat 7")" ];then #RHEL7
   echo "Red Hat Enterprise Linux version is 7.x"
else
#elif [ -n "$(cat /proc/version | grep "Red Hat 5")" ];then #RHEL5
   echo "Red Hat Enterprise Linux version is 5.x"
   while read A B C
   do
      if [[ "$A" =~ "password" ]];then
         echo "[lcredit] �ּ� �ҹ��� �䱸"
         if [[ !("$C" =~ "lcredit=-1") ]];then
            warning
            echo "$A $B $C�� lcredit ������ �ʿ��մϴ�."
         
         else
            pass
            echo "$A $B $C"
         fi
         echo "[ucredit] �ּ� �빮�� �䱸"
                        if [[ !("$C" =~ "ucredit=-1") ]];then
                                warning
                                echo "$A $B $C�� ucredit ������ �ʿ��մϴ�."

                        else
                                pass
                                echo "$A $B $C"
                        fi
         echo "[dcredit] �ּ� ���� �䱸"
                        if [[ !("$C" =~ "dcredit=-1") ]];then
                                warning
                                echo "$A $B $C�� dcredit ������ �ʿ��մϴ�."

                        else
                                pass
                                echo "$A $B $C"
                        fi
         echo "[ocredit] �ּ� Ư������ �䱸"
                        if [[ !("$C" =~ "ocredit=-1") ]];then
                                warning
                                echo "$A $B $C�� ocredit ������ �ʿ��մϴ�."

                        else
                                pass
                                echo "$A $B $C"
                        fi
         echo "[minlen] �ּ� �н����� ����"
                        if [[ !("$C" =~ "minlen=") ]];then
                                warning
                                echo "$A $B $C�� minlen ������ �ʿ��մϴ�."

                        else
                                pass
                                echo "$A $B $C"
                        fi
         echo "[retry] ��õ� Ƚ��"
                        if [[ !("$C" =~ "retry=") ]];then
                                warning
                                echo "$A $B $C�� retry ������ �ʿ��մϴ�."

                        else
                                pass
                                echo "$A $B $C"
                        fi
         echo "[difok] ���� �н������ ��"
         if [[ !("$C" =~ "defok=") ]];then
            warning
            echo "$A $B $C�� difok ������ �ʿ��մϴ�."
         else
            pass
            echo "$A $B $C"
         fi
      fi      
   done < /etc/pam.d/system-auth
fi

#step3
if [ -n "$(grep pass_warn_age  /etc/login.defs)" ];then
   pass
   echo "�н����� �Ⱓ ���� ��� ������ �����մϴ�."
else
   warning
   echo "�н����� �Ⱓ ���� ��� ������ �������� �ʽ��ϴ�."
fi

if [ -n "$(grep pass_max_days  /etc/login.defs)" ];then
        pass
        echo "�н����� ��� �Ⱓ  ������ �����մϴ�."
else
        warning
        echo "�н����� ��� �Ⱓ  ������ �������� �ʽ��ϴ�."
fi

if [ -n "$(grep pass_min_day  /etc/login.defs)" ];then
        pass
        echo "�н����� �ּ� �����Ⱓ ������ �����մϴ�."
else
	warning        
        echo "�н����� �ּ� �����Ⱓ ������ �������� �ʽ��ϴ�."
fi

info
echo "cat /proc/version"
echo -e -n "\n"
