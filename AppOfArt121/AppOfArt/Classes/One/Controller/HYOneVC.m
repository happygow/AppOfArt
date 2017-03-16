//
//  HYOneVC.m
//  AppOfArt
//
//  Created by LeeBruce on 17/2/6.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYOneVC.h"
#import "onetextViewController.h"

@interface HYOneVC ()

@end

@implementation HYOneVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor yellowColor];
    // Do any additional setup after loading the view.
    
    
    // 设置导航栏左边的按钮
    self.navigationItem.leftBarButtonItem = [UIBarButtonItem itemWithImage:@"tabBar_friendTrends_click_icon" highImage:@"tabBar_friendTrends_click_icon" target:self action:@selector(tagClick)];

   
}



- (void)tagClick
{
    onetextViewController *tags = [[onetextViewController alloc] init];
    [self.navigationController pushViewController:tags animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
