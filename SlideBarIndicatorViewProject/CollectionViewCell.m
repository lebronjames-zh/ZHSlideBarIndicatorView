//
//  CollectionViewCell.m
//  SlideBarIndicatorViewProject
//
//  Created by 曾浩 on 2019/8/25.
//  Copyright © 2019 曾浩. All rights reserved.
//

#define SCREEN_WIDTH [[UIScreen mainScreen] bounds].size.width
#define SCREEN_HEIGHT [[UIScreen mainScreen] bounds].size.height

#import "CollectionViewCell.h"
#import "UIButton+CenterImageAndTitle.h"
#import <SDAutoLayout.h>
#import "ViewController.h"

@interface CollectionViewCell ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation CollectionViewCell

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor whiteColor];
        [self setupView];
    }
    return self;
}

#pragma mark - initView

- (void)setupView
{
    [self.contentView sd_addSubviews:@[self.button]];
    
    CGFloat buttonW = 42;
    CGFloat spaceW = (SCREEN_WIDTH - 4*buttonW)/5;
    
    self.button.sd_layout
    .leftSpaceToView(self.contentView, spaceW/2 - 10)
    .centerYEqualToView(self.contentView)
    .widthIs(buttonW + 10)
    .heightIs(50);
}

#pragma mark - method

- (void)setIndexRow:(NSInteger)indexRow
{
    _indexRow = indexRow;
    NSArray *array = @[@"ybCloud_home_pricequetation",@"ybCloud_home_brushNews",@"ybCloud_homefarmer_customer_clue",@"ybCloud_home_lcb",@"ybCloud_home_chatquestions",@"ybCloud_home_zsx",@"ybCloud_home_xcws"];
    NSArray *titleArray = @[@"价格行情",@"刷资讯",@"食材采购",@"理菜宝",@"聊问题",@"找生鲜",@"校餐卫士"];
    [self.button setImage:[UIImage imageNamed:array[indexRow]] forState:UIControlStateNormal];
    [self.button setTitle:titleArray[indexRow] forState:UIControlStateNormal];
    
    [self.button updateLayout];
    [self.button verticalCenterImageAndTitle:2];
}

#pragma mark - init

- (UIButton *)button
{
    if (!_button) {
        _button = [[UIButton alloc] init];
        [_button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        _button.titleLabel.font = [UIFont systemFontOfSize:12];
        _button.userInteractionEnabled = NO;
    }
    return _button;
}

@end
