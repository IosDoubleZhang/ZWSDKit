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
@interface CubeView : BaseXibVIew<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet BaseTable *CubeTable;


@end
