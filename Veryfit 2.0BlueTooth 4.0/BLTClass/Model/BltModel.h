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
@property (nonatomic, strong) CBPeripheral *peripheral; // 蓝牙外设
@property (nonatomic, strong) NSString *bltName;        // 设备的名字
@property (nonatomic, strong) NSString *bltUUID;        // 设备的uuid
@property (nonatomic, strong) NSString *bltRSSI;        // 设备的信号
@property (nonatomic, assign) BOOL isBoind;        // 是否绑定
@property (nonatomic, assign) BOOL isConnect;           // 是否连接



+ (instancetype)initWithUUID:(NSString *)uuid;

// 从数据库获取模型.
+ (BltModel *)getModelFromDBWtihUUID:(NSString *)uuid;

@end
