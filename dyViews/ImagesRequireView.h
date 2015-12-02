//
//  ImagesRequireView.h
//  dyViews
//
//  Created by FengLing on 15/12/1.
//  Copyright © 2015年 lk. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ImagesRequireView : UIView
/**
 *  照片详细要求
 */
@property (nonatomic,weak) IBOutlet UILabel *requireDetailLabel;
/**
 * 上传照片要求：
 */
@property (nonatomic,weak) IBOutlet UILabel *titleLabel;

@end
