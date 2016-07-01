//
//  ZSScrollView.h
//  PagedScrollView
//
//  Created by qf on 15/4/20.
//  Copyright (c) 2015年 Apple Inc. All rights reserved.
//

#import <UIKit/UIKit.h>

@class ZSScrollView;

@protocol ZSScrollViewDataSource<NSObject>

@required
//获取page个数
- (NSInteger)numberOfSectionsInZSScrollView:(ZSScrollView *)zsScrollView;

//获取第index个page的contentView
- (UIView *)zsScrollView:(ZSScrollView *)zsScrollView contentViewForSection:(NSInteger)index;
@end

@protocol ZSScrollViewDelegate <NSObject>

//点击第index个page时的动作
- (void)zsScrollView:(ZSScrollView *)zsScrollView didSelectSectionAtIndex:(NSInteger)index;

@end

@interface ZSScrollView : UIView

@property (nonatomic, readonly) UIScrollView *scrollView;
@property (nonatomic, strong) id <ZSScrollViewDataSource> dataSource;
@property (nonatomic, strong) id <ZSScrollViewDelegate> delegate;
-(void)SetView;
/**
 *
 *
 *	@param duration 自动滚动间隔时间
 */
- (id)initWithFrame:(CGRect)frame animationDuration:(NSTimeInterval)duration;
@end
