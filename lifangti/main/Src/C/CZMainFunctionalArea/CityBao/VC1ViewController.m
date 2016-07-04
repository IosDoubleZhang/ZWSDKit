//
//  VC1ViewController.m
//  CityBao3-0
//
//  Created by xthink4 on 16/6/3.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "VC1ViewController.h"
#import "ZSUIScrollView.h"
#import "CZTieZi.h"
#import "CZCardTableViewCell.h"
#import "ZSScrollView.h"
#import "CZTuiJIanTableViewCell.h"
#import "CZGuanZhu.h"
@interface VC1ViewController ()
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *CZHongSeFlag;
@property (weak, nonatomic) IBOutlet ZSUIScrollView *CzMainView;
@property (weak, nonatomic) IBOutlet UIView *CZTieZi;
@property (weak, nonatomic) IBOutlet UIView *GuanZhu;

@end

@implementation VC1ViewController
{
    __weak IBOutlet UIButton *TieZIBnt;
    CZTieZi     *_tzView;
    CZGuanZhu   *_guanzhu;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
    [self setMainView];
    [self setTieZI];
    [self setGuanzhu];
}
-(void)setGuanzhu
{
    _guanzhu=(CZGuanZhu*)[UtilityForUI CreatView:@"CZGuanZhu"];
    _guanzhu.frame=CGRectMake(0, 0, _GuanZhu.frame.size.width, _GuanZhu.frame.size.height);
    _guanzhu.Index=^(NSString *parse)
    {
        NSLog(@"点击的是%@",parse);
    };
    [_GuanZhu addSubview:_guanzhu];
}
-(void)setTieZI{
    _tzView=(CZTieZi*)[UtilityForUI CreatView:@"CZTieZi"];
    _tzView.frame=CGRectMake(0, 0, _CZTieZi.frame.size.width, _CZTieZi.frame.size.height);
    [_CZTieZi addSubview:_tzView];
}
-(void)setMainView
{
    [_CzMainView SetAttributeTanhuang:YES FenYe:YES YunXUHuaDOng:YES HengHangJinDUTiao:NO ShuHangJinDuTiao:NO delegate:nil];
    _CzMainView.S_W=_S_Width;
    _CzMainView.PageFlage=^(NSString *parse)
    {
        [self huadongChoseView:[parse doubleValue]];
    };
}

-(void)viewWillAppear:(BOOL)animated
{
    [self HidenNarBar];
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)choseSelectedView:(UIButton *)sender {
    if (sender.tag-1000==0) {
        [self choseView:sender.tag-1000];
    }
    else if (sender.tag-1000==1)
    {
        [self choseView:sender.tag-1000];
    }
    else{
        [self choseView:sender.tag-1000];
    }
}
-(void)huadongChoseView:(double)tag
{
    _CZHongSeFlag.constant=8*(tag+1)+(TieZIBnt.frame.size.width)*tag;
    [self loadViewIfNeeded];
}
-(void)choseView:(double)tag
{
    [UIView animateWithDuration:0.5 animations:^{
        [_CzMainView setContentOffset:CGPointMake(_S_Width*tag, 0)];
    }];
    _CZHongSeFlag.constant=8*(tag+1)+90*tag;
    [self loadViewIfNeeded];
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
