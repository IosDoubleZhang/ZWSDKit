//
//  ShowButtonView.h
//  someFuntionGather
//
//  Created by sgchinese on 16/5/26.
//  Copyright © 2016年 sgchinese. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ShowButtonView : UIView
@property (weak, nonatomic) IBOutlet UIButton *post_AddButton;

@property (weak, nonatomic) IBOutlet UIButton *post_TakePhoto;

@property (weak, nonatomic) IBOutlet UIButton *post_nest;
@property (weak, nonatomic) IBOutlet UIButton *post_album;

@property (weak, nonatomic) IBOutlet UILabel *post_Lab_TakePhoto;

@property (weak, nonatomic) IBOutlet UILabel *post_Lab_album;
@property (weak, nonatomic) IBOutlet UILabel *post_Lab_nest;

- (IBAction)postTakePhotoAction:(UIButton *)sender;

- (IBAction)postChosePhotoAction:(UIButton *)sender;
- (IBAction)postNestAction:(UIButton *)sender;
+(void)showView;
@end
