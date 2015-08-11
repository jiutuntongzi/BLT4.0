//
//  BLTManager.h
//  Warm
//
//  Created by 黄建华 on 15/8/10.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import <Foundation/Foundation.h>
#define BOINDUUID @"BOINDUUID"

typedef enum {
    BLTModelDisConnect = 0,             // 未连接
    BLTModelDidConnect = 1,             // 已连接
    BLTModelConnecting,                 // 连接中
    BLTModelRepeatConnecting,           // 重连中
    BLTModelConnectFindDevice,          // 寻找设备
    BLTModelConnectAlarming,            // 连接报警, 设备寻找手机
    BLTModelDistanceAlarming,           // 距离报警
    BLTModelDisConnectAlarming,         // 丢失报警
    BLTModelConnectFail                 // 连接失败
} BLTModelConnectState;

@interface BLTManager : NSObject

@property (nonatomic, strong) BltModel *model;
@property (nonatomic, assign) BOOL isUpdateing;
@property (nonatomic, strong) NSMutableArray *allWareArray;
@property (nonatomic, strong) NSString *lastUuid;

AS_SINGLETON(BLTManager)

// 不取消当前设备的情况下扫描
- (void)scanDevice;

// 停止扫描.
- (void)stopScan;

@end
