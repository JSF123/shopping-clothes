//
//  VeryNewModel.m
//  ManShopping
//
//  Created by student on 16/6/13.
//  Copyright © 2016年 student. All rights reserved.
//

#import "VeryNewModel.h"


@implementation VeryNewModel


- (NSString *)description{

  return  [NSString stringWithFormat:@"%f,%f,%@,%@,%@,%@",self.height,self.width,self.PicURL,self.itemsCount,self.collectionCount,self.title];

   
}
@end
