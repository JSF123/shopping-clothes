//
//  ChannelView.m
//  ManShopping
//
//  Created by student on 16/6/12.
//  Copyright © 2016年 student. All rights reserved.
//

#import "ChannelView.h"

@interface ChannelView (){

    UIView * classView;
    UIView * bottomView;
    UIButton * bottomBtn;
    UIButton * ChooseBtn;
   
}

@end
@implementation ChannelView



/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/



- (instancetype)initWithFrame:(CGRect)frame arr:(NSMutableArray*)arr{
    self = [super initWithFrame:frame];
    if (self) {
        self.dataArr = [NSMutableArray arrayWithArray:arr];
        NSLog(@"%ld",_dataArr.count);
        UIView * myClassView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KMainW, 50)];
        myClassView.backgroundColor = [UIColor grayColor];
        [self addSubview:myClassView];
        UILabel * label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 80, 50)];
        label.text = @"我的分类";
        [myClassView addSubview:label];
        ChooseBtn = [UIButton buttonWithType:UIButtonTypeCustom];
        ChooseBtn.frame = CGRectMake(KMainW-80, 0, 50, 50);
        ChooseBtn.selected = NO;
        [ChooseBtn setTitle:@"编辑" forState:UIControlStateNormal];
        [ChooseBtn setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        [ChooseBtn setTitle:@"完成" forState:UIControlStateSelected];
        [ChooseBtn setTitleColor:[UIColor redColor] forState:UIControlStateSelected];
        [ChooseBtn addTarget:self action:@selector(btnClicked:) forControlEvents:UIControlEventTouchUpInside];
        [myClassView addSubview:ChooseBtn];
        classView = [self createClassViewWithArr:arr];
        [self addSubview:classView];
        bottomView = [self createClassBottomViewWithArr:arr];
        [self addSubview:bottomView];

        [self setNeedsLayout];
    }
     return self;
}

- (UIView *)createClassViewWithArr:(NSMutableArray *)arr {
    
     UIView * view = [UIView new];
    
    return view;

}

- (UIView *)createClassBottomViewWithArr:(NSMutableArray *)arr {
    
     UIView * view = [UIView new];
    view.frame = CGRectMake(0, 0, 320, 400);
//    view.backgroundColor = [UIColor greenColor];
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, KMainW, 40);
    label.text = @"没有更多分类";
    label.backgroundColor = [UIColor grayColor];
    [view addSubview:label];
      return view;
    
}


- (void)btnClicked:(UIButton *)btn{

    if (btn.selected == NO) {
         bottomView.hidden = YES;
        for (int i = 0; i<[_dataArr[0] count]; i++) {
            UIButton * topBtn = [btn.superview.superview viewWithTag:100+i];
            CALayer * myLayer = [CALayer new];
            myLayer.hidden = NO;
            
            myLayer.position = CGPointMake(topBtn.frame.size.width, 0);
            myLayer.bounds = CGRectMake(0, 0, 20, 20);
           
            NSString * path = [[NSBundle mainBundle]pathForResource:@"icon_class_delete@3x" ofType:@"png"];
            myLayer.contents = (__bridge id _Nullable)([UIImage imageWithContentsOfFile:path].CGImage);
            [topBtn.layer addSublayer:myLayer];
        }
       
    }else{
        bottomView.hidden = NO;
        [self setNeedsLayout];
    }
    
     btn.selected =! btn.selected;

}

- (void)topBtnClicked:(UIButton *)btn{
   
     NSString * str = btn.titleLabel.text;
    if (ChooseBtn.selected == YES) {
        [_dataArr[0] removeObject:str];
        [_dataArr[1] addObject:str];

        [self setNeedsLayout];
        
    }else{
     
        [self setNeedsLayout];
    }
    
    
}

- (void)bottomBtnClicked:(UIButton *)btn{

    NSString * str = btn.titleLabel.text;
    [_dataArr[1] removeObject:str];
    [_dataArr[0] addObject:str];
    [self setNeedsLayout];
    
}

- (void)layoutSubviews{
    
    classView.frame = CGRectMake(0, 60, KMainW, 60*([_dataArr[0] count]/4+1));
    
    NSLog(@"%ld",[_dataArr[0] count]);
    
    for (UIButton * btn in classView.subviews) {
        [btn removeFromSuperview];
    }
    
    if ([_dataArr[0] count]>0) {
         NSLog(@"123");
        for (int i = 0; i<[_dataArr[0] count]; i++) {
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(10+((KMainW-50)/4+10)*(i%4), 10+(40+20)*(i/4), (KMainW-50)/4, 40);
            [btn setTitle:_dataArr[0][i] forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            btn.layer.borderColor = [UIColor blackColor].CGColor;
            btn.tag = 100+i;
           
            [btn addTarget:self action:@selector(topBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            btn.layer.borderWidth =2;
            [classView addSubview:btn];
            
            if (ChooseBtn.selected == YES) {
                CALayer * myLayer = [CALayer new];
                myLayer.hidden = NO;
                
                myLayer.position = CGPointMake(btn.frame.size.width, 0);
                myLayer.bounds = CGRectMake(0, 0, 20, 20);
                
                NSString * path = [[NSBundle mainBundle]pathForResource:@"icon_class_delete@3x" ofType:@"png"];
                myLayer.contents = (__bridge id _Nullable)([UIImage imageWithContentsOfFile:path].CGImage);
                [btn.layer addSublayer:myLayer];

            }
            
        }
        
    }
        bottomView.frame = CGRectMake(0, classView.frame.size.height+50, KMainW, 60*([self.dataArr[1] count]/4+1)+50);
    
    
    
    for (UIButton * btn in bottomView.subviews) {
        [btn removeFromSuperview];
    }
    
    UIView * view = [UIView new];
    view.frame = CGRectMake(0, 0, KMainW, 40);
   
    UILabel * label = [[UILabel alloc]init];
    label.frame = CGRectMake(0, 0, KMainW, 40);
    label.text = @"没有更多分类";
    label.backgroundColor = [UIColor grayColor];
    [bottomView addSubview:label];
    
    if ([self.dataArr[1] count]>0) {
        
        NSLog(@"%ld",[_dataArr[1] count]);
        
        
        for (int i = 0; i<[_dataArr[1] count]; i++) {
            
            UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
            
            [button setTitle:_dataArr[1][i] forState:UIControlStateNormal];
            [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            button.frame = CGRectMake(10+((KMainW-50)/4+10)*(i%4), 60+(40+20)*(i/4), (KMainW-50)/4, 40);
            button.layer.borderColor = [UIColor blackColor].CGColor;
          
            button.layer.borderWidth = 2;
            
            button.tag = 1000+i;
           
            [button addTarget:self action:@selector(bottomBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
            [bottomView addSubview:button];
        }

    }
    
    
    
}

@end
