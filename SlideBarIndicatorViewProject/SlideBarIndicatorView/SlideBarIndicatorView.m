//
//  SlideBarIndicatorView.m
//  SlideBarIndicatorViewProject
//
//  Created by 曾浩 on 2019/8/25.
//  Copyright © 2019 曾浩. All rights reserved.
//

#import "SlideBarIndicatorView.h"
#import <SDAutoLayout.h>
#import "UIColor+Hex.h"

@interface SlideBarIndicatorView ()

@property (nonatomic, strong) UIView *blueView;
@property (nonatomic, strong) UIView *lightView;
@property (nonatomic, assign) CGFloat slideRate;

@end

@implementation SlideBarIndicatorView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor clearColor];
        self.slideRate = 0.6;
        [self setupView];
    }
    return self;
}

#pragma mark - initView

- (void)setupView
{
    [self sd_addSubviews:@[self.lightView,
                           self.blueView]];
    
    self.lightView.sd_layout
    .leftEqualToView(self)
    .topEqualToView(self)
    .widthRatioToView(self, 1)
    .heightRatioToView(self, 1);
    self.lightView.sd_cornerRadius = @(1.5);
    
    self.blueView.sd_layout
    .leftEqualToView(self)
    .topEqualToView(self)
    .widthRatioToView(self.lightView, self.slideRate)
    .heightRatioToView(self.lightView, 1);
    self.blueView.sd_cornerRadius = @(1.5);
}

#pragma mark - method

- (void)setTotal:(NSInteger)total
{
    _total = total;
    self.slideRate  = self.slideRate - ((total - self.column)/self.column * 0.2  + total%self.column/self.column * 0.2);
    if (self.slideRate <= 0.2) self.slideRate = 0.2;
    self.blueView.sd_layout
    .widthRatioToView(self.lightView, self.slideRate);
}

- (void)setRate:(CGFloat)rate
{
    _rate = rate;
    // 计算蓝色滑动条相对父view左边距离
    CGFloat leftSpace = rate * ((1 - self.slideRate) * self.size.width);
    self.blueView.sd_resetLayout
    .leftSpaceToView(self, leftSpace)
    .topEqualToView(self)
    .widthRatioToView(self.lightView, self.slideRate)
    .heightRatioToView(self.lightView, 1);
}

#pragma mark - init

- (UIView *)blueView
{
    if (!_blueView) {
        _blueView = [[UIView alloc] init];
        _blueView.backgroundColor = [UIColor colorWithHexString:@"#018BEC"];
    }
    return _blueView;
}

- (UIView *)lightView
{
    if (!_lightView) {
        _lightView = [[UIView alloc] init];
        _lightView.backgroundColor = [UIColor colorWithHexString:@"#C9C8C7"];
    }
    return _lightView;
}


/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
