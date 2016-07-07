//
//  TestAddViewController.h
//  lifangti
//
//  Created by xthink4 on 16/7/7.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TestAddViewController : BaseViewController
@property (weak, nonatomic) IBOutlet UITextField *f1;
@property (weak, nonatomic) IBOutlet UITextField *f2;
@property (weak, nonatomic) IBOutlet UITextField *f3;
@property (weak, nonatomic) IBOutlet UIImageView *i1;
- (IBAction)ssave:(UIButton *)sender;

@end
