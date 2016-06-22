//
//  FMDBShopping.h
//  ShoppingClothes
//
//  Created by student on 16/6/15.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface FMDBShopping : NSObject
//创建数据库
+ (void)createDatabase;

+ (void)insertIntoDataByID:(NSArray *)urlArr;

+(NSMutableArray *)selectDatabase;

//创建表
//
//- (void)createTable:(NSString *)table WithPar:(NSDictionary*)par;
//插入数据  分一条和N条
//- (void)insertDtata:(NSDictionary *)data withTable:(NSString *)table;




@end
