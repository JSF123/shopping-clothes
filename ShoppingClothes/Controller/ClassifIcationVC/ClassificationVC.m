//
//  ClassificationVC.m
//  ShoppingClothes
//
//  Created by student on 16/6/7.
//  Copyright © 2016年 jing. All rights reserved.
//

#import "ClassificationVC.h"
#import "HomeAgeVC.h"
#import "SearchVC.h"
@interface ClassificationVC ()

@end

@implementation ClassificationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
   
    [self createTopView];
}

- (void)createTopView{
    UIButton *backBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    backBtn.frame = CGRectMake(10, 22, 30, 30);
    [backBtn setBackgroundImage:[UIImage imageNamed:@"back_button@3x"] forState:UIControlStateNormal];
    [backBtn addTarget:self action:@selector(backFirstVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:backBtn];
    
    UIButton *middle = [UIButton buttonWithType:UIButtonTypeCustom];
    middle.frame = CGRectMake(KMainW/2-100, 22, 200, 30);
    [middle setTitle:@"🔍伊芙丽     " forState:UIControlStateNormal];
    [middle setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    middle.backgroundColor = [UIColor lightGrayColor];
    middle.alpha = 0.3;
    [middle addTarget:self action:@selector(goTOSearchVC:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:middle];
    
    UIView *fgView = [[UIView alloc]initWithFrame:CGRectMake(0, 63, KMainW, 1)];
    fgView.backgroundColor = [UIColor lightGrayColor];
    fgView.alpha = 0.1;
    [self.view addSubview:fgView];
}

#pragma mark-----导航栏点击事件------

- (void)backFirstVC:(UIButton *)sender{
    [self.navigationController popToRootViewControllerAnimated:YES];
}

- (void)goTOSearchVC:(UIButton *)sender{
    SearchVC *search = [SearchVC new];
    [self.navigationController pushViewController:search animated:YES];
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
