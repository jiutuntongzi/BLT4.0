//
//  BltModel.m
//  Warm
//
//  Created by 黄建华 on 15/8/10.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import "BltModel.h"

@implementation BltModel

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _bltName = @"";
        _bltUUID = @"";
        _bltRSSI = @"";
        
    }
    return self;
}

+ (void)initialize
{
    [self removePropertyWithColumnName:@"peripheral"];
    [self removePropertyWithColumnName:@"bltRSSI"];
    [self removePropertyWithColumnName:@"bltVersion"];

}

+ (instancetype)initWithUUID:(NSString *)uuid
{
    BltModel *model = [[BltModel alloc] init];
    
    model.bltUUID = uuid;
    
    return model;
}

+ (BltModel *)getModelFromDBWtihUUID:(NSString *)uuid
{
    // 避免数据库的循环使用.
    [ShareData sharedInstance].isAllowBLTSave = NO;
    
    NSString *where = [NSString stringWithFormat:@"bltUUID = '%@'", uuid];
    BltModel *model = [BltModel searchSingleWithWhere:where orderBy:nil];
    
    if (!model)
    {
        model = [BltModel initWithUUID:uuid];
        
        [model saveToDB];
    }

//    根据uuid获取闹钟模型
//    [model setAlarmArrayAndRemindArrayWithUUID:uuid];
    
    [ShareData sharedInstance].isAllowBLTSave = YES;
    
    return model;
}

// 更新当前模型到数据库.
- (void)updateCurrentModelToDB
{
    if ([ShareData sharedInstance].isAllowBLTSave)
    {
        [BltModel updateToDB:self where:nil];
    }
}


// 主建
+ (NSString *)getPrimaryKey
{
    return @"bltUUID";
}

// 表名
+ (NSString *)getTableName
{
    return @"BLTModel";
}

// 表版本
+ (int)getTableVersion
{
    return 1;
}

@end
