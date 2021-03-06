#/bin/bash
# 此份脚本提供了与daliansky相似的platform-id与核心显卡的对应关系信息
# 脚本是有意义的，可以避免查表格直接获取相关信息
# 脚本的不足之处是对评定不足
# 不能简单根据CPU首数字评定相应架构
# 如i7-8550U不能简单评定为Coffee Lake而应是Kaby Lake - R(efresh) （实际架构）
# 可考虑建立数据库进行修正，但不应让使用者过多操作违背了脚本的初衷
# Commented 2021.1.16

cpuinfo(){
not_support="0"
# cpuinfo start
os="$(uname)"
if [[ ! $os =~ "Linux" ]];then
cpu_raw="$(sysctl -n machdep.cpu.brand_string)"
cpuinfo="$(echo $cpu_raw | awk -F ' ' '{print $3}')"

else
	if [[ -f /proc/cpuinfo ]];then
		cpu_raw="$(cat /proc/cpuinfo | grep "model na" | uniq)"
		if [[ ! $cpu_raw =~ "Core" ]];then not_support="1";fi
	else
		not_support="1"
	fi
	if [[ $not_support == "1" ]];then 
cat<<DEBUGINFO

==========================
Your PC my not support to go for hackintosh
However You may custom CPU
for debuging here. eg. [i7-6700HQ]
DEBUGINFO
		read -p "Custom :[]" cus_cpu
		echo
		if [[ ! $cus_cpu ]];then cus_cpu='i7-6700HQ';fi
		#echo "cus_cpu is $cus_cpu"		
		cpu_raw="$(echo | awk -v b="$cus_cpu" 'BEGIN{a="model name : Intel(R) Core(TM) ";c=" CPU @ 2.5GHz";d=(a""b""c);print d}')"
	fi
	cpuinfo="$(echo $cpu_raw | awk -F ' ' '{print $6}')"
	#echo $cpu_raw
fi

cpuinfo_core="$(echo $cpuinfo | awk -F '-' '{print $1}')"
cpuinfo_plat="$(echo $cpuinfo | awk -F '-' '{print $2}')"

#debug here
#cpuinfo_plat=3600HQ

cpuinfo_plat_num_raw="$(echo $cpuinfo_plat | tr -cd "[0-9]")"
declare -i cpuinfo_plat_num=$cpuinfo_plat_num_raw

echo "CPU: $cpuinfo_core"
echo "Platform: $cpuinfo_plat"

cpuinfo_arg0="${cpuinfo_core:0:1}"
declare -i cpuinfo_plat_num_arg0=$cpuinfo_plat_num-10000


if [[ $cpuinfo_plat_num_arg0 -ge 0 ]];then
	cpuinfo_arg1="${cpuinfo_plat_num:0:2}"
else
	cpuinfo_arg1="${cpuinfo_plat_num:0:1}"
fi


if [[ $cpuinfo_arg0 == "i" ]];then
if [[ ! $os =~ "Linux" ]];then
	echo "Intel \c"
else
	echo -e "Intel \c"
fi
# Platform
case $cpuinfo_arg1 in
1)
	cpuinfo_plat_name="Arrandale"
;;
2)
	cpuinfo_plat_name="Sandy-Bridge"
;;
3)
	cpuinfo_plat_name="Ivy-Bridge"
;;
4)
	cpuinfo_plat_name="Haswell"
;;
5)
	cpuinfo_plat_name="Broadwell"
;;
6)
	cpuinfo_plat_name="SkyLake"
;;
7)
	cpuinfo_plat_name="Kaby-Lake"
;;
8)
	cpuinfo_plat_name="Coffee-Lake"
;;
9)
        cpuinfo_plat_name="Coffee-Lake-Plus"
;;
10)
	cpuinfo_plat_name="IceLake"
;;
*)
	echo "\n Unkown"
	exit 0
;;
esac
	
	echo $cpuinfo_plat_name
fi
cpuinfo_plat_name_tr="$(echo $cpuinfo_plat_name | tr 'A-Z' 'a-z')"
# cpuinfo end
}

guide_url(){
#laptop
base_url="https://dortania.github.io/OpenCore-Install-Guide/"
pc_type="config"
if [[ ! $os =~ "Linux" ]];then
	#mac set as laptop by default, update later
	pc_type="config-laptop"
else
	#bat_check="$(ls /sys/class/power_supply)"
	if [[ -d /sys/class/power_supply/BAT0 ]] ;then
		pc_type="config-laptop"
	fi	
fi

if [[ ! $cpuinfo_plat_name ]];then
	dortania_url=$base_url
else
	dortania_url="$(echo | awk 'BEGIN{a="'$base_url'";b="'$pc_type'";c=".plist/";d="'$cpuinfo_plat_name_tr'";e=".html";f=(a""b""c""d""e);print f}')"
fi

if [[ ! $os =~ "Linux" ]];then
echo "\n>>> Start here:"
echo "\033[1;4;34m$dortania_url \033[0m"
else
echo -e "\n>>> Start here:"
echo -e "\033[1;4;34m$dortania_url \033[0m"
fi	
}

smbios(){
# smbios start
# adjust echo
# because of "-e" of "echo -e" printed on screen on mac but GNU/Linux not

if [[ ! $os =~ "Linux" ]];then
#print green
model_pt_g='echo "Device Model: \033[1;32m$smbios_model\033[0m"'
plat_id_pt_g='echo "Platform-id : \033[1;32m$smbios_platform_id\033[0m"'
graph_pt_g='echo "Graphics    : \033[1;32m$smbios_graphics\033[0m"'

#print yellow
model_pt_y='echo "Device Model: \033[33m$smbios_model\033[0m"'
plat_id_pt_y='echo "Platform-id : \033[33m$smbios_platform_id\033[0m"'
graph_pt_y='echo "Graphics    : \033[33m$smbios_graphics\033[0m"'
else
model_pt_g='echo -e "Device Model: \033[1;32m$smbios_model\033[0m"'
plat_id_pt_g='echo -e "Platform-id : \033[1;32m$smbios_platform_id\033[0m"'
graph_pt_g='echo -e "Graphics    : \033[1;32m$smbios_graphics\033[0m"'

#print yellow
model_pt_y='echo -e "Device Model: \033[33m$smbios_model\033[0m"'
plat_id_pt_y='echo -e "Platform-id : \033[33m$smbios_platform_id\033[0m"'
graph_pt_y='echo -e "Graphics    : \033[33m$smbios_graphics\033[0m"'
fi

smbios_database=../smbios/$cpuinfo_plat_name_tr.txt
smbios_result_database=../smbios/tmp.txt
if [[ -f $smbios_database ]];then

:<<!
	smbios_num="$(echo "$(wc -l $smbios_database)" | awk -F ' ' '{print $1}')"
!

	# Search module
	read -p "Search :[] " search_model
	search_result_num="$(cat $smbios_database | grep "$search_model" | awk 'END{print NR}')"
	declare -i smbios_num=$search_result_num
	echo "search_result_num: $search_result_num"

:<<!
	echo "====== RAW STRAT ======="
	cat $smbios_database | grep "$search_model"
	echo "====== RAW END =======\n"
!
	cat $smbios_database | grep "$search_model" > $smbios_result_database
	declare -i smbios_arg0=1
	until [[ ! smbios_arg0 -le $smbios_num ]]
	do
		#echo "Now is $smbios_arg0 Line"
		smbios="$(sed -n "$smbios_arg0"p $smbios_result_database)"
		smbios_model="$(echo $smbios | awk -F ' ' '{print $2}')"
		smbios_platform_id="$(echo $smbios | awk -F ' ' '{print $1}')"
		smbios_graphics="$(echo $smbios | awk -F ' ' '{print $7}')"
		echo "= $smbios_arg0 ============================="

		if [[ $smbios_model != "?" ]];then
			if [[ $smbios_model =~ "Mac" ]];then
				eval $model_pt_g
				eval $plat_id_pt_g
				eval $graph_pt_g
			else
				eval $model_pt_y
				eval $plat_id_pt_y
				eval $graph_pt_y
			fi
		else
			echo "Device Model: $smbios_model"
			echo "Platform-id : $smbios_platform_id"
			echo "Graphics    : $smbios_graphics"
		fi
		echo
		let smbios_arg0++
	done
	rm -f $smbios_result_database

else
	echo 'no smbios database'
fi
}

cpuinfo

smbios
guide_url


