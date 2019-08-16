# mongodb to mysql
有多种方式实现，如下
##  mongoexport + mysqlimport
 优点：速度快，导几十万条数据的表，也只需要秒级
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
 
 ## python脚本
 
 需要通过python 的db驱动写相应的查询，繁琐，且效率不高
 建议使用pandas + sqlalchemy + cStringIO
 效率也不逊色
 ```python
 # 国外大牛对pandas to_sql的优化
import cStringIO
 
output = cStringIO.StringIO()
# ignore the index
df_a.to_csv(output, sep='\t',index = False, header = False)
output.getvalue()
# jump to start of stream
output.seek(0)
 
connection = engine.raw_connection() #engine 是 from sqlalchemy import create_engine
cursor = connection.cursor()
# null value become ''
cursor.copy_from(output,table_name,null='')
connection.commit()
```
 
 
 
 
 
 
 
 
