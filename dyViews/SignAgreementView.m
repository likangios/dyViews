//
//  SignAgreementView.m
//  dyViews
//
//  Created by FengLing on 15/12/3.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "SignAgreementView.h"

@implementation SignAgreementView

- (IBAction)DZBtnClick:(id)sender {
    self.DZBtn.selected  = !self.DZBtn.selected;
    if (self.DZBtn.selected) {
        [self.DZBtn setBackgroundColor:color_yellow];
    }else{
        [self.DZBtn setBackgroundColor:[UIColor whiteColor]];
    }
}
- (IBAction)PEBtnClick:(id)sender {
    self.PEBtn.selected =! self.PEBtn.selected;
    if (self.PEBtn.selected) {
        [self.PEBtn setBackgroundColor:color_yellow];
    }else{
        [self.PEBtn setBackgroundColor:[UIColor whiteColor]];
    }
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    [super drawRect:rect];
    [self.NextBtn setBackgroundImage:[Unity imageWithColor:color_yellow andSize:CGSizeMake(1, 1)] forState:UIControlStateNormal];
    
    [self.NextBtn setBackgroundImage:[Unity imageWithColor:color_yellow2 andSize:CGSizeMake(1, 1)] forState:UIControlStateDisabled];
    // Drawing code
}


@end
