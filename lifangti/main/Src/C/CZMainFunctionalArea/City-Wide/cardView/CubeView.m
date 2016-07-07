
//
//  CubeView.m
//  lifangti
//
//  Created by xthink4 on 16/7/6.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "CubeView.h"
#import "CubeTableViewCell.h"
@implementation CubeView
{
    NSInteger com;
    NSArray *_arr;
    double _moveLeng;
    int _yesToLoad;
    NSMutableArray *needLoadArr;
    BOOL scrollToToping;
    NSMutableArray *_dataarr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (v{
 oid)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)drawRect:(CGRect)rect {
    needLoadArr = [[NSMutableArray alloc] init];
    [UtilityForUI Zhuce:self.CubeTable Regiest:@"CubeTableViewCell" WithId:@"cubeCell"];
    _CubeTable.separatorStyle = UITableViewCellSeparatorStyleNone;
    _CubeTable.dataSource=self;
    _CubeTable.delegate=self;
  
    _CubeTable.estimatedRowHeight = 44.0f;
    _CubeTable.rowHeight=UITableViewAutomaticDimension;
    com=200;
    [_CubeTable reloadData];
    
 [LeanNetBase GetCubeSuccess:^(NSArray *parse) {
    _dataarr=[NSMutableArray arrayWithArray:parse];
    [_CubeTable reloadData];

} AndError:^(NSString *parse) {
    
}];

    
    // Drawing code
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return _dataarr.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    CubeTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cubeCell" forIndexPath:indexPath];
    
    [self drawCell:cell withIndexPath:indexPath];
    return cell;
}
- (IBAction)text:(id)sender {
    com+=10;
    [_CubeTable reloadData];
}
- (void)drawCell:(CubeTableViewCell *)cell withIndexPath:(NSIndexPath *)indexPath{

    [cell clear];
    cell.cube = [_dataarr objectAtIndex:indexPath.row];
    
    if (needLoadArr.count>0&&[needLoadArr indexOfObject:indexPath]==NSNotFound) {
        [cell clear];
        return;
    }
    if (scrollToToping) {
        return;
    }
    [cell LoadData];
}
- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [needLoadArr removeAllObjects];
}

//按需加载 - 如果目标行与当前行相差超过指定行数，只在目标滚动范围的前后指定3行加载。
- (void)scrollViewWillEndDragging:(UIScrollView *)scrollView withVelocity:(CGPoint)velocity targetContentOffset:(inout CGPoint *)targetContentOffset{
    NSIndexPath *ip = [self.CubeTable indexPathForRowAtPoint:CGPointMake(0, targetContentOffset->y)];
    NSIndexPath *cip = [[self.CubeTable indexPathsForVisibleRows] firstObject];
    NSInteger skipCount = 4;
    if (labs(cip.row-ip.row)>skipCount) {
        NSArray *temp = [self.CubeTable indexPathsForRowsInRect:CGRectMake(0, targetContentOffset->y, self.width, self.height)];
        NSMutableArray *arr = [NSMutableArray arrayWithArray:temp];
        if (velocity.y<0) {
            NSIndexPath *indexPath = [temp lastObject];
            if (indexPath.row+3<_dataarr.count) {
                [arr addObject:[NSIndexPath indexPathForRow:indexPath.row+1 inSection:0]];
                [arr addObject:[NSIndexPath indexPathForRow:indexPath.row+2 inSection:0]];
                [arr addObject:[NSIndexPath indexPathForRow:indexPath.row+3 inSection:0]];
            }
        } else {
            NSIndexPath *indexPath = [temp firstObject];
            if (indexPath.row>3) {
                [arr addObject:[NSIndexPath indexPathForRow:indexPath.row-3 inSection:0]];
                [arr addObject:[NSIndexPath indexPathForRow:indexPath.row-2 inSection:0]];
                [arr addObject:[NSIndexPath indexPathForRow:indexPath.row-1 inSection:0]];
            }
        }
        [needLoadArr addObjectsFromArray:arr];
    }
}

- (BOOL)scrollViewShouldScrollToTop:(UIScrollView *)scrollView{
    scrollToToping = YES;
    return YES;
}

- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView{
    scrollToToping = NO;
    [self loadContent];
}

- (void)scrollViewDidScrollToTop:(UIScrollView *)scrollView{
    scrollToToping = NO;
    [self loadContent];
}

//用户触摸时第一时间加载内容
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{
    if (!scrollToToping) {
        [needLoadArr removeAllObjects];
        [self loadContent];
    }
    return [super hitTest:point withEvent:event];
}

- (void)loadContent{
    if (scrollToToping) {
        return;
    }
    if (self.CubeTable.indexPathsForVisibleRows.count<=0) {
        return;
    }
    if (self.CubeTable.visibleCells&&self.CubeTable.visibleCells.count>0) {
        for (id temp in [self.CubeTable.visibleCells copy]) {
            CubeTableViewCell *cell = (CubeTableViewCell *)temp;
            NSLog(@"%@",cell.Atitle);
            [cell LoadData];
        }
    }
}
//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
//{
//    _yesToLoad+=1;
//}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    NSLog(@"--------------------%lf",scrollView.contentOffset.y-_moveLeng);
//    if (_yesToLoad>1) {
//        NSLog(@"快速滑动");
//    }
//    else{
//      
//    }
//    _yesToLoad=0;
//}
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    _moveLeng = scrollView.contentOffset.y;
//}
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
//  CGFloat viewHeight = scrollView.height + scrollView.contentInset.top;
//    for (CubeTableViewCell *cell in [self.CubeTable visibleCells]) {
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
//        
//    }
//}
@end
