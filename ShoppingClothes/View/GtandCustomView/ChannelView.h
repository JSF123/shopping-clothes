//
//  ChannelView.h
//  ManShopping
//
//  Created by student on 16/6/12.
//  Copyright © 2016年 student. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ChannelView : UIView

@property (nonatomic,strong) NSMutableArray * dataArr;

- (instancetype)initWithFrame:(CGRect)frame arr:(NSMutableArray*)arr;

@end
