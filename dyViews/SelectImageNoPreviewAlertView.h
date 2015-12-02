//
//  SelectImageNoPreviewAlertView.h
//  dyViews
//
//  Created by FengLing on 15/12/2.
//  Copyright © 2015年 lk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SelectImageNoPreviewAlertView : UIView
/**
 *  预览 拍照 相册 AlertView
 *
 *  @param showview 要显示在的view
 *  @param priview  预览回调
 *  @param camera   拍照回调
 *  @param album    相册回调
 */
+ (void)showViewAt:(UIView *)showview Camera:(void(^)())camera Album:(void (^)())album;
@end
