//
//  HotmoxibustionModelTableViewCell.m
//  Warm
//
//  Created by 黄建华 on 15/8/4.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import "HotmoxibustionModelTableViewCell.h"

@implementation HotmoxibustionModelTableViewCell

- (void)awakeFromNib {
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self =[ super initWithStyle:style reuseIdentifier:reuseIdentifier];
    
    if (self)
    {
        [self loadCell];
    }
    
    return self;
}

- (void)loadCell
{
    _showHotmoxibustionTitle = [[UILabel alloc] init];
    _showHotmoxibustionTitle.textColor = AUTOCOLORDEEPPINK;
    _showHotmoxibustionTitle.frame = CGRectMake(30,self.height /2 + 5, 120, 20);
    _showHotmoxibustionTitle.textAlignment = NSTextAlignmentLeft;
    [self addSubview:_showHotmoxibustionTitle];
}

- (void)hotmoxibustionModelTableViewUpdateCell:(HotmoxibustionModel *)model showHeight:(CGFloat)height
{
    self.selectedBackgroundView = [[UIView alloc] initWithFrame:self.frame];
    self.selectedBackgroundView.backgroundColor = AUTOCOLORPINK;
    _showHotmoxibustionTitle.text = @"轻微痛感";
}

@end
