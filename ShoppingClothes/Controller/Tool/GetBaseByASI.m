//
//  GetBaseByASI.m
//  ShoppingClothes
//
//  Created by student on 16/6/11.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "GetBaseByASI.h"
#import "AFNetworking.h"
#import "CommodityModel.h"
@implementation GetBaseByASI

+ (void)getTopScrollBase:(void(^)(NSArray *topArr))myBlock{
    NSMutableArray *array = [NSMutableArray array];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    [manager GET:@"http://api-v2.mall.hichao.com/mall/banner?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc" parameters:@{} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //NSLog(@"%@",[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = dic[@"data"][@"items"];
        for (NSDictionary *dic in arr) {
            
            NSDictionary *picDic = dic[
                                       @"component"];
            NSString *str = picDic[@"picUrl"];
           // NSLog(@"%@",model.picUrl);
            [array addObject:str];
        }
        if (myBlock) {
            myBlock(array);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];
}


+ (void)getTwoBtnBase:(void(^)(NSArray *twoBtnArr))myBlock{
    NSMutableArray *array = [NSMutableArray array];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/html", nil];
    [manager GET:@"http://api-v2.mall.hichao.com/active/flash/list?gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=3AEA3040-97FF-4E88-9E3B-510CFAF52E5E&gs=640x1136&gos=9.2.1&access_token=7CEzE_UoMtSqN9sTxKezUqDrTBIzlqRi54H985sQ7mc" parameters:@{} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //NSLog(@"%@",[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *responseDic = dic[@"response"];
        NSArray *arr = responseDic[@"data"][@"items"];
        for (NSDictionary *dic in arr) {
            NSDictionary *actionDic = dic[@"component"];
            NSString *str = actionDic[@"img_index"];
             //NSLog(@"%@",str);
            [array addObject:str];
        }
        if (myBlock) {
            myBlock(array);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}

- (void)getCountryProduceBase:(NSString *)urlStr WithBlock:(void(^)(NSArray *countryArr))myBlock{
    NSMutableArray *nameArr = [NSMutableArray array];
    NSMutableArray *brandsArr = [NSMutableArray array];
    NSMutableArray *picturesArr = [NSMutableArray array];
    NSMutableArray *skusArr = [NSMutableArray array];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    [manager GET:urlStr parameters:@{} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //NSLog(@"%@",[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSDictionary *dataDic = dic[@"data"];
        NSArray *namearr = dataDic[@"region_name"];
        for (NSDictionary *dic in namearr) {
            NSDictionary *picDic = dic[@"component"];
            NSString *str = picDic[@"picUrl"];
            // NSLog(@"%@",model.picUrl);
            [nameArr addObject:str];
        }
        NSArray *brandsarr = dataDic[@"region_brands"];
        for (NSDictionary *dic in brandsarr) {
            NSDictionary *picDic = dic[@"component"];
            NSString *str = picDic[@"picUrl"];
            // NSLog(@"%@",model.picUrl);
            [brandsArr addObject:str];
        }
        NSArray *picturessarr = dataDic[@"region_pictures"];
        for (NSDictionary *dic in picturessarr) {
            NSDictionary *picDic = dic[@"component"];
            NSString *str = picDic[@"picUrl"];
            // NSLog(@"%@",model.picUrl);
            [picturesArr addObject:str];
        }
        NSArray *skusarr = dataDic[@"region_skus"];
        
        for (NSDictionary *dic in skusarr) {
            CommodityModel *model = [CommodityModel new];
            NSDictionary *picDic = dic[@"component"];
            //NSDictionary *actionDic = picDic[@"action"];
            model.picUrl = picDic[@"picUrl"];
            model.title = picDic[@"title"];
            model.price = picDic[@"price"];
            model.origin_price = picDic[@"origin_price"];
            // NSLog(@"%@",model.picUrl);
//            NSLog(@"---------%@",model.origin_price);
//            NSLog(@"---------=-=%@",model.picUrl);
//            NSLog(@"--------===-%@",model.title);
//            NSLog(@"---------===%@",model.price);
            [skusArr addObject:model];
        }
        NSArray * array = @[nameArr,brandsArr,picturesArr,skusArr];
  
        if (myBlock) {
            myBlock(array);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}

+ (void)getCollectionViewCellBaseUrlStr:(NSString *)urlStr WithBlock:(void(^)(NSArray *cellArr))myBlock{
    NSMutableArray *array = [NSMutableArray array];
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"application/json", nil];
    [manager GET:urlStr parameters:@{} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        //NSLog(@"%@",[[NSString alloc]initWithData:responseObject encoding:NSUTF8StringEncoding]);
        NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:responseObject options:NSJSONReadingMutableContainers error:nil];
        NSArray *arr = dic[@"data"][@"items"];
        for (NSDictionary *dic in arr) {
            CommodityModel *model = [CommodityModel new];
            NSDictionary *picDic = dic[
                                       @"component"];
            NSString *str = picDic[@"picUrl"];
          model.picUrl= [[str componentsSeparatedByString:@"?"] firstObject];
            model.price = picDic[@"price"];
            model.origin_price = picDic[@"origin_price"];
            model.nationalFlag = picDic[@"nationalFlag"];
            model.title = picDic[@"description"];
            model.country = picDic[@"country"];
             //NSLog(@"%@",model.picUrl);
            [array addObject:model];
        }
        if (myBlock) {
            myBlock(array);
            
        }
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@",error);
    }];

}







@end
