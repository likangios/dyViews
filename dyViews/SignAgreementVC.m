//
//  SignAgreementVC.m
//  dyViews
//
//  Created by FengLing on 15/11/30.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "SignAgreementVC.h"
#import "AccountFinishVC.h"
#import "UploadImageFirstVC.h"
#import "UploadImageSecondVC.h"
#import "UploadImageThirdVC.h"
#import "ttttViewController.h"

@interface SignAgreementVC ()
@property (weak, nonatomic) IBOutlet UIButton *AgreeAgreementBtn;
@property (weak, nonatomic) IBOutlet UIButton *confirmBtn;

@end

@implementation SignAgreementVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.confirmBtn.enabled = NO;
    self.confirmBtn.alpha = 0.4;
}
#pragma mark Action
- (IBAction)AgreeAgreementClick:(id)sender {
    
    self.AgreeAgreementBtn.selected = !self.AgreeAgreementBtn.selected;
    self.confirmBtn.enabled = self.AgreeAgreementBtn.selected;
    self.confirmBtn.alpha = self.AgreeAgreementBtn.selected?1.0:0.4;
   
}
- (IBAction)ConfirmClick:(id)sender {
    
[self.navigationController pushViewController:[[UploadImageSecondVC alloc]initWithNibName:@"UploadImageSecondVC" bundle:nil] animated:YES];
    
//    [self.navigationController pushViewController:[[ttttViewController alloc]init] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
