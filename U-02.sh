#! /bin/bash


source myfunctions.sh

#u-02
echo "[U-02] 패스워드 복잡성 설정"
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
         echo "[lcredit] 최소 소문자 요구"
         if [[ !("$C" =~ "lcredit=-1") ]];then
            warning
            echo "$A $B $C에 lcredit 설정이 필요합니다."
         
         else
            pass
            echo "$A $B $C"
         fi
         echo "[ucredit] 최소 대문자 요구"
                        if [[ !("$C" =~ "ucredit=-1") ]];then
                                warning
                                echo "$A $B $C에 ucredit 설정이 필요합니다."

                        else
                                pass
                                echo "$A $B $C"
                        fi
         echo "[dcredit] 최소 숫자 요구"
                        if [[ !("$C" =~ "dcredit=-1") ]];then
                                warning
                                echo "$A $B $C에 dcredit 설정이 필요합니다."

                        else
                                pass
                                echo "$A $B $C"
                        fi
         echo "[ocredit] 최소 특수문자 요구"
                        if [[ !("$C" =~ "ocredit=-1") ]];then
                                warning
                                echo "$A $B $C에 ocredit 설정이 필요합니다."

                        else
                                pass
                                echo "$A $B $C"
                        fi
         echo "[minlen] 최소 패스워드 길이"
                        if [[ !("$C" =~ "minlen=") ]];then
                                warning
                                echo "$A $B $C에 minlen 설정이 필요합니다."

                        else
                                pass
                                echo "$A $B $C"
                        fi
         echo "[retry] 재시도 횟수"
                        if [[ !("$C" =~ "retry=") ]];then
                                warning
                                echo "$A $B $C에 retry 설정이 필요합니다."

                        else
                                pass
                                echo "$A $B $C"
                        fi
         echo "[difok] 기존 패스워드와 비교"
         if [[ !("$C" =~ "defok=") ]];then
            warning
            echo "$A $B $C에 difok 설정이 필요합니다."
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
   echo "패스워드 기간 만료 경고 설정이 존재합니다."
else
   warning
   echo "패스워드 기간 만료 경고 설정이 존재하지 않습니다."
fi

if [ -n "$(grep pass_max_days  /etc/login.defs)" ];then
        pass
        echo "패스워드 사용 기간  설정이 존재합니다."
else
        warning
        echo "패스워드 사용 기간  설정이 존재하지 않습니다."
fi

if [ -n "$(grep pass_min_day  /etc/login.defs)" ];then
        pass
        echo "패스워드 최소 유지기간 설정이 존재합니다."
else
	warning        
        echo "패스워드 최소 유지기간 설정이 존재하지 않습니다."
fi

info
echo "cat /proc/version"
echo -e -n "\n"
