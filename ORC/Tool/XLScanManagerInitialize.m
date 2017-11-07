//
//  XLScanManagerInitialize.m
//  IDAndBankCard
//
//  Created by mxl on 2017/3/28.
//  Copyright © 2017年 mxl. All rights reserved.
//

#import "XLScanManagerInitialize.h"

@implementation XLScanManagerInitialize

static bool initFlag = NO;
- (void)configIDScan {
    if (!initFlag) {
        const char *thePath = [[[NSBundle mainBundle] resourcePath] UTF8String];
        int ret = EXCARDS_Init(thePath);
        if (ret != 0) {
            NSLog(@"初始化失败：ret=%d", ret);
        }
        initFlag = YES;
    }
}
- (BOOL)configOutPutAtQue:(dispatch_queue_t)queue {
    [self.videoDataOutput setSampleBufferDelegate:self queue:queue];
    if ([self.captureSession canAddOutput:self.videoDataOutput]) {
        [self.captureSession addOutput:self.videoDataOutput];
    } else {
        return NO;
    }
    return YES;
}

- (BOOL)configInPutAtQue:(dispatch_queue_t)queue {
    NSError *error;
    AVCaptureDevice *videoDevice =
    [AVCaptureDevice defaultDeviceWithMediaType:AVMediaTypeVideo];
    AVCaptureDeviceInput *videoInput =
    [AVCaptureDeviceInput deviceInputWithDevice:videoDevice error:&error];
    if (videoInput) {
        if ([self.captureSession canAddInput:videoInput]) {
            [self.captureSession addInput:videoInput];
            self.activeVideoInput = videoInput;
        }
    } else {
        return NO;
    }
    if (error && error.description) {
        NSLog(@"%@", error.description);
        return NO;
    }
    return YES;
}

- (void)configConnection {
    AVCaptureConnection *videoConnection;
    for (AVCaptureConnection *connection in [self.videoDataOutput connections]) {
        for (AVCaptureInputPort *port in[connection inputPorts]) {
            if ([[port mediaType] isEqual:AVMediaTypeVideo]) {
                videoConnection = connection;
            }
        }
    }
    if ([videoConnection isVideoStabilizationSupported]) {
        if ([[[UIDevice currentDevice] systemVersion] floatValue] < 8.0) {
            videoConnection.enablesVideoStabilizationWhenAvailable = YES;
        }
        else {
            videoConnection.preferredVideoStabilizationMode = AVCaptureVideoStabilizationModeAuto;
        }
    }
}

#pragma mark - AVCaptureVideoDataOutputSampleBufferDelegate

- (void)captureOutput:(AVCaptureOutput *)captureOutput didOutputSampleBuffer:(CMSampleBufferRef)sampleBuffer fromConnection:(AVCaptureConnection *)connection {
    CVPixelBufferRef imageBuffer = CMSampleBufferGetImageBuffer(sampleBuffer);
    if ([captureOutput isEqual:self.videoDataOutput]) {
        if(self.isInProcessing == NO) {
            [self.receiveSubject sendNext:(__bridge id)(imageBuffer)];
        }
    }
}


@end
