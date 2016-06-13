//
//  CustomView.m
//  ManShopping
//
//  Created by student on 16/6/8.
//  Copyright © 2016年 student. All rights reserved.
//

#import "CustomView.h"

@implementation CustomView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame withBool:(BOOL)selected
{
    self = [super initWithFrame:frame];
    if (self) {
        
        if (!_middleBtn) {
            _middleBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            _middleBtn.frame = CGRectMake(KMainW/2-100, 5, 50, 40);
            
            [self addSubview:_middleBtn];
        }
        
        
        if (!_projectBtn) {
            
            _projectBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            _projectBtn.frame = CGRectMake(KMainW/2+50, 5, 50, 40);
            
            
            [self addSubview:_projectBtn];
        }
       
        if (!_rightBtn) {
            _rightBtn = [UIButton buttonWithType:UIButtonTypeCustom];
            _rightBtn.frame = CGRectMake(KMainW-70, 5, 50, 40);
            NSString * path = [[NSBundle mainBundle]pathForResource:@"bottom_comment_button@2x" ofType:@"png"];
            [_rightBtn setBackgroundImage:[UIImage imageWithContentsOfFile:path] forState:UIControlStateNormal];
            [self addSubview:_rightBtn];
        }
       
        if (!_label) {
            _label = [[UILabel alloc]init];
            _label.backgroundColor = [UIColor redColor];
            [self addSubview:_label];

        }
       
        if (selected == NO) {
            
            _label.frame = CGRectMake(KMainW/2-110, 50, 70, 5);
            [_middleBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [_middleBtn setTitle:@"搭配" forState: UIControlStateNormal];
            [_projectBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_projectBtn setTitle:@"专题" forState:UIControlStateNormal];
        }else{
            _label.frame = CGRectMake(KMainW/2+40, 50, 70, 5);
            
            [_projectBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
            [_projectBtn setTitle:@"专题" forState: UIControlStateNormal];
            [_middleBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [_middleBtn setTitle:@"搭配" forState: UIControlStateNormal];
        }

        
    }
    
    
    
    
    
    
    return self;
}

- (void)view{
    

}

@end
