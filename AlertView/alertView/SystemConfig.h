//
//  SKB_SystemConfig.h
//  SKB_New
//
//  Created by Hyperion on 2019/5/23.
//  Copyright © 2019 Hyperion. All rights reserved.
//

#ifndef SystemConfig_h
#define SystemConfig_h

/** 导入头文件 **/
#import <UIKit/UIKit.h>
#import <Foundation/Foundation.h>

/**
 屏幕宽度
 @return float类型 屏幕宽度
 */
NS_INLINE CGFloat ScreenWith(){
    return [UIScreen mainScreen].bounds.size.width;
}

/**
 屏幕高度
 @return float类型 屏幕高度
 */
NS_INLINE CGFloat ScreenHeight(){
    return [UIScreen mainScreen].bounds.size.height;
}



/**
 宽度比例
 @return CGFloat 宽度比例
 */
NS_INLINE CGFloat WIDTH(){
    //    if ([[UIScreen mainScreen] bounds].size.width == 414) {
    //        return [[UIScreen mainScreen] bounds].size.width/414;
    //    }else{
    return  ScreenWith()/375;
    //    }
}

/**
 高度比例
 @return CGFloat 高度比例
 */
NS_INLINE CGFloat HEIGHT(){
    if (ScreenHeight() == 896 ) {
        return  ScreenHeight()/812;
    }else
        if (ScreenHeight() == 812 ) {
            return  ScreenHeight()/812;
        }else{
            return ScreenHeight()/667;
        }
}

#endif /* SKB_SystemConfig_h */
