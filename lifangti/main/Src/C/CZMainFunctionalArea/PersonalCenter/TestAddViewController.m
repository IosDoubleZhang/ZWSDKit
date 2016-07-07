





//
//  TestAddViewController.m
//  lifangti
//
//  Created by xthink4 on 16/7/7.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "TestAddViewController.h"

@interface TestAddViewController ()

@end

@implementation TestAddViewController

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
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    [self.view endEditing:YES];
}
- (IBAction)ssave:(UIButton *)sender {
    TheCube *acube=[TheCube object];
    acube.title=_f1.text;
    acube.content=_f2.text;
    acube.user=[AVUser currentUser];
    acube.image=[AVFile fileWithName:@"img.jpg" data:  UIImageJPEGRepresentation(_i1.image, 1)];
    
    [LeanNetWork ObjcSaveInBackground:^{
        NSLog(@"success");
        
        [self.navigationController popViewControllerAnimated:YES];
    } faliue:^(NSString *errorMessage) {
        
    } WithObjc:acube];
    
    
    
    
    
}
@end
