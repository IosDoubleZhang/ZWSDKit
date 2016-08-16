
//
//  ZSMapView.m
//  lifangti
//
//  Created by xthink4 on 16/8/16.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "ZSMapView.h"

@implementation ZSMapView
{
  
    CLLocationCoordinate2D _movelocation;

}
/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
- (void)clearSearch
{
    self.search.delegate = nil;
}

- (void)initSearch
{
     _search = [[AMapSearchAPI alloc] init];
    self.search.delegate = self;
}

- (void)drawRect:(CGRect)rect {
    // Drawing code
    _map.delegate=self;
    [self initSearch];
    [_map setUserTrackingMode: MAUserTrackingModeFollow animated:YES];
    _map.showsUserLocation = YES;
    
}

#pragma mark---获取当前位置坐标
-(void)mapView:(MAMapView *)mapView didUpdateUserLocation:(MAUserLocation *)userLocation
updatingLocation:(BOOL)updatingLocation
{
    
    if(updatingLocation)
    {
        //取出当前位置的坐标
        // NSLog(@"latitude : %f,longitude: %f",userLocation.coordinate.latitude,userLocation.coordinate.longitude);
        
        //构造AMapReGeocodeSearchRequest对象，location为必选项，radius为可选项
        AMapReGeocodeSearchRequest *regeoRequest = [[AMapReGeocodeSearchRequest alloc] init];
        regeoRequest.location = [AMapGeoPoint locationWithLatitude:userLocation.coordinate.latitude longitude:userLocation.coordinate.longitude ];
        regeoRequest.radius = 1000;
        regeoRequest.requireExtension = YES;
        
        //发起逆地理编码
        [_search AMapReGoecodeSearch: regeoRequest];
        
        
    }
//    _map.showsUserLocation = NO;
    
}


-(void)mapView:(MAMapView *)mapView regionDidChangeAnimated:(BOOL)animated
{
    [UIView animateWithDuration:0.3 animations:^{
        CGRect frame=_pinView.frame;
        frame.origin.y-=10;
        _pinView.frame=frame;
    } completion:^(BOOL finished) {
        [UIView animateWithDuration:0.3 animations:^{
            CGRect frame=_pinView.frame;
            frame.origin.y+=10;
            _pinView.frame=frame;
        }];
    }];
    _movelocation=CLLocationCoordinate2DMake(mapView.centerCoordinate.latitude,mapView.centerCoordinate.longitude);
    AMapReGeocodeSearchRequest *regeoRequest = [[AMapReGeocodeSearchRequest alloc] init];
//    regeoRequest.searchType = AMapSearchType_ReGeocode;
    regeoRequest.location = [AMapGeoPoint locationWithLatitude:mapView.centerCoordinate.latitude longitude:mapView.centerCoordinate.longitude ];

     [self setValue:regeoRequest.location forKey:@"myLocation"];
    regeoRequest.radius = 100;
    regeoRequest.requireExtension = YES;
    //发起逆地理编码
    [_search AMapReGoecodeSearch: regeoRequest];
}
#pragma mark----坐标逆编码
- (void)onReGeocodeSearchDone:(AMapReGeocodeSearchRequest *)request response:(AMapReGeocodeSearchResponse *)response
{
    if(response.regeocode != nil)
    {
        NSLog(@"%@",response.regeocode.formattedAddress);
        if (_address) {
            _address(response.regeocode.formattedAddress);
        }
//        NSLog(@"%@",response.regeocode.location);
    }
}



@end
