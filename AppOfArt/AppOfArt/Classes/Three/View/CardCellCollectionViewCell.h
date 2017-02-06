//
//  CardCellCollectionViewCell.h
//  DDCardAnimation
//
//  Created by tondyzhang on 16/10/11.
//  Copyright © 2016年 tondy. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VideoListModel.h"

@interface CardCellCollectionViewCell : UICollectionViewCell    

//@property(nonatomic, strong)NSString* title;
//@property(nonatomic, strong)UIColor* bgColor;
//@property(nonatomic, strong)UIImage* image;
// model
@property (nonatomic , strong) VideoListModel *model;
/** 图片 */
@property (nonatomic, strong) UIImageView *imageView;

//@property (nonatomic, strong) UIImageView *shadeView;

/** 标题 */
@property (nonatomic, strong) UILabel *titleLabel;

/** Message */
//@property (nonatomic, strong) UILabel *messageLabel;


-(void)setBlur:(CGFloat)ratio; //设置毛玻璃效果

@end
