//
//  DefaultPhotoView.m
//  dyViews
//
//  Created by FengLing on 15/12/1.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "DefaultPhotoView.h"

@interface DefaultPhotoView ()

/**
 *  拍照 icon
 */
@property (strong, nonatomic)  UIImageView *imageviewL;
/**
 *  相册 icon
 */
@property (strong, nonatomic)  UIImageView *imageviewR;
/**
 *  拍照 title
 */
@property (strong, nonatomic)  UILabel *labelL;
/**
 *  相册 title
 */
@property (strong, nonatomic)  UILabel *labelR;


@end
@implementation DefaultPhotoView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        
        _imageviewL = [[UIImageView alloc]initWithFrame:CGRectMake(36, 30, 49, 40)];
        _imageviewL.image = [UIImage imageNamed:@"拍照"];
        
        [self addSubview:_imageviewL];
        
        _labelL = [[UILabel alloc]init];
        _labelL.text = @"拍照";
        _labelL.textAlignment = NSTextAlignmentCenter;
        _labelL.textColor = [UIColor colorWithRed:116/255.0 green:116/255.0 blue:116/255.0 alpha:1.0];
        _labelL.font = [UIFont systemFontOfSize:15];
        _labelL.bounds = CGRectMake(0, 0, 34, 21);
        _labelL.center = CGPointMake(CGRectGetMidX(_imageviewL.frame), CGRectGetMaxY(_imageviewL.frame)+12+CGRectGetHeight(_labelL.frame)/2.0);
        [self addSubview:_labelL];
        
        _imageviewR = [[UIImageView alloc]initWithFrame:CGRectMake(frame.size.width-36-49,30, 49, 40)];
        _imageviewR.image = [UIImage imageNamed:@"相册"];
        
        [self addSubview:_imageviewR];
        
        _labelR = [[UILabel alloc]init];
        _labelR.text = @"相册";
        _labelR.textAlignment = NSTextAlignmentCenter;
        _labelR.textColor = [UIColor colorWithRed:116/255.0 green:116/255.0 blue:116/255.0 alpha:1.0];
        _labelR.font = [UIFont systemFontOfSize:15];
        _labelR.bounds = CGRectMake(0, 0, 34, 21);
        _labelR.center = CGPointMake(CGRectGetMidX(_imageviewR.frame), CGRectGetMaxY(_imageviewR.frame)+12+CGRectGetHeight(_labelR.frame)/2.0);
        [self addSubview:_labelR];
        
        
    }
    return self;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
