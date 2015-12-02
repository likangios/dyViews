//
//  UploadImageFirstVC.m
//  dyViews
//
//  Created by FengLing on 15/11/30.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "UploadImageFirstVC.h"
#import "UploadImageSecondVC.h"

#import "AccountProgressView.h"
#import "DefaultPhotoView.h"
#import "ImagesRequireView.h"
#import "SelectImageAlertView.h"
#import "SelectImageNoPreviewAlertView.h"
#import "CustomUIImagePickerVC.h"
#import "Preview.h"

@interface UploadImageFirstVC ()<UIImagePickerControllerDelegate,UINavigationControllerDelegate>
/**
 *  要上传的图片
 */
@property (nonatomic,strong) UIImage *needUploadImage;
/**
 *  拍照 图片
 */
@property(nonatomic,strong) UIImagePickerController *imagePicker;
/**
 *  开户进度
 */
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

- (void)viewDidLoad {
    [super viewDidLoad];
    self.NextBtn.hidden=  YES;
    [self creatView];
    [self setConstraints];
}

#pragma mark Views
- (void)creatView{
    _accountProgressView = [[AccountProgressView alloc]init];
    [self.view addSubview:_accountProgressView];
    _requireView = [[ImagesRequireView alloc]init];
    [self.view addSubview:_requireView];
    _DefaultView = [[DefaultPhotoView alloc]init];
    [self.grayView addSubview:_DefaultView];
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
    [self.grayView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.mas_equalTo(262);
        if(self.NextBtn.hidden){
            make.height.mas_equalTo(134);
        }else{
            make.height.mas_equalTo(165);
        }
        make.centerX.equalTo(ws.view);
        make.top.equalTo(ws.TitleLabel.mas_bottom).with.offset(12);
    }];
    //    图片imageView
    [self.PhotoImageView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.edges.equalTo(ws.grayView).with.insets(UIEdgeInsetsMake(0, 0, 0, 0));
    }];
//    默认图片
    [_DefaultView mas_updateConstraints:^(MASConstraintMaker *make) {
        make.size.equalTo(ws.grayView);
        make.center.equalTo(ws.grayView);
    }];
//    detailLabel
    [self.detailLabel mas_updateConstraints:^(MASConstraintMaker *make) {
        make.width.equalTo(ws.view);
        make.top.equalTo(ws.grayView.mas_bottom).with.offset(8);
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
        make.width.mas_equalTo(300);
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
- (IBAction)TapClick:(id)sender {
    NSLog(@"tap");
    if (_PhotoImageView.image){
        [SelectImageAlertView showViewAt:self.view.window Preview:^{
            NSLog(@"预览");
            [Preview showViewAt:self.view.window withImage:_PhotoImageView.image];
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

- (IBAction)NextBtnClick:(id)sender {
    NSLog(@"下一步");
    
    [self.navigationController pushViewController:[[UploadImageSecondVC alloc]initWithNibName:@"UploadImageSecondVC" bundle:nil] animated:YES];
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
    self.PhotoImageView.image =self.needUploadImage;
    self.DefaultView.hidden = YES;
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
