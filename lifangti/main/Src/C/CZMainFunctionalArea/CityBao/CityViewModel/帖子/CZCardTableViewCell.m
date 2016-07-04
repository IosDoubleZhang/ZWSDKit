//
//  CZCardTableViewCell.m
//  CityBao3-0
//
//  Created by xthink4 on 16/6/30.
//  Copyright © 2016年 xthink. All rights reserved.
//

#import "CZCardTableViewCell.h"
#import "ZSFlowLayout.h"
#import "ZSViewCell.h"
#import "RFLayout.h"
@implementation CZCardTableViewCell
#define SCREENWITH   [UIScreen mainScreen].bounds.size.width
#define SCREENHEIGHT [UIScreen mainScreen].bounds.size.height
- (void)awakeFromNib {
    [super awakeFromNib];
    RFLayout *layout = [[RFLayout alloc] init];
    //设置是否需要分页
//    [layout setPagingEnabled:YES];
    
    self.CZCardView.collectionViewLayout = layout;
    self.CZCardView.showsVerticalScrollIndicator=NO;
    self.CZCardView.showsHorizontalScrollIndicator=NO;
    self.CZCardView.backgroundColor=[UIColor whiteColor];
    [self.CZCardView registerNib:[UINib nibWithNibName:@"ZSViewCell" bundle:nil] forCellWithReuseIdentifier:@"ZSViewCell"];
//    [self.CZCardView setPagingEnabled:YES];

    
    // Initialization code
}

#pragma mark cell的数量
-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return _data.count;
}
-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView
 {
     return 1;
   }

#pragma mark cell的视图
- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *cellIdentifier = @"ZSViewCell";
    ZSViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:cellIdentifier forIndexPath:indexPath];
    return cell;
}

#pragma mark cell的大小

-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    return CGSizeMake(AUTO_W(220), AUTO_H(281));
}

#pragma mark cell的点击事件
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"点击图片%ld",indexPath.row);
}
- (void)collectionView:(UICollectionView *)collectionView didEndDisplayingCell:(UICollectionViewCell *)cell forItemAtIndexPath:(NSIndexPath *)indexPath{
//    NSLog(@"%ld",indexPath.row);
}
//获取第index个page的contentView

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
