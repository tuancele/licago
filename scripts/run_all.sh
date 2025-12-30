#!/bin/bash
. scripts/list_app.sh
get_app_list
readonly root_path=`pwd`
echo "Dang khoi dong cac dich vu..."
for app_path in ${app_list[*]}; do
    echo " -> Dang chay: ${app_path}"
    nohup go run ${root_path}/${app_path}/*.go > /dev/null 2>&1 &
done
echo "Da gui lenh chay cho toan bo dich vu. Vui long doi 1-2 phut!"
