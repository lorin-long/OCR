//
//  IDBackViewController.h
//  ORC
//
//  Created by lorin on 2017/6/21.
//  Copyright © 2017年 lorin. All rights reserved.
//

#import <UIKit/UIKit.h>
@class IDInfo;
@interface IDBackViewController : UIViewController
// 身份证信息
@property (nonatomic,strong) IDInfo *IDInfo;

// 身份证图像
@property (nonatomic,strong) UIImage *IDImage;

@end
