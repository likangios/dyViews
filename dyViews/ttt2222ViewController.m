//
//  ttt2222ViewController.m
//  dyViews
//
//  Created by FengLing on 15/12/2.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "ttt2222ViewController.h"
#import "testView.h"

@interface ttt2222ViewController ()
@property (strong, nonatomic)  testView *test;

@end

@implementation ttt2222ViewController

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
        make.width.mas_equalTo(200);
        make.height.mas_equalTo(200);
    }];
    // Do any additional setup after loading the view from its nib.
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
