//
//  HLNBaseViewController.m
//  HLN-IMDemo
//
//  Created by heiline on 15/8/14.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "HLNBaseViewController.h"

@interface HLNBaseViewController ()

@end

@implementation HLNBaseViewController

- (instancetype)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    if (self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil]) {
        [self setHidesBottomBarWhenPushed:YES];
    }
    return self;
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
    
}

- (void)viewDidLoad
{
    [super viewDidLoad];
}

@end
