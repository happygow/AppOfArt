//
//  HYLunBOCell.m
//  AppOfArt
//
//  Created by sunnyday on 2017/2/18.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYLunBOCell.h"

@interface HYLunBOCell()


// iconView
@property (nonatomic, weak) UIImageView *iconView;


@end

@implementation HYLunBOCell



- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        UIImageView *imageView = [[UIImageView alloc] init];
        [self addSubview:imageView];
    
        self.iconView = imageView;
    }
    return self;
}


- (void)setImageName:(NSString *)imageName
{
    _imageName = imageName;
    self.iconView.image = [UIImage imageNamed:imageName];
    
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.iconView.frame = self.bounds;
}



@end
