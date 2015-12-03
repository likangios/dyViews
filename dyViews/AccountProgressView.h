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
@property (weak, nonatomic) IBOutlet UIImageView *step1;
/**
 *  照片上传icon
 */
@property (strong, nonatomic) IBOutlet UIImageView *step2;
/**
 *  设置交易密码
 */
@property (strong, nonatomic) IBOutlet UIImageView *step3;
/**
 *  签署协议title
 */
@property (strong, nonatomic) IBOutlet UILabel *signAgreementLabel;
/**
 *  照片上传title
 */
@property (strong, nonatomic) IBOutlet UILabel *uploadImageLabel;
/**
 *  设置交易密码title
 */
@property (strong, nonatomic) IBOutlet UILabel *setPasswordLabel;
/**
 *  设置当前进度 0 没开始 1 签署协议 2 照片上传 3 设置交易密码 other 完成 默认2
 *
 *  @param step 
 */
- (void)setCurrentStep:(NSInteger)step;
@end
