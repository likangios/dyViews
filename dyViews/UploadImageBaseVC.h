//
//  UploadImageBaseVC.h
//  dyViews
//
//  Created by FengLing on 15/12/3.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "ViewController.h"
#import "AccountProgressView.h"
#import "DefaultPhotoView.h"
#import "ImagesRequireView.h"
#import "SelectImageAlertView.h"
#import "SelectImageNoPreviewAlertView.h"
#import "CustomUIImagePickerVC.h"
#import "Preview.h"

@interface UploadImageBaseVC : ViewController
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
 *  初始化没有选择照片时的view
 */
@property (strong, nonatomic)  DefaultPhotoView *DefaultView;
/**
 *  仅需上传身份证。。。
 */
@property (strong, nonatomic)  UILabel *detailLabel;
/**
 *  下一张
 */
@property (strong, nonatomic)  UIButton *NextBtn;
/**
 *  图片需求
 */
@property (strong, nonatomic)  ImagesRequireView *requireView;
/**
 *  请使用二代。。。
 */
@property (strong, nonatomic)  UILabel *TitleLabel;

/**
 *  UI更新
 */
- (void)updateUI;
/**
 *  下一张
 *
 *  @param sender 
 */
- (void)NextBtnClick:(id)sender;

@end
