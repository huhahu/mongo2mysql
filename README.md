# mongodb -> mysql
爬虫抓下来的原始数据存放在mongodb中， 为了给后端提供更方便的进行数据处理分析、把数据从mongodb导入mysql
export_shell脚本负责从mongodb所在服务器（192.168.50.181） 导出csv数据、发送数据到mysql数据库所在服务器
（192.168.50.154）
- mongodb导出csv
    
    执行export_shell中相应表的脚本
    ```
    mongoexport -d ods -c suning_store -f "baiduPoiId,address,baiduPoiName,locLat,locLng,provName,cityName,districtName,crawl_time" --type csv -o ~/data/$(date +%Y%m%d)/suning_store.csv
    ```
- mysql创建表结构
    
    利用mysql工具或者自己手写创建脚本, 需要数据类型与导出类型一致


- csv导入mysql
    
    使用mysql 自带的mysqlimport工具
    ```
    mysqlimport --ignore-lines=1  --fields-terminated-by=, --local --host 127.0.0.1 -u dw -p ods ~/data/data/$(date +%Y%m%d)/suning_goods.csv
    ```
 
