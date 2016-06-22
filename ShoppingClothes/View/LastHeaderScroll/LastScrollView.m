//
//  LastScrollView.m
//  ShoppingClothes
//
//  Created by student on 16/6/14.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "LastScrollView.h"
@interface LastScrollView ()
{
    //NSInteger index;
}

@end
@implementation LastScrollView


- (instancetype)initWithFrame:(CGRect)frame WithArray:(NSArray *)array WithNSInteger:(NSInteger)select
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        self.selectdArr = array;
        self.select = select;
        [self createView];
    }
    return self;
}


- (void)createView{
    NSArray *arr = @[@"今日上新",@"上装",@"裙装",@"裤装"];
    for (NSInteger i=0; i<arr.count; i++) {
        NSString *str = _selectdArr[i];
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        btn.frame = CGRectMake(KMainW/4*i, 5, KMainW/4, 40);
        [btn setTitle:arr[i] forState:UIControlStateNormal];
        if ([str isEqualToString:@"isNOSelect"]) {
            [btn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        }else{
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        }
    [btn addTarget:self action:@selector(goToSelfView:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 1000+i;
        [self addSubview:btn];
    }
    
    _lineView = [[UIView alloc]init];
    _lineView.backgroundColor = [UIColor redColor];
    UIButton *btn = [self viewWithTag:_select];
    [self addSubview:_lineView];
    _lineView.frame = CGRectMake(btn.frame.origin.x, 50, KMainW/4, 6);

}
-(void)goToSelfView:(UIButton *)sender{
    self.lastHeader(sender.tag);    
}

- (void)createBlockTethod:(HeaderBlock)myBlock{
    self.lastHeader = myBlock;
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
