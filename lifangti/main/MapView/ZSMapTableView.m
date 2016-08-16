
//
//  ZSMapTableView.m
//  lifangti
//
//  Created by xthink4 on 16/8/16.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "ZSMapTableView.h"

@implementation ZSMapTableView
{
    AMapSearchAPI *_search;
    NSMutableArray *_arr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
-(void)POIWithLocation:(AMapGeoPoint *)location{
    AMapPOIAroundSearchRequest *request = [[AMapPOIAroundSearchRequest alloc] init];
    request.location = location;

    // types属性表示限定搜索POI的类别，默认为：餐饮服务|商务住宅|生活服务
    // POI的类型共分为20种大类别，分别为：
    // 汽车服务|汽车销售|汽车维修|摩托车服务|餐饮服务|购物服务|生活服务|体育休闲服务|
    // 医疗保健服务|住宿服务|风景名胜|商务住宅|政府机构及社会团体|科教文化服务|
    // 交通设施服务|金融保险服务|公司企业|道路附属设施|地名地址信息|公共设施
//    request.types = @"餐饮服务|生活服务";
    request.sortrule = 0;
    request.requireExtension = YES;
    
    //发起周边搜索
    [_search AMapPOIAroundSearch: request];
}
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    [self initSearch];
}
- (void)clearSearch
{
   _search.delegate = nil;
}

- (void)initSearch
{
    _search = [[AMapSearchAPI alloc] init];
    _search.delegate = self;
}

-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *identifier = @"cellID";
    
    //通过标识符，在tableView的复用队列里查询cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    
    if (cell == nil) {
        //如果在复用队列里没有查询结果，那么就创建一个新的cell
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];

    }
    AMapPOI *poi=[_arr objectAtIndex:indexPath.row];
    cell.textLabel.text=poi.name;
    cell.detailTextLabel.text=poi.address;
    if (indexPath.section == 0) {
        // NSLog(@"%@",_dataArr);
    }

    
    return cell;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return _arr.count;
}
- (void)onPOISearchDone:(AMapPOISearchBaseRequest *)request response:(AMapPOISearchResponse *)response
{
    if(response.pois.count == 0)
    {
        return;
    }
    _arr=[NSMutableArray arrayWithArray:response.pois];
    [_maptable reloadData];
    //通过 AMapPOISearchResponse 对象处理搜索结果
    NSString *strCount = [NSString stringWithFormat:@"count: %d",response.count];
    NSString *strSuggestion = [NSString stringWithFormat:@"Suggestion: %@", response.suggestion];
    NSString *strPoi = @"";
    for (AMapPOI *p in response.pois) {
        strPoi = [NSString stringWithFormat:@"%@\nPOI: %@", strPoi, p.description];
    }
    NSString *result = [NSString stringWithFormat:@"%@ \n %@ \n %@", strCount, strSuggestion, strPoi];
    NSLog(@"Place: %@", result);
}
@end
