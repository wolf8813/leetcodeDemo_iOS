//
//  HLNBaseTableViewController.m
//  HLN-IMDemo
//
//  Created by heiline on 15/8/25.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "HLNBaseTableViewController.h"

@interface HLNBaseTableViewController () 

@end

@implementation HLNBaseTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tableView = [[UITableView alloc] initWithFrame:(CGRect){CGPointZero, kScreenSize} style:_tableViewStyle];
    [self.view addSubview:self.tableView];
    
    self.tableView.tableFooterView = [[UIView alloc] init];

    if (self.navigationController != nil) {
        self.tableView.height -= kNavBarH + kStatusBarH;
    }
    
    if (self.tabBarController != nil) {
        if (self.navigationController.childViewControllers.count == 1) {
            self.tableView.height -= kTabBarH;
        }
    }
}

- (void)dealloc
{
    self.tableView.dataSource = nil;
    self.tableView.delegate = nil;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return [[UITableViewCell alloc] init];
}

@end
