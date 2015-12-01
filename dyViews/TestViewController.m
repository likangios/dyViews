//
//  TestViewController.m
//  dyViews
//
//  Created by FengLing on 15/12/1.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "TestViewController.h"

@interface TestViewController ()


@property (nonatomic,strong) UIButton *button;
@property (nonatomic,assign) CGSize buttonSize;

@end

@implementation TestViewController

-(void)loadView
{
    [super loadView];
    _button = [UIButton buttonWithType:UIButtonTypeSystem];
    [self.view addSubview:_button];
    
}
- (void)viewDidLoad {
    [super viewDidLoad];
    [_button setTitle:@"点击" forState:UIControlStateNormal];
    [_button.layer setBorderColor:[[UIColor greenColor] CGColor]];
    [_button.layer setBorderWidth:3];
    [_button addTarget:self action:@selector(clickWithButton:) forControlEvents:UIControlEventTouchUpInside];
    _buttonSize = CGSizeMake(100, 100);
//    [self.view setNeedsUpdateConstraints];
    
    
}
- (void)updateViewConstraints {

    [self.button mas_updateConstraints:^(MASConstraintMaker *make) {// 更新约束
        make.center.equalTo(self.view); // 居中
        make.width.equalTo(@(_buttonSize.width)).priorityLow();     // 宽 等于 100 优先级 低 第一次显示的时候是100
        make.height.equalTo(@(_buttonSize.height)).priorityLow();   // 高 等于 100 优先级 低 第一次显示的时候是100
        make.width.lessThanOrEqualTo(self.view);                    // 宽 小于 等于 view  当宽度大于等于 view 需满足此条件
        make.height.lessThanOrEqualTo(self.view);                   // 高 小于 等于 view  当高度大于等于 view 需满足此条件
    }];
    [super updateViewConstraints];

}
- (void)clickWithButton:(UIButton *)button
{
    _buttonSize = CGSizeMake(_buttonSize.width * 1.3, _buttonSize.height * 1.3); // 宽高 乘 1.3
    [self.view setNeedsUpdateConstraints];
    [UIView animateWithDuration:0.4 animations:^{
        [self.view layoutIfNeeded];
    }];
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
