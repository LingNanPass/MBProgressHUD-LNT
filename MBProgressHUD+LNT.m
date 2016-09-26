//
//  MBProgressHUD+LNT.m
//
//  Created by LNT on 13-4-18.
//  Copyright (c) All rights reserved.
//

#import "MBProgressHUD+LNT.h"

@implementation MBProgressHUD (LNT)
#pragma mark 显示信息
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;
    // 设置图片
    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"LNTSDK.bundle/%@", icon]]];
    // 再设置模式
    hud.mode = MBProgressHUDModeCustomView;
    
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    
    // 1.5秒之后再消失
    [hud hide:YES afterDelay:1.5];
}


+ (void)show:(NSString *)text view:(UIView *)view{
    
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    
    NSMutableArray *loadingImages = [NSMutableArray array];
    [loadingImages addObject:[UIImage imageNamed:@"loading_img01"]];
    [loadingImages addObject:[UIImage imageNamed:@"loading_img02"]];
    
    UIImageView *ivLoading = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"loading_img01"]];
    
    ivLoading.image=loadingImages[0];
    ivLoading.animationImages=loadingImages;
    ivLoading.animationDuration=0.5f;
    ivLoading.animationRepeatCount=(NSInteger)INTMAX_MAX;
    [ivLoading startAnimating];
    
    hud.customView = ivLoading;
    hud.mode = MBProgressHUDModeCustomView;
    hud.labelText = text;
    hud.labelColor = [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1.0];
    hud.labelFont = [UIFont systemFontOfSize:12];
    hud.color = [UIColor clearColor];
    [hud show:YES];
}

#pragma mark 显示错误信息
+ (void)showError:(NSString *)error toView:(UIView *)view{
    [self show:error icon:@"hud_error.png" view:view];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view
{
    [self show:success icon:@"hud_success.png" view:view];
}

#pragma mark 显示一些信息
+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view {
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];
    // 快速显示一个提示信息
    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = message;
    // 隐藏时候从父控件中移除
    hud.removeFromSuperViewOnHide = YES;
    // YES代表需要蒙版效果
    hud.dimBackground = YES;
    return hud;
}

+ (void)showSuccess:(NSString *)success
{
    [self showSuccess:success toView:nil];
}

+ (void)showError:(NSString *)error
{
    [self showError:error toView:nil];
}

+ (MBProgressHUD *)showMessage:(NSString *)message
{
    return [self showMessage:message toView:nil];
}

+ (void)hideHUDForView:(UIView *)view
{
    [self hideHUDForView:view animated:YES];
}

+ (void)hideHUD
{
    [self hideHUDForView:nil];
}


//增加消失时间
+ (void)show:(NSString *)text icon:(NSString *)icon view:(UIView *)view time:(NSTimeInterval)timeInterval
{
    if (view == nil) view = [[UIApplication sharedApplication].windows lastObject];

    MBProgressHUD *hud = [MBProgressHUD showHUDAddedTo:view animated:YES];
    hud.labelText = text;

    hud.customView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:[NSString stringWithFormat:@"LNTSDK.bundle/%@", icon]]];

    hud.mode = MBProgressHUDModeCustomView;
    
    hud.removeFromSuperViewOnHide = YES;
    
    //限制最小显示时间为0.1秒
    [hud hide:YES afterDelay:((timeInterval < 0.1) ? 0.1 : timeInterval)];
}

+ (void)showSuccess:(NSString *)success showTime:(NSTimeInterval)time
{
    [self show:success icon:@"hud_success.png" view:nil time:time];
}

+ (void)showError:(NSString *)error showTime:(NSTimeInterval)time
{
    [self show:error icon:@"hud_error.png" view:nil time:time];
}

+ (void)showSuccess:(NSString *)success toView:(UIView *)view showTime:(NSTimeInterval)time
{
    [self show:success icon:@"hud_success.png" view:view time:time];
}

+ (void)showError:(NSString *)error toView:(UIView *)view showTime:(NSTimeInterval)time
{
    [self show:error icon:@"hud_error.png" view:view time:time];
}


@end
