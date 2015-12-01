//
//  AccountProgressView.h
//  dyViews
//
//  Created by FengLing on 15/11/30.
//  Copyright © 2015年 lk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AccountProgressView : UIView
/**
 *  签署协议icon
 */
@property (strong, nonatomic)  UIImageView *step1;
/**
 *  照片上传icon
 */
@property (strong, nonatomic)  UIImageView *step2;
/**
 *  设置交易密码
 */
@property (strong, nonatomic)  UIImageView *step3;
/**
 *  签署协议title
 */
@property (strong, nonatomic)  UILabel *signAgreementLabel;
/**
 *  照片上传title
 */
@property (strong, nonatomic)  UILabel *uploadImageLabel;
/**
 *  设置交易密码title
 */
@property (strong, nonatomic)  UILabel *setPasswordLabel;

@end
