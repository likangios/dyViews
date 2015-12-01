//
//  ImageUploadSuccessAlertView.h
//  dyViews
//
//  Created by FengLing on 15/11/26.
//  Copyright © 2015年 lk. All rights reserved.
//

#import <UIKit/UIKit.h>

/**
 *  上传图片成功AlertView
 */
@interface ImageUploadSuccessAlertView : UIView

/**
 *  +方法 显示上传成功图片
 *
 *  @param showview 要显示的view
 */
+ (void)showViewAt:(UIView *)showview;

@end


@interface UIColor (HelpMe)
+ (UIColor*)colorWithHexa:(NSUInteger)hexa alpha:(CGFloat) alpha;
+ (UIColor*)colorWithHexa:(NSUInteger)hexa;
@end
