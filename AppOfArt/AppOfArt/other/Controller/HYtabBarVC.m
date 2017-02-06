//
//  HYtabBarVC.m
//  freelife
//
//  Created by sunnyday on 2016/10/15.
//  Copyright © 2016年 sunnyday. All rights reserved.
//

#import "HYtabBarVC.h"
#import "HYoneVC.h"
#import "HYtwoVC.h"
#import "HYthreeVC.h"
#import "HYfourVC.h"
#import "HYtabBar.h"
#import "CustomNavigationController.h"

@interface HYtabBarVC ()
// 数组
@property (nonatomic , strong) NSArray *array;
@end

@implementation HYtabBarVC
//是否支持旋转屏幕
- (BOOL)shouldAutorotate
{
    return YES;
}

//支持哪些方向
- (UIInterfaceOrientationMask)supportedInterfaceOrientations
{
    return UIInterfaceOrientationMaskPortrait;
}

//默认显示的方向
- (UIInterfaceOrientation)preferredInterfaceOrientationForPresentation
{
    return UIInterfaceOrientationPortrait;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    //self.view.backgroundColor = [UIColor whiteColor];
    //[UINavigationBar appearance];
    // 通过appearance统一设置所有UITabBarItem的文字属性
    // 后面带有UI_APPEARANCE_SELECTOR的方法, 都可以通过appearance对象来统一设置
//    
//    NSMutableDictionary *attrs = [NSMutableDictionary dictionary];
//    attrs[NSFontAttributeName] = [UIFont systemFontOfSize:12];
//    attrs[NSForegroundColorAttributeName] = [UIColor grayColor];
//    
//    NSMutableDictionary *selectedAttrs = [NSMutableDictionary dictionary];
//    selectedAttrs[NSFontAttributeName] = attrs[NSFontAttributeName];
//    selectedAttrs[NSForegroundColorAttributeName] = [UIColor darkGrayColor];
//    
//    UITabBarItem *item = [UITabBarItem appearance];
//    [item setTitleTextAttributes:attrs forState:UIControlStateNormal];
//    [item setTitleTextAttributes:selectedAttrs forState:UIControlStateSelected];
    [self setChildViewControllers];
    [self setTabBar];
}

- (void)setChildViewControllers
{
    HYOneVC *one = [[HYOneVC alloc] init];
    CustomNavigationController *navione = [[CustomNavigationController alloc] initWithRootViewController:one];
    navione.fullScreenPopGestureEnabled = YES;
    
    
    HYTwoVC *two = [[HYTwoVC alloc] init];
    CustomNavigationController *navitwo = [[CustomNavigationController alloc] initWithRootViewController:two];
    navitwo.fullScreenPopGestureEnabled = YES;
    
    
    HYThreeVC *three = [[HYThreeVC alloc] init];
    CustomNavigationController *navithree = [[CustomNavigationController alloc] initWithRootViewController:three];
    navithree.fullScreenPopGestureEnabled = YES;
    
    
    HYFourVC *four = [[HYFourVC alloc] init];
    CustomNavigationController *navifour = [[CustomNavigationController alloc] initWithRootViewController:four];
    navifour.fullScreenPopGestureEnabled = YES;

    
    self.viewControllers = @[navione,navitwo,navithree,navifour];
}

- (void)setTabBar
{
    NSArray *titleArr = @[@"精选",@"流逝",@"视频",@"自我"];
    
    NSArray *imageArr = @[@"tabBar_essence_icon",@"tabBar_new_icon",@"tabBar_me_icon",@"tabBar_friendTrends_icon"];
    NSArray *selectedArray = @[@"tabBar_essence_click_icon",@"tabBar_new_click_icon",@"tabBar_me_click_icon",@"tabBar_friendTrends_click_icon"];
    
    
    //  循环设置
    for (int i = 0; i < 4; i ++) {
        UIViewController *vc = self.viewControllers[i];
        vc.tabBarItem = [[UITabBarItem alloc] initWithTitle:titleArr[i] image:[UIImage imageNamed:imageArr[i]] selectedImage:[UIImage imageNamed:selectedArray[i]]];
        vc.tabBarItem.tag = i;
    }
    //获取导航条最高权限
    [[UITabBarItem appearance]setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:20]} forState:UIControlStateNormal];
    
}


// 封装

@end
