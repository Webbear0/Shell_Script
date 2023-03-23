#!/bin/bash
# 功能:yum更换本地源
# 编写日期:2023/03/17
# 编写者:俺

mkdir /media/CentOS
if [ -e  /dev/sr0 ];then
	read -p "是否开机自动挂载镜像? y/n:" input
	while True:
	do
		if [ ${input} == "y" ];then
			echo “/dev/cdrom /media/CentOS/ iso9660 ro 0 0” >> /etc/fstab
		elif [ ${input} == "n" ];then
			echo “/dev/cdrom /media/CentOS/ iso9660 noauto 0 0” >> /etc/fstab
		fi
	done
	mount -a
	cd /etc/yum.repos.d/
	mv CentOS-Base.repo CentOS-Base.repo.bak
	sed -i “s/gpgcheck=1//g” CentOS-Media.repo
	sed -i 's/0/1/g' CentOS-Media.repo
	yum clean all && yum makecache
	echo "本地源更换成功"
	exit 0
else
	exit 1
fi

