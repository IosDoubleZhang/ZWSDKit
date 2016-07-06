



//
//  LogAndRegViewController.m
//  lifangti
//
//  Created by xthink4 on 16/6/29.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "LogAndRegViewController.h"
#import "AppDelegate.h"

@interface LogAndRegViewController ()

@end

@implementation LogAndRegViewController
{
    __weak IBOutlet UITextField *username;
    
    __weak IBOutlet UITextField *Password;
}
- (IBAction)regAngLog:(UIButton *)sender {
   AVUser  *user = [AVUser user];
    user.username =username.text;// 设置用户名
    user.password =Password.text;//
    [user setObject:@"sssss" forKey:@"nickname"];
    [user setObject:@"14" forKey:@"age"];
    
    [user signUpInBackgroundWithBlock:^(BOOL succeeded, NSError *error) {
        if (succeeded) {
            [AVUser logInWithUsernameInBackground:username.text password:Password.text block:^(AVUser *user, NSError *error) {
                if (user != nil) {
                  AppDelegate *app =(AppDelegate *)[UIApplication sharedApplication].delegate;
                    [app SetRootBar];
                    
                
                } else {
                    
                }
            }];
            // 注册成功
        } else {
            // 失败的原因可能有多种，常见的是用户名已经存在。
        }
    }];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
