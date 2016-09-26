//
//  MBProgressHUD+LNT.h
//
//  Created by LNT on 13-4-18.
//  Copyright (c) All rights reserved.
//

#import "MBProgressHUD.h"

@interface MBProgressHUD (LNT)
+ (void)showSuccess:(NSString *)success toView:(UIView *)view;
+ (void)showError:(NSString *)error toView:(UIView *)view;

+ (MBProgressHUD *)showMessage:(NSString *)message toView:(UIView *)view;


+ (void)showSuccess:(NSString *)success;
+ (void)showError:(NSString *)error;

+ (MBProgressHUD *)showMessage:(NSString *)message;

+ (void)hideHUDForView:(UIView *)view;
+ (void)hideHUD;

+ (void)show:(NSString *)text view:(UIView *)view;


//time默认最小0.1s
+ (void)showSuccess:(NSString *)success showTime:(NSTimeInterval)time;
+ (void)showError:(NSString *)error showTime:(NSTimeInterval)time;
+ (void)showSuccess:(NSString *)success toView:(UIView *)view showTime:(NSTimeInterval)time;
+ (void)showError:(NSString *)error toView:(UIView *)view showTime:(NSTimeInterval)time;

@end
