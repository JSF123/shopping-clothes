//
//  HttpManager.h
//  ManShopping
//
//  Created by student on 16/6/13.
//  Copyright © 2016年 student. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HttpManager : NSObject

+ (void)getNewInfoWithURL:(NSString *)url with:(void(^)(NSMutableArray * arr))myBlock;

@end
