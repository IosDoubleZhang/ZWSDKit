//
//  ZSUIScrollView.m
//  CityBao3-0
//
//  Created by xthink4 on 16/6/30.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "ZSUIScrollView.h"

@implementation ZSUIScrollView
{
    double pageflag ;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)SetAttributeTanhuang:(BOOL)bounces FenYe:(BOOL)pagingEnabled YunXUHuaDOng:(BOOL)scrollEnabled HengHangJinDUTiao:(BOOL)showsHorizontalScrollIndicator ShuHangJinDuTiao:(BOOL)showsVerticalScrollIndicator  delegate:(id)delegate{
    self.delegate=delegate;
    self.bounces=bounces;
    self.pagingEnabled=pagingEnabled;
    self.showsVerticalScrollIndicator=showsVerticalScrollIndicator;
    self.showsHorizontalScrollIndicator=showsHorizontalScrollIndicator;
    self.scrollEnabled=scrollEnabled;
    
}
-(void)SetPageCpntrol:(NSInteger )Number
{
    //页码控制器
    UIPageControl *pc = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 0, 120, 10)];
    pc.center=CGPointMake((self.frame.size.width-120)/2, self.frame.size.height-30);
    pc.tag = 100;
    
    //总页数
    pc.numberOfPages = Number;
    
    [self addSubview:pc];
    
    //设置小点点的颜色
    pc.pageIndicatorTintColor = [UIColor redColor];
    pc.currentPageIndicatorTintColor = [UIColor greenColor];
    
    //不接收用户触摸事件
    pc.userInteractionEnabled = YES;
}
////滑动过程中
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView
//{
//    //    NSLog(@"1=%@",NSStringFromCGPoint(scrollView.contentOffset));
//        pageflag = scrollView.contentOffset.x/_S_W;
//   
//    NSLog(@"%lf",pageflag);
//}
//
////开始拖动
//- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
//{
////    NSLog(@"2=%@",NSStringFromCGPoint(scrollView.contentOffset));x
//}
////停止拖动
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate
//{
////    NSLog(@"3=%@%d",NSStringFromCGPoint(scrollView.contentOffset),decelerate);
//}
////开始滑动
//- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
//{
////    NSLog(@"4=%@",NSStringFromCGPoint(scrollView.contentOffset));
//}
////停止滑动
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
//{
//    int page = scrollView.contentOffset.x/_S_W;
//    
//    UIPageControl *pc = (UIPageControl *)[self viewWithTag:100];
//    //设置页码控制的当前页（从0开始的）
//    pc.currentPage = page;
// 
//    
//}
//- ( void )scrollViewDidScrollToTop:( UIScrollView *)scrollView
//{
//    NSLog(@"222222222222222222");
//}
@end
