//
//  XLScanManagerControl.h
//  IDAndBankCard
//
//  Created by mxl on 2017/3/28.
//  Copyright © 2017年 mxl. All rights reserved.
//

#import "XLScanManagerInitialize.h"

@interface XLScanManagerControl : XLScanManagerInitialize

- (void)startSession;

- (void)stopSession;

- (void)resetConfig;

- (void)resetParams;

- (void)doSomethingWhenWillAppear;

- (void)doSomethingWhenWillDisappear;

- (void)parseIDCardImageBuffer:(CVImageBufferRef)imageBuffer;

- (void)parseBankImageBuffer:(CVImageBufferRef)imageBuffer;

//选择前置和后置
- (BOOL)switchCameras;
// 闪关灯
- (void)setFlashMode:(AVCaptureFlashMode)flashMode;
// 手电筒
- (void)setTorchMode:(AVCaptureTorchMode)torchMode;
// 焦距
- (void)focusAtPoint:(CGPoint)point;
// 曝光量
- (void)exposeAtPoint:(CGPoint)point;
//重置曝光
- (void)resetFocusAndExposureModes;

@end
