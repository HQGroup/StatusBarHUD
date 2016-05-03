




//
//  HQStatusBarHUD.m
//  StatusBarHUD
//
//  Created by hq on 16/5/3.
//  Copyright © 2016年 hanqing. All rights reserved.
//

#import "HQStatusBarHUD.h"

#define  HQScreenWidth [UIScreen mainScreen].bounds.size.width

//提示框的高度
#define HQTipsHeight 40

//字体大小
#define HQFontSize [UIFont systemFontOfSize:14]

@interface HQStatusBarHUD()

@end

@implementation HQStatusBarHUD


static UIWindow *window;

static NSTimer *timer;


+(void) setUpWindow{
    
    window=[[UIWindow alloc] init];
    
    window.windowLevel=UIWindowLevelStatusBar;
    
    window.frame=CGRectMake(0, -HQTipsHeight, HQScreenWidth,HQTipsHeight);
    
    window.hidden=NO;
    
    [UIView animateWithDuration:0.5 animations:^{
        
        window.frame=CGRectMake(0,0, HQScreenWidth,HQTipsHeight);
        
    }];
}


+(void) showMessage:(NSString *) message image:(UIImage *) image messageBgColor:(UIColor *)bgColor {
    
    [timer invalidate];
    
    [self setUpWindow];
    
    window.backgroundColor=bgColor;
    

    UIButton *but=[[UIButton alloc]initWithFrame:window.bounds];
    
    but.titleEdgeInsets=UIEdgeInsetsMake(0, 10, 0, 0);
    
    [but setTitle:message forState:UIControlStateNormal];
    
    [but setImage:image forState:UIControlStateNormal];
    
    but.titleLabel.textColor=[UIColor whiteColor];
    
    but.titleLabel.font=HQFontSize;
    
    [window addSubview:but];
    
    //添加自动消失动画
    timer=[NSTimer scheduledTimerWithTimeInterval:0.5 target:self selector:@selector(hide) userInfo:nil repeats:NO];

}

//显示成功信息
+(void) showSuccessWithString:(NSString *) message{

    [self showMessage:message image:[UIImage imageNamed:@"StatusBarHUD.bundle/success_ico"] messageBgColor:[UIColor colorWithRed:0.600 green:0.800 blue:0.400 alpha:1.000]];
}

+(void) showErrorWithString:(NSString *) message{
    
    [self showMessage:message image:[UIImage imageNamed:@"StatusBarHUD.bundle/error_icon"] messageBgColor:[UIColor colorWithRed:1.000 green:0.216 blue:0.246 alpha:1.000]];
}

+(void) showMessageWithString:(NSString *) message{
    
    [self showMessage:message image:[UIImage imageNamed:@"StatusBarHUD.bundle/info_icon"] messageBgColor:[UIColor colorWithRed:1.000 green:0.600 blue:0.000 alpha:1.000]];
}

+(void)showLoading:(NSString *)message messageBgColor:(UIColor *)bgColor{
    
    [self setUpWindow];
    
    window.backgroundColor=bgColor;
    
    UIActivityIndicatorView *indicator=[[UIActivityIndicatorView alloc]initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleWhite];
    
    indicator.frame=CGRectMake(0, (HQTipsHeight-indicator.bounds.size.height)*0.5, indicator.bounds.size.width, indicator.bounds.size.height);
    
    [indicator startAnimating];
    
    CGFloat labW=[message sizeWithAttributes:@{NSFontAttributeName:HQFontSize}].width;
    
    UILabel *lab=[[UILabel alloc]init];
    
    lab.frame=CGRectMake(indicator.bounds.size.width, 0, labW, HQTipsHeight);
    
    lab.text=message;
    
    lab.textAlignment=NSTextAlignmentCenter;
    
    lab.textColor=[UIColor whiteColor];
    
    lab.font=HQFontSize;

    
    UIView *view=[[UIView alloc] init];
    
    view.bounds=CGRectMake(0, 0, indicator.bounds.size.width+labW, HQTipsHeight);
    
    view.center=window.center;
    
    
    [view addSubview:indicator];
    
    [view addSubview:lab];

    
    [window addSubview:view];
}

+(void) showLoadingWithString:(NSString *) message{
    
    [self showLoading:message messageBgColor:[UIColor colorWithRed:1.000 green:0.600 blue:0.000 alpha:1.000]];
}

+(void) hide{
    
    [UIView animateWithDuration:0.5 delay:0.5 options:UIViewAnimationOptionCurveLinear animations:^{
        window.frame=CGRectMake(0,-HQTipsHeight, HQScreenWidth,HQTipsHeight);
    } completion:^(BOOL finished) {
        window=nil;
    }];
}


@end
