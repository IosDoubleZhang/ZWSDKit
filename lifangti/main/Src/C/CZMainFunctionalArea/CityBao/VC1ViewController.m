//
//  VC1ViewController.m
//  CityBao3-0
//
//  Created by xthink4 on 16/6/3.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "VC1ViewController.h"

@interface VC1ViewController ()

@end

@implementation VC1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

//    dispatch_async(dispatch_get_global_queue(0, 0), ^{ //something
//            [LeanNetWork testV];
//    });
    dispatch_async(dispatch_get_main_queue(), ^{
        [LeanNetWork getObjc];
    });
    
    self.view.backgroundColor=[UIColor greenColor];
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
