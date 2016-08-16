





//
//  VC4ViewController.m
//  CityBao3-0
//
//  Created by xthink4 on 16/6/3.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "VC4ViewController.h"
#import "HttpLinkClass.h"
#import "EaseBtn.h"
#import "ZSMapView.h"
#import "ZSMapTableView.h"
@interface VC4ViewController ()
@property (weak, nonatomic) IBOutlet ZSMapTableView *maptable;
@property (weak, nonatomic) IBOutlet ZSMapView *map;
@property (weak, nonatomic) IBOutlet EaseBtn *ESB;

@end

@implementation VC4ViewController

- (IBAction)dd:(id)sender {
    NSLog(@"11111");
}
- (IBAction)check:(EaseBtn *)sender {
    
    
    [sender Start];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets=NO;
    [HttpLinkClass PostLogin:^(Log *parse) {
  
        [Utility sharedUtility].token=parse.token;
        [HttpLinkClass GetUser:^(NSDictionary *parse) {
            NSLog(@"now Log User is %@",parse);
        } andError:^(NSString *parse) {
            
        }];
    } andError:^(NSString *parse) {
        
    } With:@{@"account":@"chenwei",
             @"password":@"123456"}];
    [_map  addObserver:self forKeyPath:@"myLocation" options:NSKeyValueObservingOptionOld|NSKeyValueObservingOptionNew context:nil];
    
}
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context
{
    NSLog(@"keyPath = %@, class = %@",keyPath,[object class]);
    
    NSLog(@"dic = %@",change);
    [self.maptable POIWithLocation:[change objectForKey:@"new"]];
}
- (void)dealloc
{
    //取消观察
    [_map.myLocation removeObserver:self forKeyPath:@"myLocation"];
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
