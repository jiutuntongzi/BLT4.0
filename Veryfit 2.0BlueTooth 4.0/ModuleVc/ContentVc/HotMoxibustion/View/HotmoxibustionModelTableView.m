//
//  HotmoxibustionModelTableView.m
//  Warm
//
//  Created by 黄建华 on 15/8/4.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import "HotmoxibustionModelTableView.h"
#import "HotmoxibustionModelTableViewCell.h"

@implementation HotmoxibustionModelTableView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    
    if (self)
    {
        [self loadTableView];
    }
    
    return self;
}
- (void)loadTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, self.frame.size.width, self.frame.size.height) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator = NO;
    [self addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 3;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0;
}

- (void)setDeviceFunctionList:(NSArray *)deviceFunctionList
{
    _deviceFunctionList = deviceFunctionList;
    [_tableView reloadData];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ListViewCellId = @"HotmoxibustionModelTableViewCell";
    HotmoxibustionModelTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ListViewCellId];
    
    if (cell == nil)
    {
        cell = [[HotmoxibustionModelTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ListViewCellId];
    }
    
//    cell.backgroundColor = [UIColor clearColor];
    
    [cell hotmoxibustionModelTableViewUpdateCell:nil showHeight:0.0];
    
    return  cell;
}


@end
