//
//  UploadImageFirstVC.m
//  dyViews
//
//  Created by FengLing on 15/11/30.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "UploadImageFirstVC.h"
#import "AccountProgressView.h"
#import "DefaultPhotoView.h"
#import "ImagesRequireView.h"


@interface UploadImageFirstVC ()

@property (nonatomic,strong)  AccountProgressView *accountProgressView;
/**
 *  灰低view承载 photoView DefaultView
 */
@property (weak, nonatomic) IBOutlet UIView *grayView;
/**
 *  用来显示照片的ImageView
 */
@property (weak, nonatomic) IBOutlet UIImageView *PhotoImageView;
/**
 *  初始化没有选择照片时的view
 */
@property (strong, nonatomic)  DefaultPhotoView *DefaultView;
/**
 *  仅需上传身份证。。。
 */
@property (weak, nonatomic) IBOutlet UILabel *detailLabel;
/**
 *  下一张
 */
@property (weak, nonatomic) IBOutlet UIButton *NextBtn;
/**
 *  图片需求
 */
@property (strong, nonatomic)  ImagesRequireView *requireView;
/**
 *  请使用二代。。。
 */
@property (weak, nonatomic) IBOutlet UILabel *TitleLabel;

@end

#define WS(weakSelf)  __weak __typeof(&*self)weakSelf=self

@implementation UploadImageFirstVC

- (IBAction)NextBtnClick:(id)sender {
    NSLog(@"下一步");
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setConstraints];
}
- (void)setConstraints{
    WS(ws);
    
    self.NextBtn.hidden=  YES;
    
    _accountProgressView = [[AccountProgressView alloc]initWithFrame:CGRectMake(0, 0, ScreenWidth, 65)];
    [self.view addSubview:_accountProgressView];
    
    [self.TitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_equalTo(0);
        make.right.mas_equalTo(0);
        make.height.mas_equalTo(21);
        make.top.equalTo(ws.accountProgressView.mas_bottom).with.offset(12);
    }];
    
    //灰底
    [self.grayView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(262);
        make.height.mas_equalTo(134);
        make.centerX.equalTo(ws.view);
        make.top.equalTo(ws.TitleLabel.mas_bottom).with.offset(12);
    }];
    _DefaultView = [[DefaultPhotoView alloc]initWithFrame:self.grayView.bounds];
    [self.grayView addSubview:_DefaultView];
    
    //    图片imageView
    [self.PhotoImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.grayView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
    //    detailLabel
    [self.detailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(ws.view);
        make.top.equalTo(ws.grayView.mas_bottom).with.offset(8);
        make.height.mas_equalTo(@21);
    }];
//    下一张
    [self.NextBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view.mas_centerX);
        make.left.equalTo(ws.view.mas_left).with.offset(10);
        make.right.equalTo(ws.view.mas_right).with.offset(-10);
        make.top.equalTo(ws.detailLabel.mas_bottom).with.offset(28);
        make.height.mas_equalTo(@45);
    }];
    //    图片要求
    _requireView = [[ImagesRequireView alloc]initWithFrame:CGRectMake(0, 0, 300, 100)];
    [self.view addSubview:_requireView];
    
    if (self.NextBtn.hidden) {
        _requireView.center = CGPointMake(ScreenWidth/2.0, CGRectGetMaxY(self.detailLabel.frame)+35+CGRectGetHeight(_requireView.frame)/2.0);
    }else{
        _requireView.center = CGPointMake(ScreenWidth/2.0, CGRectGetMaxY(self.NextBtn.frame)+18+CGRectGetHeight(_requireView.frame)/2.0);
    }
    
}
#pragma mark action
- (IBAction)TapClick:(id)sender {
    NSLog(@"tap");
    [self updateConstraint];
}
- (void)updateConstraint{
    self.DefaultView.hidden = YES;
    self.NextBtn.hidden = NO;
    
    
    WS(ws);
    
    [self.grayView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(ws.TitleLabel.mas_bottom).with.offset(12);
        make.height.mas_equalTo(@165);
        make.bottom.equalTo(ws.detailLabel.mas_top).with.offset(-12);
    }];
    
    [self.NextBtn layoutIfNeeded];
    
    //    图片要求
    if (self.NextBtn.hidden) {
        _requireView.center = CGPointMake(ScreenWidth/2.0, CGRectGetMaxY(self.detailLabel.frame)+35+CGRectGetHeight(_requireView.frame)/2.0);
    }else{
        _requireView.center = CGPointMake(ScreenWidth/2.0, CGRectGetMaxY(self.NextBtn.frame)+18+CGRectGetHeight(_requireView.frame)/2.0);
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
