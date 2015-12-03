//
//  AccountProgressView.m
//  dyViews
//
//  Created by FengLing on 15/11/30.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "AccountProgressView.h"

@interface AccountProgressView ()



@end

@implementation AccountProgressView

- (instancetype)initWithFrame:(CGRect)frame{
    self = [super initWithFrame:frame];
    if (self) {
        /*
        self.backgroundColor = [UIColor colorWithRed:237/255.0 green:237/255.0 blue:237/255.0 alpha:1.0];
        
        NSArray *images = @[@"进度条细s1",@"进度条细s2.png",@"进度条细s3"];
        NSArray *titles = @[@"签署协议",@"照片上传",@"设置交易密码",];
//        起始位置
        for (int i = 0; i<3; i++) {
            UIImageView *imageView = [[UIImageView alloc]init];
            imageView.image = [UIImage imageNamed:images[i]];
            UILabel *label = [[UILabel alloc]init];
            label.text = titles[i];
            label.font  =[UIFont systemFontOfSize:15];
            label.textAlignment = NSTextAlignmentCenter;
            label.textColor = [UIColor colorWithRed:250/255.0 green:91/255.0 blue:82/255.0 alpha:1.0];
            [self addSubview:imageView];
            [self addSubview:label];
            [imageView mas_makeConstraints:^(MASConstraintMaker *make) {
                make.width.mas_equalTo(100);
                make.height.mas_equalTo(9);
                make.left.equalTo(self.mas_centerX).with.offset(-150+i*100);
                make.top.mas_equalTo(40);
            }];
            [label mas_makeConstraints:^(MASConstraintMaker *make) {
                make.centerX.mas_equalTo(imageView);
                make.top.mas_equalTo(14);
                make.width.mas_equalTo(100);
                make.height.mas_equalTo(18);
            }];
            
            switch (i) {
                case 0:{
                    _step1 = imageView;
                    _signAgreementLabel = label;
                }
                    break;
                case 1:
                    _step2 = imageView;
                    _uploadImageLabel = label;
                    break;
                case 2:
                    label.textColor = [UIColor grayColor];
                    _step3 = imageView;
                    _setPasswordLabel = label;
                    break;
                default:
                    break;
            }
        }
         */
        
        
    }
    return self;
}
- (void)setCurrentStep:(NSInteger)step{
    
    
   UIColor *redColor = [UIColor colorWithRed:250/255.0 green:91/255.0 blue:82/255.0 alpha:1.0];
    
    UIColor *grayColor = [UIColor grayColor];
    
//    完成icon
    UIImage *image1 = [UIImage imageNamed:@"进度条细s1"];
//    进行中icon
    UIImage *image2 = [UIImage imageNamed:@"进度条细s2"];
//    没开始icon
    UIImage *image3 = [UIImage imageNamed:@"进度条细s3"];
    
    switch (step) {
        case 0:
        {
            _signAgreementLabel.textColor = grayColor;
            _step1.image = image3;
            _uploadImageLabel.textColor = grayColor;
            _step2.image = image3;
            _setPasswordLabel.textColor = grayColor;
            _step3.image = image3;
        }
            break;
        case 1:
        {
            _signAgreementLabel.textColor = redColor;
            _step1.image = image2;
            _uploadImageLabel.textColor = grayColor;
            _step2.image = image3;
            _setPasswordLabel.textColor = grayColor;
            _step3.image = image3;
        }
            break;
        case 2:
        {
            _signAgreementLabel.textColor = redColor;
            _step1.image = image1;
            _uploadImageLabel.textColor = redColor;
            _step2.image = image2;
            _setPasswordLabel.textColor = grayColor;
            _step3.image = image3;
            
        }
            break;
        case 3:
        {
            _signAgreementLabel.textColor = redColor;
            _step1.image = image1;
            _uploadImageLabel.textColor = redColor;
            _step2.image = image1;
            _setPasswordLabel.textColor = redColor;
            _step3.image = image2;
        }
            break;
        default:
        {
            _signAgreementLabel.textColor = redColor;
            _step1.image = image1;
            _uploadImageLabel.textColor = redColor;
            _step2.image = image1;
            _setPasswordLabel.textColor = redColor;
            _step3.image = image1;
        }
            break;
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
