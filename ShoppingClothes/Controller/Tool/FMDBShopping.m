//
//  FMDBShopping.m
//  ShoppingClothes
//
//  Created by student on 16/6/15.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "FMDBShopping.h"
#import "FMDB.h"

static FMDatabase *db;

@implementation FMDBShopping


+ (void)createDatabase{
    if (db==nil) {
        db = [[FMDatabase alloc]initWithPath:[self getPathFrom]];
        [db open];
        NSString *createSQL = @"create table if not exists oneSection(id integer primary key autoincrement,urlStr text)";
        [db executeUpdate:createSQL];
        [db close];
    }
    NSLog(@"%@",[self getPathFrom]);
}

+ (NSString *)getPathFrom{
    NSString *path = [NSHomeDirectory() stringByAppendingPathComponent:@"Documents/oneSection.sqlite"];
    return path;
}

+ (void)insertIntoDataByID:(NSArray *)urlArr{
    if (urlArr.count==0) {
        return;
    }
    [db open];
    for (NSInteger i=0; i<urlArr.count; i++) {
        NSString *insertSQL = [NSString stringWithFormat:@"insert into oneSection(urlStr)values('%@')",urlArr[i]];
        [db executeUpdate:insertSQL];
    }
    [db close];
}

+(NSMutableArray *)selectDatabase{
    NSMutableArray *arr = [NSMutableArray array];
    [db open];
    NSString *selectSQL = @"select * from oneSection";
    FMResultSet *set = [db executeQuery:selectSQL];
    while ([set next]) {
        NSString *str = [set stringForColumn:@"urlStr"];
        [arr addObject:str];
    }
    [set close];
    [db close];
    return arr;
}



- (void)createTable:(NSString *)table WithPar:(NSDictionary*)par{
    //1.首先判断 表名 和 par 是否为空 为空就返回
    //2.如果表存在返回
    //3.根据 par 中keys 创建表
    //4.创建成功之后返回
    
}

- (void)insertDtata:(NSDictionary *)data withTable:(NSString *)table{
    //1.首先判断 table和data 是否为空
    //2.解析 data
    //3.先判断table里面有没有相同的数据 如果没有继续
    //如果有 就调用 update
    //4.是需要对词表进行 Key关联就能实现 表关联
    //
}



@end
