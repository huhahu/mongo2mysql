mysqlimport --ignore-lines=1  --fields-terminated-by=, --local --host 127.0.0.1 -u dw -p ods ~/data/$(date +%Y%m%d)/suning_goods.csv
