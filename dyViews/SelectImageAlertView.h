//
//  SelectImageAlertView.h
//  dyViews
//
//  Created by FengLing on 15/11/26.
//  Copyright © 2015年 lk. All rights reserved.
//

#import <UIKit/UIKit.h>


/**
 *  预览 拍照 相册
 */
@interface SelectImageAlertView : UIView

/**
 *  预览 拍照 相册 AlertView
 *
 *  @param showview 要显示在的view
 *  @param priview  预览回调
 *  @param camera   拍照回调
 *  @param album    相册回调
 */
+ (void)showViewAt:(UIView *)showview Preview:(void(^)())priview Camera:(void(^)())camera Album:(void (^)())album;

@end
