//
//  HotmoxibustionModelTableViewCell.h
//  Warm
//
//  Created by 黄建华 on 15/8/4.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface HotmoxibustionModelTableViewCell : UITableViewCell

@property (nonatomic, strong) UILabel *showHotmoxibustionTitle;

- (void)hotmoxibustionModelTableViewUpdateCell:(HotmoxibustionModel *)model showHeight:(CGFloat)height;

@end
