//
//  ttttViewController.m
//  dyViews
//
//  Created by FengLing on 15/12/1.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "ttttViewController.h"
#import "testView.h"
#import "ttt2222ViewController.h"


@interface ttttViewController ()

@property (strong, nonatomic)  testView *test;
@property (weak, nonatomic) IBOutlet UILabel *testlabel;
@end

@implementation ttttViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    _test = [[[NSBundle mainBundle] loadNibNamed:@"testView" owner:self options:nil] lastObject];
    _test.label1.text = @"111";
    _test.label2.text = @"222";
    [self.view addSubview:_test];
    _test.backgroundColor = [UIColor grayColor];
    [_test mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.top.mas_equalTo(0);
        make.width.mas_equalTo(100);
        make.height.mas_equalTo(100);
    }];
        
//    [self.testlabel mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(10);
//        make.centerX.equalTo(self.view);
//        make.width.mas_equalTo(100);
//        make.height.mas_equalTo(100);
//    }];
 
}
- (void)changeFrame{
    
    ttt2222ViewController *tt = [[ttt2222ViewController alloc]init];
    [self.navigationController pushViewController:tt animated:YES];
    
    
//    [_test mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.left.mas_equalTo(0);
//        make.top.mas_equalTo(0);
//        make.width.mas_equalTo(200);
//        make.height.mas_equalTo(200);
//    }];
//    
//    NSArray *arr = self.testlabel.constraints;
//    
//    [self.testlabel mas_updateConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(20);
//        make.centerX.equalTo(self.view);
//        make.width.mas_equalTo(200);
//        make.height.mas_equalTo(200);
//    }];
  
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
