//
//  ZSUIScrollView.h
//  CityBao3-0
//
//  Created by xthink4 on 16/6/30.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ZSUIScrollView : UIScrollView<UIScrollViewDelegate>
//设置每页宽
@property(nonatomic,assign)CGFloat S_W;
///设置页码
-(void)SetPageCpntrol:(NSInteger )Number;
///基本属性设置
-(void)SetAttributeTanhuang:(BOOL)bounces FenYe:(BOOL)pagingEnabled YunXUHuaDOng:(BOOL)scrollEnabled HengHangJinDUTiao:(BOOL)showsHorizontalScrollIndicator ShuHangJinDuTiao:(BOOL)showsVerticalScrollIndicator  delegate:(id)delegate;
///滑动系数
//@property(nonatomic ,assign)FloatBlock PageFlage;

@end
