//
//  CustomButton.m
//  ShoppingClothes
//
//  Created by student on 16/6/8.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "CustomButton.h"

@implementation CustomButton

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self createView];
    }
    return self;
}

- (void)createView{
    UIImageView * imageView = [[UIImageView alloc]init];
    
    [self addSubview:imageView];
    self.image = imageView;
    
    UILabel * label = [[UILabel alloc]init];
    
    [self addSubview:label];
    self.butLabel = label;
}

- (void)getCustomButtonTop:(NSString *)topImage WithButom:(NSString *)butomLabel{
    self.image.frame =CGRectMake(0, 0, 25, 25);
    self.image.image = [UIImage imageNamed:topImage];
    
    
    self.butLabel.frame = CGRectMake(0, 25, 25, 15);
    self.butLabel.font = [UIFont systemFontOfSize:12];
    self.butLabel.text = butomLabel;
}

- (void)getCustomRightTop:(NSString *)topImage WithButom:(NSString *)butomLabel{
    self.image.frame =CGRectMake(0, 0, 36, 25);
    self.image.image = [UIImage imageNamed:topImage];
    
    
    self.butLabel.frame = CGRectMake(0, 25, 36, 15);
    self.butLabel.font = [UIFont systemFontOfSize:12];
    self.butLabel.text = butomLabel;
}

@end
