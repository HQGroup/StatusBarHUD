//
//  HQStatusBarHUD.h
//  StatusBarHUD
//
//  Created by hq on 16/5/3.
//  Copyright © 2016年 hanqing. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface HQStatusBarHUD : NSObject


+(void) showSuccessWithString:(NSString *) message;

+(void) showErrorWithString:(NSString *) message;

+(void) showMessageWithString:(NSString *) message;

+(void) showMessage:(NSString *) message image:(UIImage *) image messageBgColor:(UIColor *) bgColor;


+(void) showLoading:(NSString *) message messageBgColor:(UIColor *) bgColor;

+(void) showLoadingWithString:(NSString *) message;

+(void) hide;


@end
