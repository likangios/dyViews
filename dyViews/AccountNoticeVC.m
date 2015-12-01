//
//  FirstVC.m
//  dyViews
//
//  Created by FengLing on 15/11/27.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "AccountNoticeVC.h"
#import "SignAgreementVC.h"

@interface AccountNoticeVC ()

/**
 *  详情按钮
 */
@property (weak, nonatomic) IBOutlet UIButton *details;

@end


@implementation AccountNoticeVC

/**
 *  开始开户
 *
 *  @param sender 
 */
- (IBAction)StartAccount:(id)sender {
    
    [self.navigationController pushViewController:[[SignAgreementVC alloc]initWithNibName:@"SignAgreementVC" bundle:nil] animated:YES];
}
/**
 *  详情点击
 *
 *  @param sender
 */
- (IBAction)detailsClick:(id)sender {
    NSLog(@"详情");
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    self.title = @"开户须知";
    
}
- (void)setLayoutView{
    
    NSString *string =@"详情";
    NSMutableAttributedString *att = [[NSMutableAttributedString alloc]initWithString:string];
    [att addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInteger:NSUnderlineStyleSingle] range:NSMakeRange(0, string.length)];
    [att addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:13] range:NSMakeRange(0, string.length)];
    [att addAttribute:NSForegroundColorAttributeName value:[UIColor redColor] range:NSMakeRange(0, string.length)];
    [self.details setAttributedTitle:att forState:UIControlStateNormal];
}
@end
