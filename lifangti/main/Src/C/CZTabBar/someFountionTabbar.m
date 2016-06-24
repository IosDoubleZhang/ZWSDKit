//
//  someFountionTabbar.m
//  someFuntionGather
//
//  Created by sgchinese on 16/5/26.
//  Copyright © 2016年 sgchinese. All rights reserved.
//

#import "someFountionTabbar.h"
#import "ShowButtonView.h"
@interface someFountionTabbar ()
{
       UIButton *_currentBtm;
}
@end

@implementation someFountionTabbar


- (void)viewDidLoad {
    [super viewDidLoad];


    NSArray *vcArr=@[@"VC1ViewController",@"VC2ViewController",@"VC3ViewController",@"VC4ViewController",];

    NSArray *titleArr = @[@"1",@"2",@"3",@"4"];
    NSMutableArray *ncArr = [NSMutableArray array];
    for (int i = 0; i<4; i++) {
     
        //将字符串转化成类
        Class cl = NSClassFromString(vcArr[i]);
        //父类指针指向子类对象
        UIViewController *vc = [[cl alloc] init];
        
        //放到导航里
        UINavigationController *nc = [[UINavigationController alloc] initWithRootViewController:vc];
        vc.navigationItem.title = titleArr[i];
         [ncArr addObject:nc];
    }
       self.viewControllers = ncArr;

    [self createItem];
        
       
        
        
 


    // Do any additional setup after loading the view.
}
- (void)createItem
{
    NSArray *imgArr=@[@"home_normal",@"fishpond_normal",@"post_animate_add",@"message_normal",@"account_normal"];
    NSArray *imgSArr=@[@"home_highlight",@"fishpond_highlight",@"post_animate_add",@"message_highlight",@"account_highlight"];
    //分栏控制器的颜色 背景图片设置
    UIImageView *iv = [[UIImageView alloc]initWithFrame:CGRectMake(0, 0,_S_Width , 49)];
    iv.backgroundColor=[UIColor whiteColor];
    //    iv.image = [[UIImage imageNamed:@"2222"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    self.tabBar.barTintColor=[UIColor colorWithRed:1 green:1 blue:1 alpha:0];
    self.tabBar.superview.backgroundColor = [UIColor clearColor];
//    让imageView接收点击事件
    iv.userInteractionEnabled = YES;
    //删除现有的tabBar
    CGRect rect = self.tabBar.frame;
    [self.tabBar removeFromSuperview];  //移除TabBarController自带的下部的条
    
    //测试添加自己的视图
    UIView *myView = [[UIView alloc] init];
    myView.frame = rect;
    myView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:myView];
    
    
    //title数组
    //    NSArray *titleArr = [NSArray arrayWithObjects:@"登录",@"随机数",@"3个按钮",@"设置",@"2", nil];
    
    for (int i = 0; i<5; i++) {
       
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        if (i==0) {
            _currentBtm=btn;
        }
        if(i==2)
        {
#pragma mark _______ 中间按钮_______
            //计算按钮位置 如果有需要可以自定义
            btn.frame = CGRectMake(0, 0, 56, 56);
            btn.center=CGPointMake(i*_S_Width/5+(_S_Width/5)/2, 15);
        }
        else
        {

            //计算按钮位置 如果有需要可以自定义
            btn.frame = CGRectMake(0, 0, 30, 30);
            btn.center=CGPointMake(i*_S_Width/5+(_S_Width/5)/2, 49/2);
        }
        btn.tag = 1000+i;
        [btn setBackgroundImage:[UIImage imageNamed:[imgArr objectAtIndex:i]] forState:UIControlStateNormal];
        [btn setBackgroundImage:[UIImage imageNamed:[imgSArr objectAtIndex:i]] forState:UIControlStateSelected];
        
        [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
        [iv addSubview:btn];
        
        //        UILabel *la = [[UILabel alloc]initWithFrame:CGRectMake(-5, 33, 40, 12)];
        //        la.textColor = [UIColor grayColor];
        //        la.tag = 2000+i;
        //        la.textAlignment = NSTextAlignmentCenter;
        //        la.text = [titleArr objectAtIndex:i];
        //        la.font = [UIFont systemFontOfSize:10];
        //        [btn addSubview:la];
        
        if (!i) {
            btn.selected = YES;
            //            la.textColor = [UIColor orangeColor];
        }
    }
    [myView addSubview:iv];
}

- (void)btnClick:(UIButton *)sender
{
    
    for (int i = 0; i<5; i++) {
        UIButton *btn = (UIButton *)[self.tabBar viewWithTag:1000+i];
        btn.selected = NO;
        
        UILabel *la = (UILabel *)[self.tabBar viewWithTag:2000+i];
        la.textColor = [UIColor grayColor];
    }
    
    if (sender.tag - 1000<2) {
        if (_currentBtm==sender) {
            return;
        }
        _currentBtm.selected=NO;
        _currentBtm=sender;
        _currentBtm.selected=YES;
        sender.selected=YES;
//        sender.selected = YES;
        UILabel *la = (UILabel *)[self.tabBar viewWithTag:sender.tag+1000];
        la.textColor = [UIColor orangeColor];
        
        self.selectedIndex = sender.tag - 1000;
    }
    else if (sender.tag-1000==2)
    {
        
        [ShowButtonView showView];
        
    }
    else{
        if (_currentBtm==sender) {
            return;
        }
        _currentBtm.selected=NO;
        _currentBtm=sender;
        _currentBtm.selected=YES;
        sender.selected=YES;
//        sender.selected = YES;
        UILabel *la = (UILabel *)[self.tabBar viewWithTag:sender.tag+1000];
        la.textColor = [UIColor orangeColor];
        
        self.selectedIndex = sender.tag - 1000-1;
        
    }
   
   
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
