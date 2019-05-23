//
//  UIButton+DIY.h
//  SKB_New
//
//  Created by 陶正亮 on 2019/4/23.
//  Copyright © 2019 陶正亮. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^tapActionBlock)(UIButton *btn);

// 定义一个枚举（包含了四种类型的button）
typedef NS_ENUM(NSUInteger, TzlButtonEdgeInsetsStyle) {
    TzlButtonEdgeInsetsStyleImgTopTxtBottom, // image在上，label在下
    TzlButtonEdgeInsetsStyleImgLeftTxtRight, // image在左，label在右
    TzlButtonEdgeInsetsStyleImgBottomTxtTop, // image在下，label在上
    TzlButtonEdgeInsetsStyleImgRightTxtLeft // image在右，label在左
};

@interface UIButton (TzlDIY)

/** 属性 **/
@property (nonatomic , copy)tapActionBlock actionBlock;
/**
 点击按钮事件
 @param actionBlock 回调方法
 */
- (void)tapBtn:(tapActionBlock)actionBlock;

/**
 *  设置button的titleLabel和imageView的布局样式，及间距
 *
 *  @param style titleLabel和imageView的布局样式
 *  @param space titleLabel和imageView的间距
 */
- (void)layoutButtonWithEdgeInsetsStyle:(TzlButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space;
@end

NS_ASSUME_NONNULL_END
