//
//  VipUnitListVC.h
//  dyViews
//
//  Created by FengLing on 15/12/3.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "ViewController.h"

typedef void(^vipUnitNicknamBlocks)(NSString *nickName);

@interface VipUnitListVC : ViewController
@property (nonatomic,copy) vipUnitNicknamBlocks  block ;
@end
