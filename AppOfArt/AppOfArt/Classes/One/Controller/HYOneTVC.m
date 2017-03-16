//
//  HYOneTVC.m
//  AppOfArt
//
//  Created by LeeBruce on 17/3/14.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYOneTVC.h"
#import "HYOneModel.h"
#import "HYoneCell.h"
@interface HYOneTVC ()<UITableViewDelegate,UITableViewDataSource>
@property (nonatomic, strong) NSMutableArray *modelArray;
@property (nonatomic, strong) UIViewController *controller;
@end
static NSString *ID = @"cell";
@implementation HYOneTVC

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        [self.view addSubview:self.tableView];
        [self loadData];
    }
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self createView];

}

- (void)createView
{
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, HYScreenWidth, HYScreenHeight)];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [_tableView registerClass:[HYoneCell class] forCellReuseIdentifier:ID];
    UIView *tableHeaderView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, HYScreenWidth, HYValue(242))];
    tableHeaderView.backgroundColor = [UIColor whiteColor];
    _tableView.scrollIndicatorInsets = UIEdgeInsetsMake(HYValue(182), 0, 0, 0);
    _tableView.tableHeaderView = tableHeaderView;

}


- (void)loadData
{
    NSString *filePath = [[NSBundle mainBundle] pathForResource:@"index" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:filePath];
    NSError *error;
    NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&error];
    
    NSArray * dataArray = [[dic objectForKey:@"data"] objectForKey:@"topic"];
    
    
    [self.modelArray removeAllObjects];
    for (unsigned long i = 0; i<[dataArray count]; i++) {
        HYOneModel *model = [[HYOneModel alloc] init];
        NSString *string = [NSString stringWithFormat:@"recomand_%02ld%@",i+1,@".jpg"];
        UIImage *image  = [UIImage imageNamed:string];
        
        model.placeholderImage = image;
        
        NSDictionary *itemDic = dataArray[i];
        model.picUrl = [itemDic objectForKey:@"pic"];
        model.title = [itemDic objectForKey:@"title"];
        model.views = [itemDic objectForKey:@"views"];
        model.likes = [itemDic objectForKey:@"likes"];
        
        NSDictionary *userDic = [itemDic objectForKey:@"user"];
        model.author = [userDic objectForKey:@"nickname"];
        
        [self.modelArray addObject:model];
        
    }
    
    
    [self.tableView reloadData];
    
}
- (void)tableView:(UITableView *)tableView willDisplayCell:(UITableViewCell *)cell forRowAtIndexPath:(NSIndexPath *)indexPath {
    if ([tableView respondsToSelector:@selector(setSeparatorInset:)]) {
        [tableView setSeparatorInset:UIEdgeInsetsMake(0, 0, 0, 0)];
    }
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 300;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.modelArray count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    HYoneCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    
    cell.oneModel = [self.modelArray objectAtIndex:indexPath.row];
    return cell;
}

- (NSMutableArray *)modelArray
{
    if (!_modelArray) {
        _modelArray = [NSMutableArray array];
    }
    return _modelArray;
}




@end
