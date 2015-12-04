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
/**
 *  随机生成字符串 包括数字  字母 区分大小写
 *
 *  @param len 字符串长度
 *
 *  @return 字符串
 */
+(NSString *) randomStringWithLength: (int) len;
/**
 *  图片存到本地返回 url
 *
 *  @param origin_upload_image 图片
 *
 *  @return 图片 fileURL   file:///User/....
 */
+(NSURL *) createTempImageUploadFile:(UIImage *) origin_upload_image;
/**
 *  计算文件大小
 *
 *  @param path 文件路径
 *
 *  @return 文件大小 M单位
 */
+(float)fileSizeAtPath:(NSString *)path;
/**
 *  文件夹 大小
 *
 *  @param path 文件夹路径
 *
 *  @return 文件夹大小 M单位
 */
+(float)folderSizeAtPath:(NSString *)path;
/**
 *  清楚缓存
 *
 *  @param path 缓存路径
 */
+(void)clearCache:(NSString *)path;
/**
 *  清楚Temp缓存
 */
+(void)clearTempCache;
@end
