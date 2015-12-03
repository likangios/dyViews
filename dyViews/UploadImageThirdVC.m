//
//  UploadImageThirdVC.m
//  dyViews
//
//  Created by FengLing on 15/12/2.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "UploadImageThirdVC.h"
#import "SetExchangePasswordVC.h"
#import "ImageUploadSuccessAlertView.h"

@implementation UploadImageThirdVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.accountProgressView.uploadImageLabel.text = @"照片上传(2/3)";
    [self.NextBtn setTitle:@"下一步" forState:UIControlStateNormal];
}
#pragma mark 下一张
/**
 *  点击下一张
 *
 *  @param sender
 */
- (void)NextBtnClick:(id)sender {
    [super NextBtnClick:sender];
    
    [ImageUploadSuccessAlertView showViewAt:self.view.window ok:^{
        [self.navigationController pushViewController:[[SetExchangePasswordVC alloc]init] animated:YES];

    }];
}
#pragma mark update UI
/**
 *  选择照片后更新UI
 */
- (void)updateUI{
    [super updateUI];
    self.accountProgressView.uploadImageLabel.text = @"照片上传(3/3)";
    self.TitleLabel.text = @"手持确认书";
}
#pragma mark ----
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}@end
