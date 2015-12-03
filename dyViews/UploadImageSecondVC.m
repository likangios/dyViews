//
//  UploadImageSecondVC.m
//  dyViews
//
//  Created by FengLing on 15/11/30.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "UploadImageSecondVC.h"
#import "UploadImageThirdVC.h"


@implementation UploadImageSecondVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.accountProgressView.uploadImageLabel.text = @"照片上传(1/3)";
}
#pragma mark 下一张
/**
 *  点击下一张
 *
 *  @param sender
 */
- (void)NextBtnClick:(id)sender {
    [super NextBtnClick:sender];
[self.navigationController pushViewController:[[UploadImageThirdVC alloc]init] animated:YES];
}
#pragma mark update UI
/**
 *  选择照片后更新UI
 */
- (void)updateUI{
    [super updateUI];
    self.accountProgressView.uploadImageLabel.text = @"照片上传(2/3)";
    self.TitleLabel.text = @"二代身份证反面照";
    
}
#pragma mark ----
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
