//
//  CZGuanZhu.h
//  CityBao3-0
//
//  Created by xthink4 on 16/6/30.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface CZGuanZhu : UIView<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *GuanZhuTable;

@property(nonatomic,strong)StringBlock Index;
@end
