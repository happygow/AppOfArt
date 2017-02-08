//
//  Header.h
//  freelife
//
//  Created by LeeBruce on 16/10/24.
//  Copyright © 2016年 sunnyday. All rights reserved.
//

#ifndef Header_h
#define Header_h


#ifdef DEBUG
#define HYLog(...)    NSLog(__VA_ARGS__)
#else
#define HYLog(...)
#endif

#define HYScreenWidth [[UIScreen mainScreen] bounds].size.width

#define HYScreenHeight [[UIScreen mainScreen] bounds].size.height

// 屏幕适配，以 6 为参照
#define HYValue(value) ((value)/375.0f*[UIScreen mainScreen].bounds.size.width)

#define HYUIColor(color) [UIColor colorWithHexString:color]

/**
 *  白色字体颜色
 */
#define HYWhiteColor [UIColor colorWithHexString:@"ffffff"]
// RGB
#define HYrgb(r,g,b)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]




// url
#define dailyList @"http://baobab.wandoujia.com/api/v1/feed.bak?num=%ld&date=%@"

#endif /* Header_h */
