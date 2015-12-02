//
//  ImagesRequireView.m
//  dyViews
//
//  Created by FengLing on 15/12/1.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "ImagesRequireView.h"

@interface ImagesRequireView ()

@end

@implementation ImagesRequireView

-(instancetype)initWithFrame:(CGRect)frame{
    self=  [super initWithFrame:frame];
    if (self) {
        /*
        _titleLabel = [[UILabel alloc]init];
        _titleLabel.textAlignment = NSTextAlignmentLeft;
        _titleLabel.textColor = [UIColor colorWithRed:0 green:0 blue:0 alpha:0.54];
        _titleLabel.font = [UIFont systemFontOfSize:12];
        _titleLabel.text = @"上传照片要求：";
        [self addSubview:_titleLabel];
        
        [_titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.mas_equalTo(0);
            make.height.mas_equalTo(20);
        }];
        
        _requireDetailLabel = [[UILabel alloc]init];
        _requireDetailLabel.textAlignment = NSTextAlignmentLeft;
        _requireDetailLabel.font = [UIFont systemFontOfSize:12];
        _requireDetailLabel.textColor =[UIColor colorWithRed:0 green:0 blue:0 alpha:0.54];
        _requireDetailLabel.numberOfLines = 0;
        NSString *string = ImagesRequire;
        [self addSubview:_requireDetailLabel];
        
        [_requireDetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
            make.top.equalTo(_titleLabel.mas_bottom).with.offset(12);
            make.height.mas_equalTo(65);
        }];
        
        NSMutableParagraphStyle *paragstyle = [[NSMutableParagraphStyle alloc]init];
        [paragstyle setLineSpacing:3];//调整行间距
        NSMutableAttributedString *attstr = [[NSMutableAttributedString alloc]initWithString:string];
        [attstr addAttribute:NSParagraphStyleAttributeName value:paragstyle range:NSMakeRange(0, string.length)];
        _requireDetailLabel.attributedText = attstr;
     */
    }
    return self;
}
- (void)drawRect:(CGRect)rect{
    [super drawRect:rect];
    NSString *string = ImagesRequire;
    NSMutableParagraphStyle *paragstyle = [[NSMutableParagraphStyle alloc]init];
    [paragstyle setLineSpacing:3];//调整行间距
    NSMutableAttributedString *attstr = [[NSMutableAttributedString alloc]initWithString:string];
    [attstr addAttribute:NSParagraphStyleAttributeName value:paragstyle range:NSMakeRange(0, string.length)];
    _requireDetailLabel.attributedText = attstr;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
