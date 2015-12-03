//
//  UIView+loadNib.m
//  dyViews
//
//  Created by FengLing on 15/12/3.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "UIView+loadNib.h"

@implementation UIView (loadNib)

+(id)loadSelfWithNibOwner:(UIViewController *)owner{

    NSString *string =  NSStringFromClass([self class]);
    id  obj = [[[NSBundle mainBundle]loadNibNamed:string owner:owner options:nil]lastObject];
    return obj;
}
@end
