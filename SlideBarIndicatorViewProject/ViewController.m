//
//  ViewController.m
//  SlideBarIndicatorViewProject
//
//  Created by 曾浩 on 2019/8/25.
//  Copyright © 2019 曾浩. All rights reserved.
//

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#import "ViewController.h"
#import "SlideBarIndicatorView/SlideBarIndicatorView.h"
#import "CollectionViewCell.h"
#import <SDAutoLayout.h>

static NSString *collectionViewIdentifier = @"CollectionViewCell";

@interface ViewController () <UICollectionViewDataSource, UICollectionViewDelegate>

@property (nonatomic, strong) UICollectionView *collectionView;
@property (nonatomic, strong) SlideBarIndicatorView *slideView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setupView];
}


#pragma mark - initView

- (void)setupView
{
    [self.view sd_addSubviews:@[self.collectionView,
                           self.slideView
                           ]];
    
    self.collectionView.sd_layout
    .leftEqualToView(self.view)
    .topSpaceToView(self.view, 100)
    .rightEqualToView(self.view)
    .heightIs(60);
    
    self.slideView.sd_layout
    .centerXEqualToView(self.view)
    .topSpaceToView(self.collectionView, 12)
    .widthIs(40)
    .heightIs(3);
}

#pragma mark - UICollectionViewDelegate

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 7;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    CollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectionViewIdentifier forIndexPath:indexPath];
    cell.indexRow = indexPath.row;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    if (scrollView == self.collectionView) {
        if (scrollView.contentOffset.x > 0) {
            // rate = contentOffset.x/invisibleWidth
            // invisibleWidth = (contentSize.width - screenWidth)
            // invisibleWidth可以理解为屏外剩余宽度
            CGFloat invisibleWidth = scrollView.contentSize.width - SCREEN_WIDTH;
            CGFloat rate = scrollView.contentOffset.x/invisibleWidth;
            if (rate > 1) rate = 1;
            self.slideView.rate = rate;
        } else {
            self.slideView.rate = 0.0;
        }
    }
}

#pragma mark - method

#pragma mark - init

- (UICollectionView *)collectionView
{
    if (!_collectionView) {
        UICollectionViewFlowLayout * flowLayout = [[UICollectionViewFlowLayout alloc] init];
        
        flowLayout.itemSize = CGSizeMake(SCREEN_WIDTH/5, 50);
        flowLayout.minimumLineSpacing      = 0;
        flowLayout.minimumInteritemSpacing = 0;
        flowLayout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
        _collectionView = [[UICollectionView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, 60) collectionViewLayout:flowLayout];
        _collectionView.delegate   = self;
        _collectionView.dataSource = self;
        _collectionView.showsHorizontalScrollIndicator = NO;
        _collectionView.backgroundColor  = [UIColor clearColor];
        
        [_collectionView registerClass:[CollectionViewCell class] forCellWithReuseIdentifier:collectionViewIdentifier];
    }
    return _collectionView;
}

- (SlideBarIndicatorView *)slideView
{
    if (!_slideView) {
        _slideView = [[SlideBarIndicatorView alloc] init];
        _slideView.column = 5;
        _slideView.total = 7;
    }
    return _slideView;
}

@end
