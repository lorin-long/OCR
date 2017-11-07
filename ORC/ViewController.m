//
//  ViewController.m
//  ORC
//
//  Created by lorin on 2017/6/21.
//  Copyright © 2017年 lorin. All rights reserved.
//

#import "ViewController.h"
#import "IDAuthViewController.h"
#import "AVBankViewController.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property(nonatomic,strong) UITableView *tableView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    _tableView=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStylePlain];
    _tableView.delegate=self;
    _tableView.dataSource=self;
    [_tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:@"cell"];
    _tableView.tableFooterView=[[UIView alloc]initWithFrame:CGRectZero];
    [self.view addSubview:_tableView];
    NSString *uuid=[[[UIDevice currentDevice] identifierForVendor] UUIDString];
    NSLog(@"%@",uuid);
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
    switch (indexPath.row) {
        case 0:
            cell.textLabel.text=@"身份证正面识别";
            break;
        case 1:
            cell.textLabel.text=@"身份证反面识别";
            break;
        case 2:
            cell.textLabel.text=@"银行卡识别";
            break;
        default:
            break;
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {
            IDAuthViewController *vc=[IDAuthViewController new];
            vc.formTitle=@"正面";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            IDAuthViewController *vc=[IDAuthViewController new];
            vc.formTitle=@"反面";
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            AVBankViewController *vc=[AVBankViewController new];
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        
        default:
            break;
    }

}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
