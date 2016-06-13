//
//  CollocationView.m
//  ManShopping
//
//  Created by student on 16/6/11.
//  Copyright © 2016年 student. All rights reserved.
//

#import "CollocationView.h"

@implementation CollocationView

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
        
        _selectedBtn = [UIButton buttonWithType:UIButtonTypeCustom];
       NSString * path = [[NSBundle mainBundle]
                          pathForResource:@"icon_class_open@2x" ofType:@"png"];
        [_selectedBtn setBackgroundImage:[UIImage imageWithContentsOfFile:path] forState:UIControlStateNormal];
        _selectedBtn.frame = CGRectMake(KMainW-60, 15, 30, 30);
        
        [self addSubview:_selectedBtn];
                
    }
    return self;
}


@end
