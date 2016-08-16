



//
//  BaseXibVIew.m
//  lifangti
//
//  Created by xthink4 on 16/7/6.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "BaseXibVIew.h"

@implementation BaseXibVIew
-(id)initWithCoder:(NSCoder *)aDecoder{
    self=[super initWithCoder:aDecoder];
    if (self) {
        [self setSelfView];
    }
    return self;
}
-(void)setSelfView
{
    [[NSBundle mainBundle]loadNibNamed:self.className owner:self options:nil] ;
//    self.View.frame=self.frame;
    NSLog(@"%lf",self.frame.size.height);
    self.View.frame=CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    
    [self addSubview:self.View];
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
