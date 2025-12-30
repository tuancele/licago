#!/bin/bash
export MYSQL_USER=root
export MYSQL_PASSWORD=root
export MYSQL_HOST=127.0.0.1
export GO_ENV=test
services=("user" "product" "cart" "order" "payment" "checkout" "email" "frontend")

root_path=$(pwd)

echo ">>> Bat dau khoi dong cac dich vu..."

for svc in "${services[@]}"; do
    service_dir="$root_path/app/$svc"
    
    # Kiem tra thu muc ton tai khong
    if [ -d "$service_dir" ]; then
        echo " -> Dang khoi dong: $svc ..."
        
        # Di chuyen vao thu muc service de chay (de nhan dung file config)
        cd "$service_dir"
        
        # Chay lenh go run va ghi log ra file rieng
        nohup go run . > "$service_dir/${svc}.log" 2>&1 &
        
        # Doi 5 giay de service on dinh truoc khi chay cai tiep theo (giam tai CPU)
        sleep 5
    else
        echo " [!] Khong tim thay thu muc: $service_dir"
    fi
done

echo ">>> Hoan tat! Kiem tra trang thai bang lenh: ps aux | grep go"
