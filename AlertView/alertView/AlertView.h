//
//  AlertView.h
//  AlertView
//
//  Created by Hyperion on 2019/5/23.
//  Copyright © 2019 Hyperion. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(unsigned char, ALERTTYPE) {
    ALERTTYPETOTOP = 1,
    ALERTTYPETOCENTER = 2,
    ALERTTYPETOBOTTOM = 3,
};


NS_ASSUME_NONNULL_BEGIN

@interface AlertView : UIView

/** 顶部弹窗
 msdDict : 传入弹窗需要显示的内容
 img : 弹窗左边图片
 toDo: 点击弹窗后需要执行的事

 */

+ (AlertView *)showTopAlert:(NSDictionary *)msdDict withAlertImg:(NSString *)img toDo:(void (^)(NSString *result))doSomething;

/** 中间弹窗
 msdDict : 传入弹窗需要显示的内容
 img : 弹窗左边图片
 toDo: 点击弹窗后需要执行的事
 
 */

+ (AlertView *)showCenterAlert:(NSDictionary *)msdDict withAlertImg:(NSString *)img toDo:(void (^)(NSString *result))doSomething;

/** 底部弹窗
 msdDict : 传入弹窗需要显示的内容
 img : 弹窗左边图片
 toDo: 点击弹窗后需要执行的事
 
 */

+ (AlertView *)showBottomAlert:(NSDictionary *)msdDict withAlertImg:(NSString *)img toDo:(void (^)(NSString *result))doSomething;

@end

NS_ASSUME_NONNULL_END
