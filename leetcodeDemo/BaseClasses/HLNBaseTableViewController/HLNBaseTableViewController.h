//
//  HLNBaseTableViewController.h
//  HLN-IMDemo
//
//  Created by heiline on 15/8/25.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HLNBaseTableViewController : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, assign) UITableViewStyle tableViewStyle;
@property (nonatomic, strong) UITableView *tableView;


@end
