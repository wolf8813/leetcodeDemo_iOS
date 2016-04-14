//
//  HLNBaseCell.m
//  HLN-IMDemo
//
//  Created by heiline on 15/8/25.
//  Copyright (c) 2015年 baidu. All rights reserved.
//

#import "HLNBaseCell.h"

@implementation HLNBaseCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        
        self.imageView.image = nil;
//        self.imageView.hidden = YES;
        self.textLabel.text = nil;
//        self.textLabel.hidden = YES;
        self.detailTextLabel.text = nil;
//        self.detailTextLabel.hidden = YES;
    }
    
    return self;
}

@end
