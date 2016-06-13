//
//  CollocationViewController.m
//  ManShopping
//
//  Created by student on 16/6/7.
//  Copyright © 2016年 student. All rights reserved.
//

#import "CollocationViewController.h"
#import "CustomView.h"
#import "ProjuctVC.h"
#import "CollocationView.h"
#import "ChannelView.h"
#import "HttpManager.h"
#import "VeryNewModel.h"



@interface CollocationViewController ()<UIScrollViewDelegate>{
    
    CustomView * view;
    ProjuctVC *projuct;
    CollocationView * collocationView;
    UIScrollView * waterScrollerView;
    NSMutableArray * dataArr;
    NSMutableArray * newArr;
    
    NSMutableArray * myClassArr;
    NSMutableArray * addArr;
    NSMutableArray * bottomArr;
    UIView * OldView;
    UIView * NewView;
    ChannelView * Aview;
    UIView *bgView;
    
   float scroHeight[2];
    CGFloat _width;
   
    
}
@property (nonatomic,assign) BOOL selected;

@end

@implementation CollocationViewController


- (void)viewWillAppear:(BOOL)animated{
    //self.navigationController.navigationBarHidden = YES;
    view = [[CustomView alloc]initWithFrame:CGRectMake(0, 0, KMainW, 65) withBool:_selected];
    view.backgroundColor = [UIColor grayColor];
    [view.middleBtn addTarget:self action:@selector(middleBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [view.projectBtn addTarget:self action:@selector(projectBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    //NSLog(@"%d",_selected);
    [self.view addSubview:view];
}

#pragma mark ---导航点击事件------

- (void)middleBtnClicked:(UIButton *)btn{
    _selected = NO;
    [self viewWillAppear:YES];
    [UIView animateWithDuration:0.5 animations:^{
        projuct.view.frame = CGRectMake(0+KMainW, 65, KMainW, KMainH-65);
    }];
    
}

- (void)projectBtnClicked:(UIButton *)btn{
    
    _selected = YES;
    [self viewWillAppear:YES];
    [UIView animateWithDuration:0.5 animations:^{
        projuct.view.frame = CGRectMake(0, 65, KMainW, KMainH-65);
    }];
    
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    bgView = [[UIView alloc]initWithFrame:CGRectMake(0, 0, KMainW, KMainH-65)];
    [self.view addSubview:bgView];
    
    scroHeight[0] = 0.01f;
    scroHeight[1] = 0.01f;
    _width = (KMainW-10)/2;
    
    [self createProjuct];
    [self createCollocationView];
    [self createData];
    [self createCollocationView];
    [HttpManager getNewInfoWithURL:@"http://api-v2.mall.hichao.com/star/list?category=%E5%85%A8%E9%83%A8&lts=&pin=&flag=256161&gc=appstore&gf=iphone&gn=mxyc_ip&gv=6.6.3&gi=1527ABD9-C570-457C-A539-CE07C1BE492A&gs=640x1136&gos=8.4&access_token=" with:^(NSMutableArray *arr) {
        newArr = [NSMutableArray arrayWithArray:arr];
        //NSLog(@"++*********+++%@",newArr);
        VeryNewModel * model = newArr[1];
        //NSLog(@"////////////////%@",model);
        dispatch_async(dispatch_get_main_queue(), ^{
           
            
        });
    }];
    
    [self createScrollerView];
    }

- (void)createScrollerView {
    
    waterScrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 135, KMainW, KMainH-150)];
    waterScrollerView.backgroundColor = [UIColor redColor];
    waterScrollerView.delegate = self;
    waterScrollerView.pagingEnabled = YES;
   
   // [bgView addSubview:waterScrollerView];
  }

- (void)reloadView {

    if (newArr.count==0) {
        return;
    }
    for (int i = 0; i<newArr.count; i++) {
        
    }

}


- (void)createData{

    NSString * path = [[NSBundle mainBundle]pathForResource:@"Property List" ofType:@"plist"];
   dataArr = [NSMutableArray arrayWithContentsOfFile:path];
    myClassArr = [NSMutableArray arrayWithCapacity:0];
    
    NSString * classPath = [[NSBundle mainBundle]pathForResource:@"AProperty List" ofType:@"plist"];
    addArr = [NSMutableArray arrayWithContentsOfFile:classPath];
    bottomArr = [NSMutableArray arrayWithObjects:myClassArr,addArr, nil];
    
   }

- (void)createCollocationView{
   collocationView = [[CollocationView alloc]initWithFrame:CGRectMake(0,65, KMainW, 60)];
    collocationView.backgroundColor = [UIColor whiteColor];
    collocationView.selectedBtn.selected = NO;
    [collocationView.selectedBtn addTarget:self action:@selector(selectedBtnClicked:) forControlEvents:UIControlEventTouchUpInside];
    [bgView addSubview:collocationView];
    
    [self createScrollerOrLabel];
    }

- (void)createScrollerOrLabel {
    if (collocationView.selectedBtn.selected == NO) {
            [NewView removeFromSuperview];
            OldView = [[UIView alloc]initWithFrame:CGRectMake(0, 65, KMainW-60, collocationView.frame.size.height)];
        OldView.backgroundColor = [UIColor whiteColor];
            [bgView addSubview:OldView];
            
            collocationView.scrollerView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, KMainW-60, collocationView.frame.size.height)];
            collocationView.scrollerView.contentSize = CGSizeMake((KMainW-60)/6*(myClassArr.count+1), collocationView.frame.size.height);
            UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(0, 0, (KMainW-60)/6, collocationView.frame.size.height);
            [btn setTitle:@"最新" forState:UIControlStateNormal];
            [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
            [collocationView.scrollerView addSubview:btn];
        
        if (myClassArr.count>0) {
            for (int i = 1; i<=myClassArr.count; i++) {
                UIButton * btn = [UIButton buttonWithType:UIButtonTypeCustom];
                btn.frame = CGRectMake((KMainW-60)/6*i, 0, (KMainW-60)/6, collocationView.frame.size.height);
                [btn setTitle:[NSString stringWithFormat:@"%@",myClassArr[i-1]] forState:UIControlStateNormal];
                 [btn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
                [collocationView.scrollerView addSubview:btn];
            }

        }
            [OldView addSubview:collocationView.scrollerView];
        
        }else{
                    [OldView removeFromSuperview];
            NewView = [[UIView alloc]initWithFrame:CGRectMake(0, 65, KMainW-60, collocationView.frame.size.height)];
            NewView.backgroundColor = [UIColor whiteColor];
            [bgView addSubview:NewView];
            collocationView.label = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, KMainW-60, collocationView.frame.size.height)];
            collocationView.label.text = @"频道定制";
            collocationView.label.textAlignment = NSTextAlignmentCenter;
            [NewView addSubview:collocationView.label];
        }
}

- (void)selectedBtnClicked:(UIButton *)btn{
   
    if (btn.selected == NO) {
        Aview = [[ChannelView alloc]initWithFrame:CGRectMake(0, 125, KMainW, KMainH-125) arr:bottomArr];
        
        [bgView addSubview:Aview];
        
       btn.transform= CGAffineTransformMakeRotation(M_PI);
    }else{
        [Aview removeFromSuperview];
        
        btn.transform= CGAffineTransformMakeRotation(2*M_PI);
        
    }
    btn.selected =! btn.selected;
    [self createScrollerOrLabel];
    
}

- (void)createProjuct {
  
    projuct= [[ProjuctVC alloc]init];
    projuct.view.frame = CGRectMake(0+KMainW, 65, KMainW, KMainH-65);
    projuct.view.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:projuct.view];
    [self addChildViewController:projuct];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
