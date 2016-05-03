# StatusBarHUD

状态栏通知小框架

##显示成功信息
```objc
[HQStatusBarHUD showSuccessWithString:@"发布成功"];
```

##显示失败信息
```objc
[HQStatusBarHUD showErrorWithString:@"发布失败"]
```

##显示loading
```objc
[HQStatusBarHUD showLoadingWithString:@"正在加载中..."]
```

##结束loading
```objc
[HQStatusBarHUD hide]
```