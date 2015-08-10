//
//  HotmoxibustionModelTableView.h
//  Warm
//
//  Created by 黄建华 on 15/8/4.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotmoxibustionModelTableView : UIView <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *deviceFunctionList;


@end
