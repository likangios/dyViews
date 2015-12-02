//
//  ImageUploadSuccessAlertView.m
//  dyViews
//
//  Created by FengLing on 15/11/26.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "ImageUploadSuccessAlertView.h"
#import "UIColor+HelpMe.h"

typedef void(^blocks)();

@interface ImageUploadSuccessAlertView ()
{
    blocks _ok;
}

@end
@implementation ImageUploadSuccessAlertView

- (instancetype)initWithShowView:(UIView *)view OK:(void(^)())ok{
    self = [super initWithFrame:view.frame];
    if (self) {
        _ok = ok;
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        CGFloat width = 292;
        
        CGFloat height = 154;
        
        UIView *v = [[UIView alloc]init];
        
        v.layer.cornerRadius = 2.0;
        v.layer.masksToBounds = YES;
        v.bounds = CGRectMake(0, 0, width,height);
        
        v.center = CGPointMake(CGRectGetWidth(view.frame)/2.0, CGRectGetHeight(view.frame)/2.0);
        
        v.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:v];
        
        UIImageView *imageview = [[UIImageView alloc]initWithFrame:CGRectMake(21, 18, 28, 28)];
        imageview.image = [UIImage imageNamed:@"ok(tanchuan)_"];
        [v addSubview:imageview];
        
        CGFloat labelW =width-21-CGRectGetMaxX(imageview.frame)-12;
        
        UILabel *text = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMaxX(imageview.frame)+12, CGRectGetMinY(imageview.frame), labelW,20)];
        text.textAlignment = NSTextAlignmentLeft;
        text.text = @"照片上传成功";
        text.font  =[UIFont systemFontOfSize:18];
        text.textColor = [UIColor colorWithHexa:0 alpha:0.87];
        [v addSubview:text];
        
        UILabel *detail = [[UILabel alloc]initWithFrame:CGRectMake(CGRectGetMinX(text.frame), CGRectGetMaxY(text.frame)+16, labelW, 40)];
        detail.text = @"恭喜您！照片上传完成，我们会尽快对您的资料予以审核。";
        detail.textColor = [UIColor colorWithHexa:0 alpha:0.87];
        detail.numberOfLines = 2;
        detail.textAlignment=  NSTextAlignmentLeft;
        detail.font = [UIFont systemFontOfSize:15];
        [v addSubview:detail];
        
        UIView *l = [[UIView alloc]initWithFrame:CGRectMake(0,height-49, width, 0.5)];
        l.backgroundColor = [UIColor grayColor];
        [v addSubview:l];
        
        UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
        [btn setTitleColor:[UIColor colorWithHexa:0xfe4a3d] forState:UIControlStateNormal];
        [btn setTitle:@"确认" forState:UIControlStateNormal];
        btn.frame = CGRectMake(0, CGRectGetMaxY(l.frame), width, 49);
        [btn addTarget:self action:@selector(ok) forControlEvents:UIControlEventTouchUpInside];
        [v addSubview:btn];
    }
    return self;
}
- (void)ok{
    if (_ok) {
        _ok();
    }
    [self removeFromSuperview];
}
+ (void)showViewAt:(UIView *)showview ok:(void (^)())ok{
    
  ImageUploadSuccessAlertView *v = [[ImageUploadSuccessAlertView alloc]initWithShowView:showview OK:ok];
    
    [showview addSubview:v];

    
}
@end
@implementation UIColor (HelpMe)

+ (UIColor*)colorWithHexa:(NSUInteger)hexa alpha:(CGFloat) alpha
{
    return [UIColor colorWithRed:((float)((hexa & 0xFF0000) >> 16)) / 255.0
                           green:((float)((hexa & 0xFF00) >> 8)) / 255.0
                            blue:((float)((hexa & 0xFF))) / 255.0
                           alpha:alpha];
}

+ (UIColor*)colorWithHexa:(NSUInteger)hexa
{
    return [self colorWithHexa:hexa alpha:1.0];
}

@end
