//
//  HttpManager.m
//  ManShopping
//
//  Created by student on 16/6/13.
//  Copyright © 2016年 student. All rights reserved.
//

#import "HttpManager.h"
#import "AFNetworking.h"
#import "VeryNewModel.h"


@implementation HttpManager

+ (void)getNewInfoWithURL:(NSString *)url with:(void(^)(NSMutableArray * arr))myBlock{
    
    NSMutableArray * dataArr = [NSMutableArray array];
    AFHTTPSessionManager * manager = [AFHTTPSessionManager manager];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    manager.responseSerializer.acceptableContentTypes = [NSSet setWithObjects:@"text/plain",@"application/json", nil];
    [manager GET:url parameters:@{} success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
      
      NSDictionary * dic = [NSJSONSerialization JSONObjectWithData:responseObject options: NSJSONReadingMutableLeaves error:nil];
        
        NSArray * arr = dic[@"data"][@"items"];
       // NSLog(@"%@",arr);
        
        for (NSDictionary * dic1 in arr) {
            
            VeryNewModel * model = [VeryNewModel new];
            model.height = [dic1[@"height"]floatValue];
            model.width = [dic1[@"width"]floatValue];
            model.collectionCount = dic1[@"component"][@"collectionCount"];
            model.title = dic1[@"component"][@"description"];
            model.PicURL =  dic1[@"component"][@"picUrl"];
            model.itemsCount =dic1[@"component"][@"itemsCount"];
            [dataArr addObject:model];
           
        }
       
        if (myBlock) {
            myBlock(dataArr);
        }
        
  } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
      NSLog(@"%@",error.localizedDescription);
  }];

}

@end
