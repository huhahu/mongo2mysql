mongoexport -d ods -c suning_goods -f "csCatalog,goodType,goodsCode,goodsInventoryQty,goodsMerchantCode,goodsName,goodsSaleCount,goodsSaleCountStr,pictureUrl,storeName,address,poiId,poiName,outPoiId,locLat,locLng,provName,cityName,districtName,townName,crawl_time" --type csv -o ~/data/$(date +%Y%m%d)/suning_goods.csv
ssh root@192.168.50.154 'mkdir -p  ~/data/$(date +%Y%m%d)/'
scp -r ~/data/$(date +%Y%m%d)/suning_goods.csv root@192.168.50.154:~/data/$(date +%Y%m%d)/


