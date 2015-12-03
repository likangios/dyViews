//
//  SetExchangePasswordVC.m
//  dyViews
//
//  Created by FengLing on 15/12/3.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "SetExchangePasswordVC.h"
#import "AccountProgressView.h"
#import "ExchangePasswordView.h"
#import "AccountFinishVC.h"
@interface SetExchangePasswordVC ()<UITextFieldDelegate>

/**
 *  开户进度
 */
@property (nonatomic,strong) AccountProgressView *accountProgressView;
/**
 *  设置交易密码 view
 */
@property (nonatomic,strong) ExchangePasswordView *exchangeView;

@end

@implementation SetExchangePasswordVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
    [IHKeyboardAvoiding setPaddingForCurrentAvoidingView:5];
    [IHKeyboardAvoiding setAvoidingView:self.view withTriggerView:_exchangeView.PasswordTextField];
    [IHKeyboardAvoiding setAvoidingView:self.view withTriggerView:_exchangeView.PasswordOKTextField];
    
    // Do any additional setup after loading the view from its nib.
}
- (void)creatView{
    _accountProgressView =[[[NSBundle mainBundle]loadNibNamed:@"AccountProgressView" owner:self options:nil]lastObject];
    [_accountProgressView setCurrentStep:3];
    [self.view addSubview:_accountProgressView];
    
    _exchangeView =[[[NSBundle mainBundle]loadNibNamed:@"ExchangePasswordView" owner:self options:nil]lastObject];
    [_exchangeView.NextBtn addTarget:self action:@selector(nextClick) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_exchangeView];
    self.exchangeView.PasswordOKTextField.delegate = self;
    self.exchangeView.PasswordTextField.delegate = self;
    self.exchangeView.NextBtn.enabled = NO;
    [self.exchangeView.PasswordTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self.exchangeView.PasswordOKTextField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    [self setConstraints];
    
}
#pragma mark Constraints
/**
 *  更新约束
 */
- (void)setConstraints{
    WS(ws);
    //    开户进度
    [_accountProgressView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.height.mas_equalTo(65);
    }];
    
    [_exchangeView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.top.equalTo(_accountProgressView.mas_bottom);
        make.height.mas_equalTo(250);
    }];

}
#pragma mark Action

- (void)nextClick{
    NSLog(@"下一步");
    [self.navigationController pushViewController:[[AccountFinishVC alloc] init] animated:YES];
}
#pragma mark UITextFieldDelegate

- (void)textFieldDidChange:(UITextField *)textField
{
    if (textField.text.length > 16) {
        textField.text = [textField.text substringToIndex:16];
    }
    if (_exchangeView.PasswordTextField.text.length>7&&_exchangeView.PasswordOKTextField.text.length>7) {
        _exchangeView.NextBtn.enabled = YES;
    }else{
        _exchangeView.NextBtn.enabled = NO;
    }
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
