//
//  CustomButton.h
//  ShoppingClothes
//
//  Created by student on 16/6/8.
//  Copyright © 2016年 jing. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CustomButton : UIButton


@property (nonatomic,strong)UIImageView *image;

@property (nonatomic,strong)UILabel *butLabel;


- (void)getCustomButtonTop:(NSString *)topImage WithButom:(NSString *)butomLabel;

- (void)getCustomRightTop:(NSString *)topImage WithButom:(NSString *)butomLabel;

@end
