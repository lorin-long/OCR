//
//  IDBackViewController.m
//  ORC
//
//  Created by lorin on 2017/6/21.
//  Copyright © 2017年 lorin. All rights reserved.
//

#import "IDBackViewController.h"
#import "IDInfo.h"
@interface IDBackViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *IDBackImage;
@property (weak, nonatomic) IBOutlet UILabel *IDTime;
@property (weak, nonatomic) IBOutlet UILabel *IDSignAddress;

@end

@implementation IDBackViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.IDBackImage.layer.cornerRadius = 8;
    self.IDBackImage.layer.masksToBounds = YES;
    
    self.IDTime.text =_IDInfo.valid;
    self.IDSignAddress.text=_IDInfo.issue;
    self.IDBackImage.image = _IDImage;

    
}
- (IBAction)AgainBtn:(UIButton *)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)NextBtn:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
