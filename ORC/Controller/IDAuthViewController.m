//
//  IDAuthViewController.m
//  IDCardRecognition
//
//  Created by zhongfeng1 on 2017/2/28.
//  Copyright © 2017年 李中峰. All rights reserved.
//

#import "IDAuthViewController.h"
#import "AVCaptureViewController.h"
#import "AVBackViewController.h"
@interface IDAuthViewController ()

@end

@implementation IDAuthViewController

-(instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil {
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self customBackBarButtonItem];
    }
    
    return self;
}

#pragma mark - 自定义系统自带的backBarButtomItem
// 去掉系统默认自带的文字（上一个控制器的title），修改系统默认的样式（一个蓝色的左箭头）为自己的图片
-(void)customBackBarButtonItem {
    // 去掉文字
    // 自定义全局的barButtonItem外观
    UIBarButtonItem *barButtonItemAppearance = [UIBarButtonItem appearance];
    // 将文字减小并设其颜色为透明以隐藏
    [barButtonItemAppearance setTitleTextAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:0.1], NSForegroundColorAttributeName: [UIColor clearColor]} forState:UIControlStateNormal];
    
    // 设置图片
    // 获取全局的navigationBar外观
    UINavigationBar *navigationBarAppearance = [UINavigationBar appearance];
    // 获取原图
    UIImage *image = [[UIImage imageNamed:@"nav_back"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    // 修改navigationBar上的返回按钮的图片，注意：这两个属性要同时设置
    navigationBarAppearance.backIndicatorImage = image;
    navigationBarAppearance.backIndicatorTransitionMaskImage = image;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.navigationItem.title = @"身份证识别";
//    self.navigationController.delegate = self;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - 立即拍摄
- (IBAction)shoot:(UIButton *)sender {
    if ([_formTitle isEqualToString:@"正面"]) {
        AVCaptureViewController *AVCaptureVC = [[AVCaptureViewController alloc] init];
        [self.navigationController pushViewController:AVCaptureVC animated:YES];
    } else{
        AVBackViewController *vc=[[AVBackViewController alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    }
}
@end
