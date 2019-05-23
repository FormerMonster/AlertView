//
//  UIButton+DIY.m
//  SKB_New
//
//  Created by 陶正亮 on 2019/4/23.
//  Copyright © 2019 陶正亮. All rights reserved.
//

#import "UIButton+DIY.h"
#import <objc/runtime.h>

@implementation UIButton (TzlDIY)
- (void)setActionBlock:(tapActionBlock)actionBlock{
    objc_setAssociatedObject(self, @selector(actionBlock), actionBlock, OBJC_ASSOCIATION_COPY_NONATOMIC);
}
- (tapActionBlock)actionBlock{
    return objc_getAssociatedObject(self, @selector(actionBlock));
}


#pragma mark =============== 方法实现 ===============
- (void)tapBtn:(tapActionBlock)actionBlock{
    self.actionBlock = actionBlock;
    [self addTarget:self action:@selector(click:) forControlEvents:UIControlEventTouchUpInside];
}
#pragma mark =============== 点击事件 ===============
- (void)click:(UIButton *)sender{
    if (self.actionBlock) {
        self.actionBlock(sender);
    }
}

/**** 注意
 
 此方法必须在设置按钮图文属性之后使用  否则获取到的将是空 达不到预期效果
 
 */

- (void)layoutButtonWithEdgeInsetsStyle:(TzlButtonEdgeInsetsStyle)style
                        imageTitleSpace:(CGFloat)space {
    
    // 1. 得到imageView和titleLabel的宽、高
    CGFloat imageWith = self.currentImage.size.width;
    CGFloat imageHeight = self.currentImage.size.height;
    
    CGFloat labelWidth = 0.0;
    CGFloat labelHeight = 0.0;
    if ([UIDevice currentDevice].systemVersion.floatValue >= 8.0) {
        // 由于iOS8中titleLabel的size为0，用下面的这种设置
        labelWidth = self.titleLabel.intrinsicContentSize.width;
        labelHeight = self.titleLabel.intrinsicContentSize.height;
    } else {
        labelWidth = self.titleLabel.frame.size.width;
        labelHeight = self.titleLabel.frame.size.height;
    }
    
    // 2. 声明全局的imageEdgeInsets和labelEdgeInsets
    UIEdgeInsets imageEdgeInsets = UIEdgeInsetsZero;
    UIEdgeInsets labelEdgeInsets = UIEdgeInsetsZero;
    
    // 3. 根据style和space得到imageEdgeInsets和labelEdgeInsets的值
    
    switch (style) {
        case TzlButtonEdgeInsetsStyleImgTopTxtBottom: // image在上，label在下
        {
            //            UIEdgeInsetsMake(<#CGFloat top#>, <#CGFloat left#>, <#CGFloat bottom#>, <#CGFloat right#>)
            imageEdgeInsets = UIEdgeInsetsMake(-labelHeight-space/2.0, 0, 0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith, -imageHeight-space/2.0, 0);
        }
            break;
        case TzlButtonEdgeInsetsStyleImgLeftTxtRight: // image在左，label在右
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, -space/2.0, 0, space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, space/2.0, 0, -space/2.0);
        }
            break;
        case TzlButtonEdgeInsetsStyleImgBottomTxtTop: // image在下，label在上
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, 0, -labelHeight-space/2.0, -labelWidth);
            labelEdgeInsets = UIEdgeInsetsMake(-imageHeight-space/2.0, -imageWith, 0, 0);
        }
            break;
        case TzlButtonEdgeInsetsStyleImgRightTxtLeft: // image在右，label在左
        {
            imageEdgeInsets = UIEdgeInsetsMake(0, labelWidth+space/2.0, 0, -labelWidth-space/2.0);
            labelEdgeInsets = UIEdgeInsetsMake(0, -imageWith-space/2.0, 0, imageWith+space/2.0);
        }
            break;
        default:
            break;
    }
    
    // 4. 赋值
    self.titleEdgeInsets = labelEdgeInsets;
    self.imageEdgeInsets = imageEdgeInsets;
}

@end
