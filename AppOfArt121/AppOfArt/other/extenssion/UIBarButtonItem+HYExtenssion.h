//
//  UIBarButtonItem+HYExtenssion.h
//  freelife
//
//  Created by LeeBruce on 16/10/21.
//  Copyright © 2016年 sunnyday. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (HYExtenssion)
+ (instancetype)itemWithImage:(NSString *)image highImage:(NSString *)highIamge target:(id)target action:(SEL)action;
@end
