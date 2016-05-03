//
//  ViewController.m
//  StatusBarHUD
//
//  Created by hq on 16/5/3.
//  Copyright © 2016年 hanqing. All rights reserved.
//

#import "ViewController.h"
#import "HQStatusBarHUD.h"

@interface ViewController ()

- (IBAction)showTips;
- (IBAction)showError;
- (IBAction)showSucess;
- (IBAction)showLoading;
- (IBAction)endLoading;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    
}

- (IBAction)showTips {
    
    [HQStatusBarHUD showMessageWithString:@"你好啊"];
    
}

- (IBAction)showError {
    
    [HQStatusBarHUD showErrorWithString:@"发布失败"];
}

- (IBAction)showSucess {
    
    [HQStatusBarHUD showSuccessWithString:@"发布成功"];
    
    
}

- (IBAction)showLoading {
    
    [HQStatusBarHUD showLoadingWithString:@"正在加载中..."];
    
}

- (IBAction)endLoading {
    
    [HQStatusBarHUD hide];
}
@end
