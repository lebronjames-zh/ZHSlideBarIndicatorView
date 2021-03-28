//
//  SlideBarIndicatorView.h
//  SlideBarIndicatorViewProject
//
//  Created by 曾浩 on 2019/8/25.
//  Copyright © 2019 曾浩. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface SlideBarIndicatorView : UIView

/**
 rate = contentOffset.x/invisibleWidth
 invisibleWidth = (contentSize.width - screenWidth)
 invisibleWidth可以理解为屏外剩余宽度
 */
@property (nonatomic, assign) CGFloat rate;

/**
 一行几个
 */
@property (nonatomic, assign) NSInteger column;

/**
 总共几个Cell
 */
@property (nonatomic, assign) NSInteger total;

@end

NS_ASSUME_NONNULL_END
