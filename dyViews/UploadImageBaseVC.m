//
//  UploadImageBaseVC.m
//  dyViews
//
//  Created by FengLing on 15/12/3.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "UploadImageBaseVC.h"


@interface UploadImageBaseVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>

@end

@implementation UploadImageBaseVC

- (void)viewDidLoad {
    [super viewDidLoad];
    [self creatView];
    [self setConstraints];
}

#pragma mark Views
- (void)creatView{
    
    _accountProgressView =[[[NSBundle mainBundle]loadNibNamed:@"AccountProgressView" owner:self options:nil]lastObject];
    [self.view addSubview:_accountProgressView];
    
    _requireView = [[[NSBundle mainBundle]loadNibNamed:@"ImagesRequireView" owner:self options:nil]lastObject];
    
    [self.view addSubview:_requireView];
    
    _DefaultView = [[[NSBundle mainBundle]loadNibNamed:@"DefaultPhotoView" owner:self options:nil]lastObject];
    UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(TapClick)];
    [_DefaultView addGestureRecognizer:tap];
    [self.view addSubview:_DefaultView];
    
    _TitleLabel = [[UILabel alloc]init];
    _TitleLabel.font = [UIFont systemFontOfSize:16];
    _TitleLabel.text = @"请使用二代身份证且在有效期内";
    _TitleLabel.textAlignment = NSTextAlignmentCenter;
    _TitleLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.87];
    [self.view addSubview:_TitleLabel];
    
    _detailLabel = [[UILabel alloc]init];
    _detailLabel.font = [UIFont systemFontOfSize:12];
    _detailLabel.text = @"仅需上传身份证正反面照片及手持确认书照片";
    _detailLabel.textAlignment = NSTextAlignmentCenter;
    _detailLabel.textColor = [UIColor colorWithRed:152/255.0 green:152/255.0 blue:152/255.0 alpha:1.0];
    [self.view addSubview:_detailLabel];
    
    _NextBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    _NextBtn.backgroundColor = [UIColor colorWithRed:252/255.0 green:210/255.0 blue:68/255.0 alpha:1.0];
    [_NextBtn setTitle:@"下一张" forState:UIControlStateNormal];
    [_NextBtn setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.87] forState:UIControlStateNormal];
    _NextBtn.titleLabel.font = [UIFont systemFontOfSize:17];
    [_NextBtn addTarget:self action:@selector(NextBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    _NextBtn.hidden=  YES;
    [self.view addSubview:_NextBtn];
    
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
    //    请使用。。。
    [self.TitleLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.left.and.right.mas_equalTo(0);
        make.height.mas_equalTo(21);
        make.top.equalTo(ws.accountProgressView.mas_bottom).with.offset(12);
    }];
    
    //     灰底
    [self.DefaultView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(262);
        if(self.NextBtn.hidden){
            make.height.mas_equalTo(134);
        }else{
            make.height.mas_equalTo(165);
        }
        make.centerX.equalTo(ws.view);
        make.top.equalTo(ws.TitleLabel.mas_bottom).with.offset(12);
    }];
    //    detailLabel
    [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(ws.view);
        make.top.equalTo(ws.DefaultView.mas_bottom).with.offset(8);
        make.height.mas_equalTo(@21);
    }];
    //    下一张
    [self.NextBtn mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.mas_equalTo(ws.view.mas_centerX);
        make.left.equalTo(ws.view.mas_left).with.offset(10);
        make.right.equalTo(ws.view.mas_right).with.offset(-10);
        make.top.equalTo(ws.detailLabel.mas_bottom).with.offset(28);
        make.height.mas_equalTo(@45);
    }];
    //    图片要求
    [_requireView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.centerX.equalTo(ws.view);
        make.width.mas_equalTo(265);
        make.height.mas_equalTo(100);
        if (self.NextBtn.hidden) {
            make.top.equalTo(ws.detailLabel.mas_bottom).with.offset(35);
        }else{
            make.top.equalTo(ws.NextBtn.mas_bottom).with.offset(18);
        }
    }];
}
#pragma mark action
/**
 *  图片点击
 *
 *  @param sender
 */
- (void)TapClick {
    NSLog(@"tap");
    if (_needUploadImage){
        [SelectImageAlertView showViewAt:self.view.window Preview:^{
            NSLog(@"预览");
            [Preview showViewAt:self.view.window withImage:_needUploadImage];
        } Camera:^{
            [self takePhoto];
            NSLog(@"拍照");
        } Album:^{
            [self selectPhoto];
            NSLog(@"相册");
        }];}
    else{
        [SelectImageNoPreviewAlertView showViewAt:self.view.window Camera:^{
            [self takePhoto];
            NSLog(@"拍照");
        } Album:^{
            [self selectPhoto];
            NSLog(@"相册");
        }];
    }
}
- (void)takePhoto{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
        [self.navigationController presentViewController:self.imagePicker animated:YES completion:NULL];
    }else{
        NSLog(@"拍照不可用");
    }
    
}
- (void)selectPhoto{
    if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]) {
        self.imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
        [self.navigationController presentViewController:self.imagePicker animated:YES completion:NULL];
    }else{
        NSLog(@"相册不可用");
    }
}
/**
 *  下一张
 *
 *  @param sender
 */
#pragma mark 下一张

- (void)NextBtnClick:(id)sender {
    NSLog(@"下一步");
}
#pragma mark method

- (void)updateConstraint{
    [self updateUI];
    [self setConstraints];
}
/**
 *  选择照片后更新UI
 */
- (void)updateUI{
    self.accountProgressView.uploadImageLabel.text = @"照片上传(1/3)";
    self.TitleLabel.text = @"二代身份证正面照";
    self.DefaultView.PhotoImageView.image =self.needUploadImage;
    self.DefaultView.DefaultView.hidden = YES;
    self.NextBtn.hidden = NO;
}
#pragma mark ----
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
#pragma mark getter
- (UIImagePickerController *)imagePicker{
    if (!_imagePicker) {
        _imagePicker = [[CustomUIImagePickerVC alloc]init];
        _imagePicker.delegate = self;
    }
    return _imagePicker;
}
#pragma mark UIImagePickerDelegate
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<NSString *,id> *)info{
    UIImage *image = (UIImage *)[info objectForKey:UIImagePickerControllerEditedImage];
    _needUploadImage = image;
    [self updateConstraint];
    [self dismissViewControllerAnimated:YES completion:NULL];
    
    
}
- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
    [self dismissViewControllerAnimated:YES completion:NULL];
    NSLog(@"cancel");
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
