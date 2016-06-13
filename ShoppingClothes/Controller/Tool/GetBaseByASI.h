//
//  GetBaseByASI.h
//  ShoppingClothes
//
//  Created by student on 16/6/11.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface GetBaseByASI : NSObject

+ (void)getTopScrollBase:(void(^)(NSArray *topArr))myBlock;

+ (void)getTwoBtnBase:(void(^)(NSArray *twoBtnArr))myBlock;

- (void)getCountryProduceBase:(NSString *)urlStr WithBlock:(void(^)(NSArray *countryArr))myBlock;

+ (void)getCollectionViewCellBaseUrlStr:(NSString *)urlStr WithBlock:(void(^)(NSArray *cellArr))myBlock;



@end
