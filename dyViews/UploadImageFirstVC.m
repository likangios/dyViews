//
//  UploadImageFirstVC.m
//  dyViews
//
//  Created by FengLing on 15/11/30.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "UploadImageFirstVC.h"
#import "UploadImageSecondVC.h"



@implementation UploadImageFirstVC

- (void)viewDidLoad {
    [super viewDidLoad];
}

#pragma mark 下一张

- (void)NextBtnClick:(id)sender {
    [super NextBtnClick:sender];
    NSLog(@"下一步");
    [self.navigationController pushViewController:[[UploadImageSecondVC alloc]init] animated:YES];
}
/**
 *  选择照片后更新UI
 */
- (void)updateUI{
    [super updateUI];
    self.accountProgressView.uploadImageLabel.text = @"照片上传(1/3)";
    self.TitleLabel.text = @"二代身份证正面照";

}
#pragma mark ----
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
@end
