//
//  CustomNavigation.h
//  ShoppingClothes
//
//  Created by student on 16/6/7.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomNavigation : UIView

@property (nonatomic,strong)UIButton * leftBtn;

@property (nonatomic,strong)UIButton * rightBtn;

@property (nonatomic,strong)UILabel * middleLable;

@property (nonatomic,strong)UIButton * rightmBtn;


- (void)getNavigationTitleLeft:(NSString *)left  withMiddle:(NSString *)middle withRightM:(NSString *)rightM withRight:(NSString *)right;


@end
