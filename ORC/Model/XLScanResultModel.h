//
//  XLScanResultModel.h
//  IDAndBankCard
//
//  Created by mxl on 2017/3/28.
//  Copyright © 2017年 mxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface XLScanResultModel : NSObject

@property (assign, nonatomic) int type; //1:正面  2:反面
@property (copy, nonatomic) NSString *code; //身份证号
@property (copy, nonatomic) NSString *name; //姓名
@property (copy, nonatomic) NSString *gender; //性别
@property (copy, nonatomic) NSString *nation; //民族
@property (copy, nonatomic) NSString *address; //地址
@property (copy, nonatomic) NSString *issue; //签发机关
@property (copy, nonatomic) NSString *valid; //有效期
@property (nonatomic, strong) UIImage *idImage;


@property (nonatomic, copy) NSString *bankNumber;
@property (nonatomic, copy) NSString *bankName;
@property (nonatomic, strong) UIImage *bankImage;


-(NSString *)toString;

-(BOOL)isOK;

@end
