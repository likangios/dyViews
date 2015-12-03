//
//  Unity.h
//  dyViews
//
//  Created by FengLing on 15/12/3.
//  Copyright © 2015年 lk. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "UIView+loadNib.h"


@interface Unity : NSObject
/**
 *  根据颜色 生成图片
 *
 *  @param color 颜色
 *  @param size  图片大小
 *
 *  @return 图片
 */
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size;

@end
