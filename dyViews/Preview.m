//
//  Preview.m
//  dyViews
//
//  Created by FengLing on 15/11/26.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "Preview.h"

@interface Preview ()<UIScrollViewDelegate>
{
    UIImageView *_preImageView;
    
    UIScrollView *_scrollView;
}

@end

@implementation Preview


- (instancetype)initWithShowView:(UIView *)view withImage:(UIImage *)image{
    CGRect  frame = view.frame;
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [UIColor blackColor];
        _scrollView = [[UIScrollView alloc]initWithFrame:frame];
        
        _scrollView.delegate = self;
        
//        _scrollView.bouncesZoom = NO;
        
//        _scrollView.bounces = NO;
        
        _scrollView.showsHorizontalScrollIndicator = NO;
        
        _scrollView.showsVerticalScrollIndicator = NO;
        
        [_scrollView setMaximumZoomScale:3.0];
        
        _scrollView.zoomScale = 1.0;
        
        [self addSubview:_scrollView];
        
        
        _preImageView = [[UIImageView alloc]init];
        
        _preImageView.backgroundColor = [UIColor clearColor];
        
        _preImageView.frame = frame;
        
        _preImageView.image = image;
        
        _preImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [_scrollView addSubview:_preImageView];
        

        UITapGestureRecognizer *tap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(removeSelf)];
        [_scrollView addGestureRecognizer:tap];
        
        
    }
    return self;
}
+ (void)showViewAt:(UIView *)showview withImage:(UIImage *)image{
    
    Preview *v = [[Preview alloc]initWithShowView:showview withImage:image];
    [showview addSubview:v];
    
}
- (void)removeSelf{
    
    [self removeFromSuperview];

}

#pragma mark UIScrollViewDelegate

- (UIView *)viewForZoomingInScrollView:(UIScrollView *)scrollView{
    
    return _preImageView;
    
}

@end
