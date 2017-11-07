//
//  XLScanBaseManager.h
//  IDAndBankCard
//
//  Created by mxl on 2017/3/28.
//  Copyright © 2017年 mxl. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <AVFoundation/AVFoundation.h>
#import <UIKit/UIKit.h>
#import <ReactiveCocoa/ReactiveCocoa.h>
#import "RectManager.h"
#import "BankCardSearch.h"
#import "UIImage+Extend.h"
#import "XLScanResultModel.h"
#import "exbankcard.h"
#import "excards.h"


typedef enum : NSUInteger {
    BankScanType,
    IDScanType,
} kScanType;

@interface XLScanBaseManager : NSObject <AVCaptureVideoDataOutputSampleBufferDelegate, AVCaptureAudioDataOutputSampleBufferDelegate,AVCaptureMetadataOutputObjectsDelegate>

@property (nonatomic, assign) BOOL                      verify;

@property (nonatomic, assign) kScanType scanType;

@property (nonatomic, strong) RACSubject *receiveSubject;
@property (nonatomic, strong) RACSubject *bankScanSuccess;
@property (nonatomic, strong) RACSubject *idCardScanSuccess;
@property (nonatomic, strong) RACSubject *scanError;

@property (nonatomic, strong) AVCaptureSession *captureSession;

@property (nonatomic, copy) NSString *sessionPreset; // 图片质量

@property (nonatomic, assign) BOOL isInProcessing;

@property (nonatomic, assign) BOOL isHasResult;

//出流
@property (nonatomic, strong) AVCaptureVideoDataOutput *videoDataOutput;
//输入流
@property (nonatomic, strong) AVCaptureDeviceInput *activeVideoInput;

// 能否切换前置后置
- (BOOL)canSwitchCameras;

- (AVCaptureDevice *)activeCamera;

- (AVCaptureDevice *)inactiveCamera;
// 闪关灯
- (AVCaptureFlashMode)flashMode;
// 有无手电筒
- (BOOL)cameraHasTorch;

- (AVCaptureTorchMode)torchMode;
// 能否调整焦距
- (BOOL)cameraSupportsTapToFocus;


@end
