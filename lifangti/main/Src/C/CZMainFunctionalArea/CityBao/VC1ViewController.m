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
@interface VC1ViewController ()
<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet NSLayoutConstraint *CZHongSeFlag;
@property (weak, nonatomic) IBOutlet ZSUIScrollView *CzMainView;
@property (weak, nonatomic) IBOutlet UIView *CZTieZi;

@end

@implementation VC1ViewController

{
    __weak IBOutlet UIButton *TieZIBnt;
    NSArray *_data;
    CZTieZi *_tzView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor=[UIColor greenColor];
    [self SetMainView];
    _tzView=(CZTieZi*)[UtilityForUI CreatView:@"CZTieZi"];
    _tzView.frame=CGRectMake(0, 0, _CZTieZi.frame.size.width, _CZTieZi.frame.size.height);
//    [_tzView.CZTieZITable registerNib:[UINib nibWithNibName:@"CZCardTableViewCell" bundle:nil] forCellReuseIdentifier:@"CZCardCell"];
    [UtilityForUI Zhuce:_tzView.CZTieZITable Regiest:@"CZCardTableViewCell" WithId:@"CZCardCell"];
    [UtilityForUI Zhuce:_tzView.CZTieZITable Regiest:@"CZTuiJIanTableViewCell" WithId:@"TuiJianCell"];
    _tzView.CZTieZITable.delegate=self;
    _tzView.CZTieZITable.dataSource=self;
    _data=@[];
    [_CZTieZi addSubview:_tzView];

}
-(void)SetMainView
{
   
    [_CzMainView SetAttributeTanhuang:YES FenYe:YES YunXUHuaDOng:YES HengHangJinDUTiao:NO ShuHangJinDuTiao:NO delegate:self];

    _CzMainView.S_W=_S_Width;
}

+(void)pageFlag:(double )flag{
    

}
-(void)viewDidLayoutSubviews
{
    _data=@[@"account_highlight",@"account_highlight",@"account_highlight",@"account_highlight",@"account_highlight",@"account_highlight",@"account_highlight"];
    [_tzView.CZTieZITable reloadData];
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
        [self ChoseView:sender.tag-1000];
    }
    else if (sender.tag-1000==1)
    {
        [self ChoseView:sender.tag-1000];
        
    }
    else{
        [self ChoseView:sender.tag-1000];
        
    }
}
-(void)HuadongChoseView:(double)tag
{
    _CZHongSeFlag.constant=8*(tag+1)+(TieZIBnt.frame.size.width)*tag;
    [self loadViewIfNeeded];
}
-(void)ChoseView:(double)tag
{
  [UIView animateWithDuration:0.5 animations:^{
      [_CzMainView setContentOffset:CGPointMake(_S_Width*tag, 0)];
  }];
    _CZHongSeFlag.constant=8*(tag+1)+90*tag;
    [self loadViewIfNeeded];
}
#pragma mark 滑动代理
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    [self HuadongChoseView:scrollView.contentOffset.x/_S_Width];
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 3;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    else if (section==1)
    {
        return 10;
    }
    else{
        return 1;
    }
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"%lf,%lf",_S_Width,_S_Height);
    if (indexPath.section==0) {
        return AUTO_H(281);
    }
    else if (indexPath.section==1)
    {
       return AUTO_H(307);
    }
    else{
      return AUTO_H(281);
    }
    
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section==0) {
        CZCardTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"CZCardCell" forIndexPath:indexPath];
        cell.CZCardView.delegate=cell.self;
        cell.CZCardView.dataSource=cell.self;
        cell.data=_data;
        return cell;
    }
    else if (indexPath.section==1)
    {
        CZTuiJIanTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"TuiJianCell" forIndexPath:indexPath];
        
        return cell;
    }
    else{
        static NSString *qqq = @"qq";
        
        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:qqq];
        
        if (!cell) {
            cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:qqq];
            
            //cell被点击时，是否变灰
            cell.selectionStyle = UITableViewCellSelectionStyleGray;
            
            cell.accessoryType = UITableViewCellAccessoryDetailButton;
        }
        
          return cell;

    }
  
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
