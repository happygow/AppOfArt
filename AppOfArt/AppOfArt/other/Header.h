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
#define weakify(var)   __weak typeof(var) weakSelf = var
// 屏幕适配，以 6 为参照
#define HYValue(value) ((value)/375.0f*[UIScreen mainScreen].bounds.size.width)

#define HYUIColor(color) [UIColor colorWithHexString:color]

/**
 *  白色字体颜色
 */
#define HYWhiteColor [UIColor colorWithHexString:@"ffffff"]
// RGB
#define HYrgb(r,g,b)   [UIColor colorWithRed:(r)/255.0f green:(g)/255.0f blue:(b)/255.0f alpha:1.0f]

#define fontMax HYValue (15.0)
#define fontMin HYValue (14.0)
#define spacing HYValue (15.0)



// url
#define dailyList @"http://baobab.wandoujia.com/api/v1/feed.bak?num=%ld&date=%@"
#define photoList @"http://api.mobile.9panart.com/works/91e39a0d-1ced-4433-ba43-a4edd2e97c9c"
// 创意
#define idealList @"http://baobab.kaiyanapp.com/api/v1/videos.bak?strategy=date&categoryName=%E5%88%9B%E6%84%8F&num=10"

#define huabaoUrl @"http://design.zuimeia.com/api/v2/articles/daily/simple/"

#endif /* Header_h */
