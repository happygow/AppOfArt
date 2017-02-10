//
//  CardLayout.h
//  DDCardAnimation/Users/BruceLee/Documents/final/AppOfArt/AppOfArt/AppOfArt/other/PrefixHeader.pch
//
//  Created by tondyzhang on 16/10/10.
//  Copyright © 2016年 tondy. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol CardLayoutDelegate <NSObject>

@end

@interface CardLayout : UICollectionViewLayout

@property(nonatomic, assign)CGFloat offsetY;
@property(nonatomic, assign)CGFloat contentSizeHeight;
@property(nonatomic, weak)id<CardLayoutDelegate> delegate;

-(instancetype)initWithOffsetY:(CGFloat)offsetY;


@end
