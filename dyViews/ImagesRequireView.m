//
//  ImagesRequireView.m
//  dyViews
//
//  Created by FengLing on 15/12/1.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "ImagesRequireView.h"

@interface ImagesRequireView ()
{
//    上传照片要求：
    UILabel *_titleLabel;
//      照片详细要求
    UILabel *_requireDetailLabel;
}
@end

@implementation ImagesRequireView

-(instancetype)initWithFrame:(CGRect)frame{
    self=  [super initWithFrame:frame];
    if (self) {
        _titleLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, frame.size.width,20)];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.54];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"上传照片要求：";
        [self addSubview:_titleLabel];
        
        _requireDetailLabel = [[UILabel alloc]initWithFrame:CGRectMake(0, CGRectGetMaxY(_titleLabel.frame)+12, frame.size.width, 65)];
        _requireDetailLabel.textAlignment = NSTextAlignmentLeft;
        _requireDetailLabel.font = [UIFont systemFontOfSize:12];
        _requireDetailLabel.textColor =[UIColor colorWithRed:0 green:0 blue:0 alpha:0.54];
        _requireDetailLabel.numberOfLines = 0;
        NSString *string = ImagesRequire;
        [self addSubview:_requireDetailLabel];
        
        NSMutableParagraphStyle *paragstyle = [[NSMutableParagraphStyle alloc]init];
        [paragstyle setLineSpacing:3];//调整行间距
        NSMutableAttributedString *attstr = [[NSMutableAttributedString alloc]initWithString:string];
        [attstr addAttribute:NSParagraphStyleAttributeName value:paragstyle range:NSMakeRange(0, string.length)];
        _requireDetailLabel.attributedText = attstr;
        
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
