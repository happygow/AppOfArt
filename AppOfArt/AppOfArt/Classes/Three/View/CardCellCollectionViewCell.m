//
//  CardCellCollectionViewCell.m
//  DDCardAnimation
//
//  Created by tondyzhang on 16/10/11.
//  Copyright © 2016年 tondy. All rights reserved.
//

#import "CardCellCollectionViewCell.h"

@interface CardCellCollectionViewCell()


/** 标题 */

@property(nonatomic, strong)UIVisualEffectView* blurView;

@end

static int cellCount;

@implementation CardCellCollectionViewCell

//-(instancetype)init
//{
//    self = [self initWithFrame:CGRectZero];
//    return self;
//}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        self.contentView.backgroundColor = [UIColor whiteColor];
        
       
        
        
        // coverImage
        self.coverImg = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        self.coverImg.backgroundColor = [UIColor yellowColor];
        [self.contentView addSubview:self.coverImg];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(0, 50, width, 30)];
        //self.titleLabel.backgroundColor = [UIColor redColor];
        
        self.titleLabel.textColor = [UIColor whiteColor];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        self.titleLabel.textAlignment = 1; // 1是center
        //self.titleLabel.text = @"1223123131";
        //self.contentView.alpha = 0.9;
        [self.contentView addSubview:self.titleLabel];
//
        //[self initUI];
        
        cellCount++;
        NSLog(@"cellCount %d",cellCount);
    }
    return self;
}

//-(void)layoutSubviews
//{
//    self.contentView.frame = self.bounds;
//    self.titleLabel.center = CGPointMake(self.bounds.size.width/2.0, 2 + self.titleLabel.frame.size.height/2.0);
//    //self.imageView.frame = self.bounds;
//    self.blurView.frame = self.bounds;
//}



//- (void)setModel:(VideoListModel *)model
//{
//    _model = model;
//    
//    self.titleLabel.text = model.titleLabel;
//    [self.titleLabel sizeToFit];
//    [self setNeedsLayout];
//    [self.coverImg sd_setImageWithURL:[NSURL URLWithString:model.ImageView]];
//    
//    
//}
 //设置毛玻璃效果
-(void)setBlur:(CGFloat)ratio
{
    if (!self.blurView.superview) {
        [self.contentView addSubview:self.blurView];
    }
    [self.contentView bringSubviewToFront:self.blurView];
    self.blurView.alpha = ratio;
}

-(UIVisualEffectView*)blurView
{
    if (!_blurView) {
        _blurView = [[UIVisualEffectView alloc]initWithEffect:[UIBlurEffect effectWithStyle:UIBlurEffectStyleDark]];
        _blurView.frame = self.bounds;
    }
    return _blurView;
}

@end
