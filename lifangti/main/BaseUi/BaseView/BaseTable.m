



//
//  BaseTable.m
//  lifangti
//
//  Created by xthink4 on 16/7/7.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "BaseTable.h"

@implementation BaseTable
{
    double _moveLeng;
    int _yesToLoad;
}
-(id)init{
    if ([super init]) {
        _yesToLoad=0;
        _moveLeng=0;
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
*/
- (void)drawRect:(CGRect)rect {

    self.delegate=self;
}

- (void)scrollViewWillBeginDecelerating:(UIScrollView *)scrollView
{
    _yesToLoad+=1;
}
- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    
    NSLog(@"%lf",scrollView.contentOffset.x-_moveLeng);
    
    
    if (_yesToLoad==1) {
        
    }
    else{
        NSLog(@"快速滑动");
    }
    
    _yesToLoad=0;
}
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    _moveLeng = scrollView.contentOffset.x;
}
@end
