//
//  ViewController.m
//  AlertView
//
//  Created by Hyperion on 2019/5/23.
//  Copyright © 2019 Hyperion. All rights reserved.
//

#import "ViewController.h"
#import "alertView/AlertView.h"
#import "UIButton+DIY.h"
#import "Masonry.h"
#import "SystemConfig.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    UIButton *topBtn = [[UIButton alloc] init];
    [topBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_login_normol"] forState:UIControlStateNormal];
    topBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [topBtn setTitle:@"顶部弹窗" forState:UIControlStateNormal];
    [topBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    topBtn.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:topBtn];
    
    [topBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(50);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(323*WIDTH(), 65*HEIGHT()));
    }];
    
    /** 点击确定 **/
    [topBtn tapBtn:^(UIButton * _Nonnull btn) {
       

        [AlertView showTopAlert:@{@"title":@"提示",@"subTitle":@"内容"} withAlertImg:@"home_tan_icon_tip" toDo:^(NSString * _Nonnull result) {
            
            
        }];
    }];
    
    UIButton *centerBtn = [[UIButton alloc] init];
    [centerBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_login_normol"] forState:UIControlStateNormal];
    centerBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [centerBtn setTitle:@"中间弹窗" forState:UIControlStateNormal];
    [centerBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    centerBtn.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:centerBtn];
    
    [centerBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(topBtn.mas_bottom);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(323*WIDTH(), 65*HEIGHT()));
    }];
    
    /** 点击确定 **/
    [centerBtn tapBtn:^(UIButton * _Nonnull btn) {
        
        [AlertView showCenterAlert:@{@"title":@"提示",@"subTitle":@"内容"} withAlertImg:@"home_tan_icon_tip" toDo:^(NSString * _Nonnull result) {
            
        }];
    }];
    
    
    UIButton *bottomBtn = [[UIButton alloc] init];
    [bottomBtn setBackgroundImage:[UIImage imageNamed:@"login_btn_login_normol"] forState:UIControlStateNormal];
    bottomBtn.titleLabel.font = [UIFont systemFontOfSize:16];
    [bottomBtn setTitle:@"底部弹窗" forState:UIControlStateNormal];
    [bottomBtn setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    bottomBtn.adjustsImageWhenHighlighted = NO;
    
    [self.view addSubview:bottomBtn];
    
    [bottomBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(centerBtn.mas_bottom);
        make.centerX.mas_equalTo(0);
        make.size.mas_equalTo(CGSizeMake(323*WIDTH(), 65*HEIGHT()));
    }];
    
    /** 点击确定 **/
    [bottomBtn tapBtn:^(UIButton * _Nonnull btn) {
        
        [AlertView showBottomAlert:@{@"title":@"提示",@"subTitle":@"内容"} withAlertImg:@"home_tan_icon_tip" toDo:^(NSString * _Nonnull result) {
            
        }];
    }];
    

    
}


@end
