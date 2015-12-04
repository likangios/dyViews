//
//  Unity.m
//  dyViews
//
//  Created by FengLing on 15/12/3.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "Unity.h"

@implementation Unity

NSString *letters = @"abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789";

+(NSString *) randomStringWithLength: (int) len {
    
    NSMutableString *randomString = [NSMutableString stringWithCapacity: len];
    for (int i=0; i<len; i++) {
        [randomString appendFormat: @"%C", [letters characterAtIndex: arc4random_uniform([letters length])]];
    }
    
    return randomString;
}
+ (UIImage *)imageWithColor:(UIColor *)color andSize:(CGSize)size
{
    UIImage *img = nil;
    
    CGRect rect = CGRectMake(0, 0, size.width, size.height);
    UIGraphicsBeginImageContext(rect.size);
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetFillColorWithColor(context,
                                   color.CGColor);
    CGContextFillRect(context, rect);
    
    img = UIGraphicsGetImageFromCurrentImageContext();
    
    UIGraphicsEndImageContext();
    
    
    return img;
}
+(NSURL *) createTempImageUploadFile:(UIImage *) origin_upload_image
{
    NSURL *uploadFilePath = nil;
    
    NSString * random_string = [Unity randomStringWithLength:10];
    NSString * strFilePath = [NSTemporaryDirectory() stringByAppendingPathComponent:
                              [NSString stringWithFormat: @"%@_%.0f.%@", random_string ,
                               [NSDate timeIntervalSinceReferenceDate] ,
                               @"jpg"]];
    
    if( [[NSFileManager defaultManager] fileExistsAtPath:strFilePath isDirectory:nil] )
    {
        [[NSFileManager defaultManager] removeItemAtPath:strFilePath error:nil];
    }
    
    NSData * binaryImageData = UIImageJPEGRepresentation(origin_upload_image , 0.7f);
    if( ![binaryImageData writeToFile:strFilePath atomically:YES] )
        return nil;
    uploadFilePath = [NSURL fileURLWithPath:strFilePath];
    
    return uploadFilePath;
}
/**
 *  计算文件大小
 *
 *  @param path 文件路径
 *
 *  @return 文件大小 M单位
 */
+(float)fileSizeAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if([fileManager fileExistsAtPath:path]){
        long long size=[fileManager attributesOfItemAtPath:path error:nil].fileSize;
        return size/1024.0/1024.0;
    }
    return 0;
}
/**
 *  文件夹 大小
 *
 *  @param path 文件夹路径
 *
 *  @return 文件夹大小 M单位
 */
+(float)folderSizeAtPath:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    float folderSize;
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            folderSize +=[Unity fileSizeAtPath:absolutePath];
        }
//SDWebImage框架自身计算缓存的实现
//        folderSize+=[[SDImageCache sharedImageCache] getSize]/1024.0/1024.0;
        return folderSize;
    }
    return 0;
}
+(void)clearTempCache{
    
    [Unity clearCache:[NSTemporaryDirectory() description]];
    
}
/**
 *  清楚缓存
 *
 *  @param path 缓存路径
 */
+(void)clearCache:(NSString *)path{
    NSFileManager *fileManager=[NSFileManager defaultManager];
    if ([fileManager fileExistsAtPath:path]) {
        NSArray *childerFiles=[fileManager subpathsAtPath:path];
        for (NSString *fileName in childerFiles) {
            //如有需要，加入条件，过滤掉不想删除的文件
            NSString *absolutePath=[path stringByAppendingPathComponent:fileName];
            [fileManager removeItemAtPath:absolutePath error:nil];
        }
    }
//    [[SDImageCache sharedImageCache] cleanDisk];
}
@end
