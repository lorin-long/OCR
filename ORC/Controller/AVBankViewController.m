//
//  AVBankViewController.m
//  ORC
//
//  Created by lorin on 2017/7/3.
//  Copyright © 2017年 lorin. All rights reserved.
//

#import "AVBankViewController.h"
#import "IDBackView.h"
#import "XLScanManager.h"
@interface AVBankViewController ()
@property (nonatomic, strong) XLScanManager *cameraManager;
@property (nonatomic, strong) IDBackView *idBackView;
@end

@implementation AVBankViewController
-(void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.cameraManager doSomethingWhenWillDisappear];
}
-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    [self.cameraManager doSomethingWhenWillAppear];
}

- (XLScanManager *)cameraManager {
    if (!_cameraManager) {
        _cameraManager = [[XLScanManager alloc] init];
    }
    return _cameraManager;
}
-(IDBackView *)idBackView{
    if (!_idBackView) {
        _idBackView=[[IDBackView alloc]initWithFrame:self.view.frame];
    }
     return _idBackView;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self.view addSubview:self.idBackView];
    self.cameraManager.sessionPreset = AVCaptureSessionPreset1280x720;
    if ([self.cameraManager configBankScanManager]) {
        UIView *view = [[UIView alloc] initWithFrame:self.view.bounds];
        [self.view insertSubview:view atIndex:0];
        AVCaptureVideoPreviewLayer *preLayer = [AVCaptureVideoPreviewLayer layerWithSession: self.cameraManager.captureSession];
        preLayer.frame = [UIScreen mainScreen].bounds;
        
        preLayer.videoGravity = AVLayerVideoGravityResizeAspectFill;
        
        [view.layer addSublayer:preLayer];
        
        [self.cameraManager startSession];
    }
    else {
        NSLog(@"打开相机失败");
        [self.navigationController popViewControllerAnimated:YES];
    }
    
    [self.cameraManager.bankScanSuccess subscribeNext:^(id x) {
        [self showResult:x];
    }];
    [self.cameraManager.scanError subscribeNext:^(id x) {
        
    }];
}
- (void)showResult:(id)result {
    XLScanResultModel *model = (XLScanResultModel *)result;
    NSString *message = [NSString stringWithFormat:@"%@\n%@", model.bankName, model.bankNumber];
    UIAlertView *alertV = [[UIAlertView alloc] initWithTitle:@"扫描成功" message:message delegate:self cancelButtonTitle:@"确定" otherButtonTitles: nil];
    [alertV show];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
