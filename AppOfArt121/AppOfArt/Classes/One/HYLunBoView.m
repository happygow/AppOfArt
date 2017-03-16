//
//  HYLunBoView.m
//  AppOfArt
//
//  Created by sunnyday on 2017/2/18.
//  Copyright © 2017年 zhang. All rights reserved.
//

#import "HYLunBoView.h"
#import "HYLunBOCell.h"
#import "HYLunboFlowlayout.h"
static NSString *ID = @"cell";
@interface HYLunBoView()

// collectionView
@property (nonatomic, strong) UICollectionView *collectionView;
// pagecontro;
@property (nonatomic, strong) UIPageControl *pageControl;
// imagearray
@property (nonatomic, strong) NSArray *imageArray;
// time
@property (nonatomic, strong) NSTimer *timer;

@end

@implementation HYLunBoView

- (instancetype)initWithImageArray:(NSArray *)imageArray
{
    self = [super init];
    if (self)
    {

        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero collectionViewLayout:[[HYLunboFlowlayout alloc] init]];
        [collectionView registerClass:[HYLunBOCell class] forCellWithReuseIdentifier:ID];
        collectionView.dataSource = self;
        collectionView.delegate = self;
        [self addSubview:collectionView];
        
        self.collectionView = collectionView;
        self.imageArray = imageArray;
        [self addSubview:self.pageControl];
        
        
        // 回到主线程
        dispatch_async(dispatch_get_main_queue(), ^{
            [self.collectionView scrollToItemAtIndexPath:[NSIndexPath indexPathForItem:self.imageArray.count inSection:0] atScrollPosition:UICollectionViewScrollPositionLeft animated:NO];
            [self addTimer];
        });
    }
    return self;
    
}


// lazy
- (UIPageControl *)pageControl
{
    if (!_pageControl) {
        _pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, 170, 0, 30)];
        _pageControl.numberOfPages = self.imageArray.count;
        _pageControl.pageIndicatorTintColor = [UIColor colorWithRed:82.0/255.0 green:157.0/255.0 blue:219.0/255.0 alpha:1.0];
        _pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    }
    return _pageControl;
}

//   datesource
- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.imageArray.count * 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    HYLunBOCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:ID forIndexPath:indexPath];
    cell.imageName = self.imageArray[indexPath.item % self.imageArray.count];
    return cell;
}
/// delegate
// if touch then scroll
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView
{
    [self scrollViewDidEndScrollingAnimation:scrollView];
}
//  滚动减速时调用
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView
{
    CGFloat offsetX = scrollView.contentOffset.x;
    NSInteger page = offsetX / scrollView.bounds.size.width;
    if (page == 0) {
        page = self.imageArray.count;
        self.collectionView.contentOffset = CGPointMake(page * scrollView.frame.size.width, 0);
    }
    else if(page == [self.collectionView numberOfItemsInSection:0] - 1)
    {
        
        page = self.imageArray.count - 1;
        self.collectionView.contentOffset = CGPointMake(page * scrollView.frame.size.width, 0);
        
    }
    
    NSInteger currentPage = page % self.imageArray.count;
    self.pageControl.currentPage = currentPage;
    [self addTimer];
}

- (void)scrollViewWillBeginDragging:(UIScrollView *)scrollView
{
    [self removeTimer];
}



- (void)addTimer
{
    
    if (self.timer)return;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.5 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    [[NSRunLoop currentRunLoop]addTimer:self.timer forMode:NSRunLoopCommonModes];
}

- (void)removeTimer
{
    [self.timer invalidate];
    self.timer = nil;
}

// next image
- (void)nextImage
{
    CGFloat offsetX = self.collectionView.contentOffset.x;
    NSInteger page = offsetX / self.collectionView.bounds.size.width;
    [self.collectionView setContentOffset:CGPointMake((page + 1) * self.collectionView.bounds.size.width, 0) animated:YES];

}

- (void)layoutSubviews
{
    [super layoutSubviews];
    self.collectionView.frame = self.bounds;
}

- (void)dealloc
{
    [self removeTimer];
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
