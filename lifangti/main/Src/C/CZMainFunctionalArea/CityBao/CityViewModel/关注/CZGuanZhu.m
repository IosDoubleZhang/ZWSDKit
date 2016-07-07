




//
//  CZGuanZhu.m
//  CityBao3-0
//
//  Created by xthink4 on 16/6/30.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "CZGuanZhu.h"
#import "CZGuanZhuTableViewCell.h"

@implementation CZGuanZhu

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    [UtilityForUI Zhuce:_GuanZhuTable Regiest:@"CZGuanZhuTableViewCell" WithId:@"GuanZhuCell"];
    _GuanZhuTable.delegate=self;
    _GuanZhuTable.dataSource=self;
    
    _GuanZhuTable.estimatedRowHeight = 44.0f;
    _GuanZhuTable.rowHeight = UITableViewAutomaticDimension;
    
    
    // Drawing code
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
    
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZGuanZhuTableViewCell *cell=[tableView
                                  dequeueReusableCellWithIdentifier:@"GuanZhuCell" forIndexPath:indexPath];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_Index) {
        _Index([NSString stringWithFormat:@"%ld",(long)indexPath.row]);
    }
}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//    CGFloat viewHeight = scrollView.height + scrollView.contentInset.top;
//    for (CZGuanZhuTableViewCell *cell in [self.GuanZhuTable visibleCells]) {
//        CGFloat y = cell.centerY - scrollView.contentOffset.y;
//        CGFloat p = y - viewHeight / 2;
//        CGFloat scale = cos(p / viewHeight * 0.8) * 0.95;
//        if (kiOS8Later) {
//            [UIView animateWithDuration:0.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut | UIViewAnimationOptionAllowUserInteraction | UIViewAnimationOptionBeginFromCurrentState animations:^{
//                cell.transform = CGAffineTransformMakeScale(scale, scale);
//            } completion:NULL];
//        } else {
//            cell.transform = CGAffineTransformMakeScale(scale, scale);
//        }
//    }
//}
//-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    return 175;
//}
@end
