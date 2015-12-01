//
//  AccountFinishVC.m
//  dyViews
//
//  Created by FengLing on 15/11/27.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "AccountFinishVC.h"

@interface AccountFinishVC ()
@property (weak, nonatomic) IBOutlet UILabel *Account;
@property (weak, nonatomic) IBOutlet UIButton *signLabel;
@property (weak, nonatomic) IBOutlet UIButton *signBtn;
@property (weak, nonatomic) IBOutlet UIView *mask;

@end

@implementation AccountFinishVC


- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self setLayoutView];
    
    self.Account.text= @"XXXXXX";
    
    // Do any additional setup after loading the view.
}

- (void)setLayoutView{
    
    self.title = @"开户完成";

    NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:@"银行签约"];
    
    [att addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, 4)];
    [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:15] range:NSMakeRange(0, 4)];
    [att addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, 4)];
    [self.signLabel setAttributedTitle:att forState:UIControlStateNormal];
    
}
- (IBAction)signLabelClick:(id)sender {
    
    NSLog(@"银行签约");
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
