//
//  SelectVipUnitVCViewController.m
//  dyViews
//
//  Created by FengLing on 15/12/3.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "SelectVipUnitVCViewController.h"
//VC
#import "UploadImageFirstVC.h"
//view
#import "AccountProgressView.h"
#import "SignAgreementView.h"
#import "VipUnitListVC.h"

@interface SelectVipUnitVCViewController ()<UITextFieldDelegate>
@property (nonatomic,strong)  AccountProgressView *accountProgressView;
@property (nonatomic,strong) SignAgreementView *signAgView;
@end

@implementation SelectVipUnitVCViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self creatViews];
    
}
#pragma mark Views
- (void)creatViews{
    _accountProgressView =[AccountProgressView loadSelfWithNibOwner:self];
    [_accountProgressView setCurrentStep:1];
    
    [self.view addSubview:_accountProgressView];
    
    _signAgView = [SignAgreementView loadSelfWithNibOwner:self];
    [self.view addSubview:_signAgView];
    
    _signAgView.NickName.delegate = self;
    _signAgView.VipUnit.delegate = self;
    _signAgView.IdCard.delegate = self;
    
    [_signAgView.NickName addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_signAgView.VipUnit addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [_signAgView.IdCard addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
    [IHKeyboardAvoiding setAvoidingView:self.view withTriggerView:_signAgView.NickName];
    [IHKeyboardAvoiding setAvoidingView:self.view withTriggerView:_signAgView.IdCard];
    [_signAgView.NextBtn addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    _signAgView.NextBtn.enabled = NO;
    [self setConstraints];

}
#pragma mark action
- (void)nextClick{
    
    [self.navigationController pushViewController:[[UploadImageFirstVC alloc]init] animated:YES];
}
#pragma mark  setConstraints
- (void)setConstraints{
    //    开户进度
    [_accountProgressView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(65);
    }];
    
    [_signAgView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.equalTo(_accountProgressView.mas_bottom);
        make.height.mas_equalTo(270);
    }];
}
#pragma mark UITextFieldDelegate
-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField{
    if (textField == _signAgView.VipUnit) {
        [self.view endEditing:YES];
        VipUnitListVC *viplist = [[VipUnitListVC alloc]init];
        [viplist setBlock:^(NSString *name){
            _signAgView.VipUnit.text = name;
        }];
        [self.navigationController pushViewController:viplist animated:YES];
        return NO;
    }
    return YES;
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    if (textField == _signAgView.NickName) {
        [_signAgView.IdCard becomeFirstResponder];
    }else{
        [_signAgView.IdCard resignFirstResponder];
    }
    return YES;
}
- (void)textFieldDidChange:(UITextField *)textField
{
    NSInteger maxSize = 0;
    
    if (textField == _signAgView.VipUnit) {
        maxSize = MAX_CANON;
    }else if(textField == _signAgView.NickName){
        maxSize = 10;
    }else if (textField == _signAgView.IdCard){
        maxSize = 18;
    }
    if (textField.text.length > maxSize) {
        textField.text = [textField.text substringToIndex:maxSize];
    }
    
    if (_signAgView.NickName.text.length>0&&(_signAgView.IdCard.text.length>17)&&_signAgView.VipUnit.text.length) {
        _signAgView.NextBtn.enabled = YES;
    }else{
        _signAgView.NextBtn.enabled = NO;
    }
}
- (BOOL)textField:(UITextField *)textField shouldChangeCharactersInRange:(NSRange)range replacementString:(NSString *)string{
    
    if (textField == _signAgView.IdCard) {
    if (string.length) {
        if ([string integerValue]) {
            return YES;
        }else{
            if ([string isEqualToString:@"0"])
                return YES;
            return NO;
        }
    }
    }
    return YES;
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
