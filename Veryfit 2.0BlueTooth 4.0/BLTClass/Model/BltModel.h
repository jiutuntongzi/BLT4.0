//
//  BltModel.h
//  Warm
//
//  Created by 黄建华 on 15/8/10.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface BltModel : NSObject

// 蓝牙硬件所涉及的数据
@property (nonatomic, strong) NSString *bltName;
@property (nonatomic, strong) NSString *bltUUID;
@property (nonatomic, strong) CBPeripheral *peripheral;
@property (nonatomic, strong) NSString *bltRSSI;

@property (nonatomic, assign) BOOL isBinding;
// 是否绑定了

+ (instancetype)initWithUUID:(NSString *)uuid;

// 从数据库获取模型.
+ (BltModel *)getModelFromDBWtihUUID:(NSString *)uuid;

@end
