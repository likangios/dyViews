//
//  ttttViewController.m
//  dyViews
//
//  Created by FengLing on 15/12/1.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "ttttViewController.h"

@interface ttttViewController ()

@property (weak, nonatomic) IBOutlet UIView *baseView;
@property (weak, nonatomic) IBOutlet UILabel *testlabel;
@end

@implementation ttttViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.testlabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(10);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
 
}
- (void)changeFrame{
    
    NSArray *arr = self.testlabel.constraints;
    
    [self.testlabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.centerX.equalTo(self.view);
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(200);
    }];
  
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [self changeFrame];
    
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
