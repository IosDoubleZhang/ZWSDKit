

//
//  VC2ViewController.m
//  CityBao3-0
//
//  Created by xthink4 on 16/6/3.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "VC2ViewController.h"
#import "cubeViewController.h"
#import "TestAddViewController.h"
#import "NSString+FontAwesome.h"
#import "UIImage+FontAwesome.h"
@interface VC2ViewController ()
@property (weak, nonatomic) IBOutlet CubeView *cubeView;

@end

@implementation VC2ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _ss.image=[UIImage imageWithIcon:@"fa-ge" backgroundColor:[UIColor clearColor] iconColor:RGB(34, 42, 24) andSize:CGSizeMake(49,49)];
    __weak typeof(self) wesf=self;
    _cubeView.cubeBlock=^(cubeViewController *parse){
        parse.hidesBottomBarWhenPushed=YES;
        [wesf.navigationController pushViewController:parse animated:YES];
         parse.hidesBottomBarWhenPushed=NO;
    };    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)text:(id)sender {

    TestAddViewController*ac=[TestAddViewController new];
    [ac setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:ac animated:YES];
//    [ac setHidesBottomBarWhenPushed:NO];
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
