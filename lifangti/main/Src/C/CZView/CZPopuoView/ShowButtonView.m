

//
//  ShowButtonView.m
//  someFuntionGather
//
//  Created by sgchinese on 16/5/26.
//  Copyright © 2016年 sgchinese. All rights reserved.
//

#import "ShowButtonView.h"
#import "AppDelegate.h"


@implementation ShowButtonView
{
    CGRect _fram1;
    CGRect _fram2;
    CGRect _fram3;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.

*/
- (void)drawRect:(CGRect)rect {
//
    //进行动画展示
    
    [self showButtonsAnimation];
}

- (IBAction)blackAction:(UIButton *)sender {
    [self RestoreView];
}


- (IBAction)postTakePhotoAction:(UIButton *)sender {
    if (_ActionBlock) {
        _ActionBlock();
        [self RestoreView];
    }

//    [self removeFromSuperview];
}

- (IBAction)postChosePhotoAction:(UIButton *)sender {
//    [self removeFromSuperview];
    if (_Action2Block) {
        _Action2Block();
        [self RestoreView];
    }

}

- (IBAction)postNestAction:(UIButton *)sender {
    if (_Action3Block) {
        _Action3Block();
        [self RestoreView];
    }
//    [self removeFromSuperview];
}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{//

    [self RestoreView];

}
//- (IBAction)DismissAction:(UITapGestureRecognizer *)sender {
//}
+(ShowButtonView*)SetButtonView
{
    NSArray* nibView =  [[NSBundle mainBundle] loadNibNamed:@"ShowButtonView" owner:nil options:nil];
    
    ShowButtonView *buttonView=[nibView lastObject];
    return buttonView;
}
+(void)showView:(ShowButtonView *)buttonView
{
//     __weak typeof(self) wself = self;
 
    buttonView.layer.zPosition=100;
    buttonView.frame=CGRectMake(0, 0, _S_Width, _S_Height);
    AppDelegate *appDelegate = (AppDelegate *)[UIApplication sharedApplication].delegate;
    NSLog(@"%lf",buttonView.post_nest.frame.size.width);
    
    
    [appDelegate.window addSubview:buttonView];
    
    
    [UtilityPopManager rotateLayer:buttonView.post_AddButton.layer to:M_PI_2/2];
  

  
}

-(void)RestoreView
{
    __weak typeof(self) wself = self;
    double delayInSeconds = 0.6;
    [UtilityPopManager rotateLayer:self.post_AddButton.layer to:M_PI_2];
    [self dismissButtonsAnimation];
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds *NSEC_PER_SEC); dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        [wself removeFromSuperview];
        
    });
}

-(void)showButtonsAnimation
{
    _fram1=self.post_TakePhoto.frame;
    _fram2=self.post_album.frame;
    _fram3=self.post_nest.frame;
    self.post_TakePhoto.layer.zPosition=0;
    self.post_album.layer.zPosition=0;
    self.post_nest.layer.zPosition=0;
    self.post_AddButton.layer.zPosition=10;
    NSLog(@"%lf,@%lf",_fram3.size.width,_fram3.size.height);
    NSLog(@"%lf,@%lf",_fram2.size.width,_fram2.size.height);
    NSLog(@"%lf,@%lf",_fram1.size.width,_fram1.size.height);
    self.post_TakePhoto.frame=_post_AddButton.frame;
    self.post_album    .frame    =_post_AddButton.frame;
    self.post_nest     .frame     =_post_AddButton.frame;
    CGRect fram=_post_AddButton.frame;
    [UtilityPopManager initailzerAnimationWithToPostion:_fram1 formPostion:fram atView:_post_TakePhoto beginTime:0.1];
    [UtilityPopManager initailzerAnimationWithToPostion:_fram2 formPostion:fram atView:_post_album beginTime:0.2];
    [UtilityPopManager initailzerAnimationWithToPostion:_fram3 formPostion:fram atView:_post_nest beginTime:0.3];

}
-(void)dismissButtonsAnimation
{
  

    CGRect fram=CGRectMake(_S_Width/2, _S_Height-45, 0, 0);
    [UtilityPopManager initailzerAnimationWithToPostion:fram formPostion:_fram1 atView:_post_TakePhoto beginTime:0.1];
    [UtilityPopManager initailzerAnimationWithToPostion:fram formPostion:_fram2 atView:_post_album beginTime:0.2];
    [UtilityPopManager initailzerAnimationWithToPostion:fram formPostion:_fram3 atView:_post_nest beginTime:0.3];
    _post_TakePhoto.layer.zPosition=0;
    _post_album.layer.zPosition=0;
    _post_nest.layer.zPosition=0;


}


@end
