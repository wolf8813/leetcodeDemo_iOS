//
//  HLNBaseNavigationController.m
//  HLN-IMDemo
//
//  Created by heiline on 15/8/14.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "HLNBaseNavigationController.h"

@interface HLNBaseNavigationController ()

@end

@implementation HLNBaseNavigationController

- (instancetype)initWithRootViewController:(UIViewController *)rootViewController
{
    if (self = [super initWithRootViewController:rootViewController]) {
        
        self.navigationBar.barTintColor = [UIColor blackColor];
        self.navigationBar.tintColor = [UIColor whiteColor];
        self.navigationBar.titleTextAttributes = @{NSForegroundColorAttributeName: [UIColor whiteColor]};
        self.navigationBar.titleTextAttributes = @{NSFontAttributeName: kBoldFont(18.5), NSForegroundColorAttributeName: [UIColor whiteColor]};
        self.navigationBar.translucent = NO;
    }
    
    return self;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self setNeedsStatusBarAppearanceUpdate];
    
}

- (UIStatusBarStyle)preferredStatusBarStyle
{
    return UIStatusBarStyleLightContent;
}

#pragma roate method
- (BOOL)shouldAutorotate {
    return NO;
}

- (UIInterfaceOrientationMask)supportedInterfaceOrientations {
    return UIInterfaceOrientationMaskPortrait;
}

@end
