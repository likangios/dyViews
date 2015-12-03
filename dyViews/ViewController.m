//
//  ViewController.m
//  dyViews
//
//  Created by FengLing on 15/11/26.
//  Copyright © 2015年 lk. All rights reserved.
//

#import "ViewController.h"
#import "ImageUploadSuccessAlertView.h"
#import "SelectImageAlertView.h"
#import "Preview.h"
@interface ViewController ()
{
    Preview *_pv;
}
@property (nonatomic,strong) UIImage *defauImage;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if ([self respondsToSelector:@selector(setEdgesForExtendedLayout:)]) {
        
        self.edgesForExtendedLayout =UIRectEdgeNone;
    }
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:253/255.0 green:223/255.0 blue:98/255.0 alpha:1.0];

    self.navigationController.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName:[UIColor blackColor]};
    
    self.navigationController.navigationBar.tintColor = [UIColor blackColor];
    self.navigationController.navigationBar.shadowImage = [UIImage imageNamed:@"2"];    
    
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    _defauImage = [UIImage imageNamed:@"2"];
    
    // Do any additional setup after loading the view, typically from a nib.
}
- (void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event {
    [super touchesEnded:touches withEvent:event];
    BOOL hasResigned = [ViewController resignAnyFirstResponder:self.view];
    
}

+ (BOOL)resignAnyFirstResponder:(UIView *)view
{
    BOOL hasResigned = NO;
    for (UIView *subView in view.subviews) {
        if ([subView isFirstResponder]) {
            [subView resignFirstResponder];
            hasResigned = YES;
            if ([subView isKindOfClass:[UISearchBar class]]) {
                [(UISearchBar *)subView setShowsCancelButton:NO animated:YES];
            }
            break;
        }
        else {
            hasResigned = [ViewController resignAnyFirstResponder:subView] || hasResigned;
        }
    }
    return hasResigned;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
