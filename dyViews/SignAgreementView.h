//
//  SignAgreementView.h
//  dyViews
//
//  Created by FengLing on 15/12/3.
//  Copyright © 2015年 lk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SignAgreementView : UIView
/**
 *  大宗商品
 */
@property (weak, nonatomic) IBOutlet UIButton *DZBtn;
/**
 *  普洱茶
 */
@property (weak, nonatomic) IBOutlet UIButton *PEBtn;
/**
 *  会员单位
 */
@property (weak, nonatomic) IBOutlet UITextField *VipUnit;
/**
 *  姓名
 */
@property (weak, nonatomic) IBOutlet UITextField *NickName;
/**
 *  身份证
 */
@property (weak, nonatomic) IBOutlet UITextField *IdCard;
/**
 *  下一步
 */
@property (weak, nonatomic) IBOutlet UIButton *NextBtn;

@end
