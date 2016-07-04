//
//  CZTieZi.m
//  CityBao3-0
//
//  Created by xthink4 on 16/6/30.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "CZTieZi.h"
#import "CZCardTableViewCell.h"
#import "CZTuiJIanTableViewCell.h"
@implementation CZTieZi

{
    NSArray     *_data;

}
- (void)drawRect:(CGRect)rect {

    [UtilityForUI Zhuce:_CZTieZITable Regiest:@"CZCardTableViewCell" WithId:@"CZCardCell"];
    _CZTieZITable.dataSource=self;
    _CZTieZITable.delegate=self;
    [UtilityForUI Zhuce:_CZTieZITable Regiest:@"CZTuiJIanTableViewCell" WithId:@"TuiJianCell"];
    _data=@[@"account_highlight",@"account_highlight",@"account_highlight",@"account_highlight",@"account_highlight",@"account_highlight",@"account_highlight"];
    [_CZTieZITable reloadData];
    
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


@end
