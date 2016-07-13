



//
//  cubeViewController.m
//  lifangti
//
//  Created by xthink4 on 16/7/11.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "cubeViewController.h"
#import "AcubeView.h"
@interface cubeViewController ()
@property (weak, nonatomic) IBOutlet AcubeView *CubeView;
@property (weak, nonatomic) IBOutlet UIButton *black;

@end

@implementation cubeViewController
-(void)viewWillAppear:(BOOL)animated
{
    [self HidenNarBar];
}
- (IBAction)pop:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
-(void)setBack
{
    CGRect f1=_black.frame;
    CGRect f2=CGRectMake(f1.origin.x, 0, f1.size.width, 0);
    _black.frame=f2;
    [UtilityPopManager initailzerAnimationWithToPostion:f1  formPostion:f2 atView:_black beginTime:0.4];
}
-(void)viewDidLayoutSubviews
{
    [super viewDidLayoutSubviews ];
    [self setBack];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    _CubeView.cube=_cube;
    [_CubeView.Img setImage: _img];
    self.automaticallyAdjustsScrollViewInsets = NO;
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
