//
//  HYLunboFlowlayout.m
//  AppOfArt
//
//  Created by sunnyday on 2017/2/18.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYLunboFlowlayout.h"

@implementation HYLunboFlowlayout



- (void)prepareLayout
{
    [super prepareLayout];
    self.itemSize = self.collectionView.frame.size;
    self.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    self.collectionView.pagingEnabled = YES;
    self.minimumLineSpacing = 0;
    self.minimumInteritemSpacing = 0;
    self.collectionView.showsHorizontalScrollIndicator = NO;// 水平线
}



@end
