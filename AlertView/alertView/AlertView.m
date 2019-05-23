//
//  AlertView.m
//  AlertView
//
//  Created by Hyperion on 2019/5/23.
//  Copyright © 2019 Hyperion. All rights reserved.
//

#import "AlertView.h"
#import "SystemConfig.h"
#import "UIButton+DIY.h"
#import "Masonry.h"

#define MyColor(r,g,b,a)   [UIColor colorWithRed:(r/255.0) green:(g/255.0) blue:(b/255.0) alpha:a]

@interface AlertView ()<CAAnimationDelegate>

/** 主体控件 */
@property(nonatomic, strong) UIImageView *mainView;

/** 消息内容 */
@property(nonatomic, strong) NSDictionary *msgDict;
/** 提示图片名 */
@property(nonatomic, copy) NSString *imgStr;

@end


@implementation AlertView


+ (AlertView *)showTopAlert:(NSDictionary *)msdDict withAlertImg:(NSString *)img toDo:(void (^)(NSString *result))doSomething{
    
    return [[self alloc] initWithMsg:msdDict withImgStr:img type:ALERTTYPETOTOP toDo:^(NSString *result) {
        doSomething(result);
    }];
}

+ (AlertView *)showCenterAlert:(NSDictionary *)msdDict withAlertImg:(NSString *)img toDo:(void (^)(NSString *result))doSomething{
    
    return [[self alloc] initWithMsg:msdDict withImgStr:img type:ALERTTYPETOCENTER toDo:^(NSString *result) {
        doSomething(result);
    }];
}

+ (AlertView *)showBottomAlert:(NSDictionary *)msdDict withAlertImg:(NSString *)img toDo:(void (^)(NSString *result))doSomething{
    

    return [[self alloc] initWithMsg:msdDict withImgStr:img type:ALERTTYPETOBOTTOM toDo:^(NSString *result) {
        doSomething(result);
    }];
    
}


- (AlertView *)initWithMsg:(NSDictionary *)msgdict withImgStr:(NSString *)img type:(ALERTTYPE)type toDo:(void (^)(NSString *result))doSomething {
    
    if (self = [super init]) {
        
        self.imgStr = img;
        self.msgDict = msgdict;
        
        self.frame = CGRectMake(0, 0, ScreenWith(), ScreenHeight());
        self.backgroundColor = MyColor(0, 0, 0, 0.6);

        [self addUItype:type toDo:^(NSString *result) {
            
             doSomething(result);
        }];
        
        [self addAnimation];
    }
    return self;
}

- (void)addUItype:(ALERTTYPE)type toDo:(void (^)(NSString *result))doSomething{
    
    [[UIApplication sharedApplication].keyWindow addSubview:self];
    
    if (type == ALERTTYPETOTOP) {
        
        self.mainView = [[UIImageView alloc] initWithFrame:CGRectMake(10*WIDTH(), 40*HEIGHT(), ScreenWith()-20*WIDTH(), 75*HEIGHT())];

    }else if (type == ALERTTYPETOCENTER){
        
        self.mainView = [[UIImageView alloc] initWithFrame:CGRectMake(10*WIDTH(), 0, ScreenWith()-20*WIDTH(), 75*HEIGHT())];
        
        self.mainView.center = CGPointMake(ScreenWith()/2,ScreenHeight()/2);
        
    }else{
        
        self.mainView = [[UIImageView alloc] initWithFrame:CGRectMake(10*WIDTH(), ScreenHeight()- 130*HEIGHT(), ScreenWith()-20*WIDTH(), 75*HEIGHT())];
    }

    
    self.mainView.image = [UIImage imageNamed:@"home_tan_bg"];
    self.mainView.userInteractionEnabled = YES;
    [self addSubview:self.mainView];
    
    UIButton *doSmBtn = [[UIButton alloc] initWithFrame:CGRectMake(0, 0, CGRectGetWidth(self.mainView.frame) - 20*WIDTH(), 75*HEIGHT())];
    
    [self.mainView addSubview:doSmBtn];
    
    [doSmBtn tapBtn:^(UIButton * _Nonnull btn) {
        
        [self alerDismiss];
        doSomething(@"dismiss");
    }];

    UIImageView *tishiImg = [[UIImageView alloc] init];
    tishiImg.image = [UIImage imageNamed:self.imgStr];
    [self.mainView addSubview:tishiImg];

    [tishiImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(40*WIDTH());
        make.centerY.mas_equalTo(0);
        make.left.mas_equalTo(22*WIDTH());
    }];

    UILabel *msgLable = [[UILabel alloc] init];
    msgLable.font = [UIFont boldSystemFontOfSize:14];
    msgLable.textColor = [UIColor blackColor];
    msgLable.text = self.msgDict[@"title"];

    [self.mainView addSubview:msgLable];

    [msgLable mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(21*HEIGHT());
        make.height.mas_equalTo(14*HEIGHT());
        make.left.mas_equalTo(tishiImg.mas_right).offset(17*WIDTH());
    }];

    UILabel *subTitleLabel = [[UILabel alloc] init];
    subTitleLabel.font = [UIFont systemFontOfSize:12];
    subTitleLabel.textColor = [UIColor grayColor];
    subTitleLabel.text = self.msgDict[@"subTitle"];

    [self.mainView addSubview:subTitleLabel];

    [subTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(msgLable.mas_bottom).offset(10*HEIGHT());
        make.left.mas_equalTo(msgLable.mas_left);
    }];

    UIImageView *intoImg = [[UIImageView alloc] init];
    intoImg.image = [UIImage imageNamed:@"home_tan_icon_into"];
    [self.mainView addSubview:intoImg];

    [intoImg mas_makeConstraints:^(MASConstraintMaker *make) {
        make.size.mas_equalTo(CGSizeMake(15*WIDTH(), 10*HEIGHT()));
        make.centerY.mas_equalTo(subTitleLabel.mas_centerY);
        make.left.mas_equalTo(subTitleLabel.mas_right).offset(6*WIDTH());
    }];

    UIButton *closeBtn = [[UIButton alloc] init];
    [closeBtn setImage:[UIImage imageNamed:@"home_tan_icon_cancle"] forState:UIControlStateNormal];

    [self.mainView addSubview:closeBtn];

    [closeBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(14*HEIGHT());
        make.right.mas_equalTo(-15*WIDTH());
        make.size.mas_equalTo(15*WIDTH());
    }];

    [closeBtn tapBtn:^(UIButton * _Nonnull btn) {

        [self alerDismiss];

    }];
}

- (void)addAnimation{
    
    if (@available(iOS 9.0, *)) {
        
        CASpringAnimation * springAnim = [CASpringAnimation animationWithKeyPath:@"transform.scale"];
        
        springAnim.fromValue = [NSNumber numberWithDouble:0.0];
        springAnim.toValue = [NSNumber numberWithDouble:1.0];
        springAnim.autoreverses= NO;
        
        [self.mainView.layer addAnimation:springAnim forKey:@"scaleAnimation"];

    }
}


- (void)alerDismiss{
    
    CABasicAnimation *basicAnim = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    basicAnim.duration = 0.25;
    basicAnim.fromValue = [NSNumber numberWithDouble:1.0];
    basicAnim.toValue = [NSNumber numberWithDouble:0.0];
    basicAnim.beginTime = CACurrentMediaTime();
    basicAnim.autoreverses= NO;
    basicAnim.delegate = self;
    basicAnim.removedOnCompletion = NO;
    basicAnim.fillMode = kCAFillModeForwards;
    [self.mainView.layer addAnimation:basicAnim forKey:nil];

}

//#pragma mark - CAAnimationDelegate
- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag {
    
//    [self.mainView removeFromSuperview];
    [self removeFromSuperview];
}



@end
