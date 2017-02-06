//
//  CardCellCollectionViewCell.m
//  DDCardAnimation
//
//  Created by tondyzhang on 16/10/11.
//  Copyright © 2016年 tondy. All rights reserved.
//

#import "CardCellCollectionViewCell.h"

@interface CardCellCollectionViewCell()

//@property(nonatomic, strong)UILabel* titleLabel;
//@property(nonatomic, strong)UIImageView* imageView;
@property(nonatomic, strong)UIVisualEffectView* blurView;

@end

static int cellCount;

@implementation CardCellCollectionViewCell

-(instancetype)init
{
    self = [self initWithFrame:CGRectZero];
    return self;
}

-(instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
         CGFloat width = frame.size.width;
        CGFloat height = frame.size.height;
        self.layer.cornerRadius = 6;
        self.layer.masksToBounds = YES;
        
        self.imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, width, height)];
        [self.contentView addSubview:self.imageView];
        
        self.titleLabel = [[UILabel alloc] initWithFrame:CGRectMake(10, 20, width, 30)];
        self.titleLabel.textColor = [UIColor blackColor];
        self.titleLabel.font = [UIFont systemFontOfSize:15];
        [self.contentView addSubview:self.titleLabel];
        
//
        //[self initUI];
        
        cellCount++;
        NSLog(@"%d",cellCount);
    }
    return self;
}

-(void)layoutSubviews
{
    self.contentView.frame = self.bounds;
    self.titleLabel.center = CGPointMake(self.bounds.size.width/2.0, 2 + self.titleLabel.frame.size.height/2.0);
    self.imageView.frame = self.bounds;
    self.blurView.frame = self.bounds;
}

-(void)initUI
{
    
//    _imageView = [[UIImageView alloc] init];
//    _imageView.image = [UIImage imageNamed:@"1"];
//    [self.contentView addSubview:_imageView];
    
//    
//    _messageLabel = [[UILabel alloc] init];
//    _messageLabel.textColor = [UIColor yellowColor];
//    
    
    
    
    
    [self.contentView addSubview:self.titleLabel];
    self.layer.cornerRadius = 6;
    self.layer.masksToBounds = YES; 
}

//-(UILabel*)titleLabel
//{
//    if (!_titleLabel) {
//        _titleLabel = [[UILabel alloc]init];
//        _titleLabel.font = [UIFont systemFontOfSize:14];
//        _titleLabel.textColor = [UIColor whiteColor];
//    }
//    return _titleLabel;
//}

//-(void)setTitle:(NSString *)title
//{
//    _title = title;
//    self.titleLabel.text = title;
//    [self.titleLabel sizeToFit];
//    [self setNeedsLayout];
//}
//
//-(void)setBgColor:(UIColor *)bgColor
//{
//    self.contentView.backgroundColor = bgColor;
//}
//
//-(void)setImage:(UIImage *)image
//{
//    _image = image;
//    [self.imageView removeFromSuperview];
//    self.imageView = [[UIImageView alloc]initWithImage:image];
//    [self.contentView addSubview:self.imageView];
//}

//
- (void)setModel:(VideoListModel *)model
{
    _model = model;
    
    self.titleLabel.text = model.titleLabel;
    
}
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