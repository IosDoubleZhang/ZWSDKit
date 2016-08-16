//
//  ZSMapView.h
//  lifangti
//
//  Created by xthink4 on 16/8/16.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MAMapKit/MAMapKit.h>
#import <AMapSearchKit/AMapSearchKit.h>
@interface ZSMapView : BaseXibVIew<MAMapViewDelegate,AMapSearchDelegate>
@property (weak, nonatomic) IBOutlet MAMapView *map;
@property (nonatomic, strong) AMapSearchAPI *search;
@property (weak, nonatomic) IBOutlet UIImageView *pinView;
@property(nonatomic,strong)AMapGeoPoint *myLocation;
@property(nonatomic,strong)StringBlock address;
@end
