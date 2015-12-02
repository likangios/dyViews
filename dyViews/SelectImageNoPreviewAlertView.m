//
//  SelectImageNoPreviewAlertView.m
//  dyViews
//
//  Created by FengLing on 15/12/2.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "SelectImageNoPreviewAlertView.h"

typedef void(^blocks)();

@interface SelectImageNoPreviewAlertView ()
{
    blocks _cameraBlock;
    blocks _albumBlock;
}
@end

@implementation SelectImageNoPreviewAlertView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)initWithShowView:(UIView *)view  Camera:(void(^)())camera Album:(void (^)())album{
    self = [super initWithFrame:view.frame];
    if (self) {
        _cameraBlock = camera;
        _albumBlock = album;
        
        [view addSubview:self];
        
        self.backgroundColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.2];
        CGFloat width = 292;
        
        CGFloat height = 98;
        
        UIView *v = [[UIView alloc]init];
        
        v.layer.cornerRadius = 2.0;
        v.layer.masksToBounds = YES;
        v.bounds = CGRectMake(0, 0, width,height);
        
        v.center = CGPointMake(CGRectGetWidth(view.frame)/2.0, CGRectGetHeight(view.frame)/2.0);
        
        v.backgroundColor = [UIColor whiteColor];
        
        [self addSubview:v];
        
        NSArray *arr = @[@"拍照",@"相册"];
        
        CGFloat btnW = height/arr.count;
        
        for (int i = 0; i<arr.count; i++) {
            
            UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
            btn.frame = CGRectMake(21,btnW*i, width-42, btnW);
            [btn setTitle:arr[i] forState:UIControlStateNormal];
            btn.tag = i+1;
            btn.contentHorizontalAlignment = UIControlContentHorizontalAlignmentLeft;
            [btn setTitleColor:[UIColor colorWithRed:0 green:0 blue:0 alpha:0.87] forState:UIControlStateNormal];
            [btn addTarget:self action:@selector(btnClick:) forControlEvents:UIControlEventTouchUpInside];
            [v addSubview:btn];
            if (i>0) {
                UIView *l = [[UIView alloc]initWithFrame:CGRectMake(0,i*btnW, width, 0.5)];
                l.backgroundColor = [UIColor grayColor];
                [v addSubview:l];
            }
        }
        
        
    }
    return self;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self hideself];
}
- (void)btnClick:(UIButton *)btn{
    switch (btn.tag) {
        case 1:
        {
            NSLog(@"拍照");
            if (_cameraBlock) {
                _cameraBlock();
            }
        }
            break;
        case 2:
        {
            NSLog(@"相册");
            if (_albumBlock) {
                _albumBlock();
            }
        }
            break;
        default:
            break;
    }
    [self hideself];
}
- (void)hideself{
    
    [self removeFromSuperview];
}
+ (void)showViewAt:(UIView *)showview Camera:(void(^)())camera Album:(void (^)())album{
    SelectImageNoPreviewAlertView *v = [[SelectImageNoPreviewAlertView alloc]initWithShowView:showview  Camera:camera Album:album];
    [showview addSubview:v];
}
@end
