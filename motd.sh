#!/bin/bash
# 功能:动态banner
# 编写日期:2023/02/25
# 编写者:俺

printf "********************************\n"
printf "%-4s ChinaSkills 2022 CSK\n"
printf "%-6s Module C Linux\n"
printf "\n"
printf "%-8s >>"`hostname`"<<\n"
echo "  >> "`cat /etc/redhat-release | cut -f 2-4 -d " "`"<<"
echo ">>"`date`"<<"
printf "********************************\n"
