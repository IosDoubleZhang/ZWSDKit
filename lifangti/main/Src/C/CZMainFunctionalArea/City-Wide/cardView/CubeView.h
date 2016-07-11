//
//  CubeView.h
//  lifangti
//
//  Created by xthink4 on 16/7/6.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "BaseXibVIew.h"
#import "BaseTable.h"
@class cubeViewController;
@interface CubeView : BaseXibVIew<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet BaseTable *CubeTable;

typedef void (^cubeViewControllerBlock)      (cubeViewController *parse);
@property(nonatomic,strong)cubeViewControllerBlock cubeBlock;
@end
