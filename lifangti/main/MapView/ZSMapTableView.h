//
//  ZSMapTableView.h
//  lifangti
//
//  Created by xthink4 on 16/8/16.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
@interface ZSMapTableView : BaseXibVIew<UITableViewDelegate,UITableViewDataSource,AMapSearchDelegate>
@property (weak, nonatomic) IBOutlet UITableView *maptable;
-(void)POIWithLocation:(AMapGeoPoint *)location;
@end
