//
//  HYLunBoView.h
//  AppOfArt
//
//  Created by sunnyday on 2017/2/18.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HYLunBoView : UIView<UICollectionViewDelegate, UICollectionViewDataSource>



- (instancetype)initWithImageArray:(NSArray *)imageArray;
@end
