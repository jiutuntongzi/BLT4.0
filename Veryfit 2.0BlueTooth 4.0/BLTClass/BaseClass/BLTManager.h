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

// 更新蓝牙
typedef void(^BLTManagerUpdateModel)(NSArray *list);
typedef void(^BltManagerBoind) (BOOL state);
typedef void(^BltManagerRemoveBoind) (BOOL state);
typedef void(^BltManagerDidConnect)();
typedef void(^BltManagerDisConnect)();

@property (nonatomic, strong) BLTManagerUpdateModel updateModelBlock;
@property (nonatomic, strong) BltManagerDidConnect BltManagerDidConnectBlock;
@property (nonatomic, strong) BltManagerDisConnect BltManagerDisConnectBlock;

@property (nonatomic, strong) BltModel *model;
@property (nonatomic, assign) BOOL isUpdateing;
@property (nonatomic, strong) NSMutableArray *allWareArray;
@property (nonatomic, strong) NSString *lastUuid;
@property (nonatomic, assign) CGFloat scanTime;

AS_SINGLETON(BLTManager)

// 不取消当前设备的情况下扫描
- (void)scanDevice:(CGFloat)time;

// 停止扫描.
- (void)stopScan;

// 绑定已经连接过的设备
- (void)connectPeripheralWithBoindModel;

// 连接没有绑定的设备
- (void)connectPeripheralWithModel:(BltModel *)model;

// 断开当前连接设备
- (void)disConnectPeripheral;

// 查看是否绑定设备
- (BOOL)checkBoind;

// 绑定选中设备
- (void)boindDeviceWith:(BltManagerBoind)boindState;

// 解绑设备
- (void)removeBoindWith:(BltManagerRemoveBoind)removeBoindState;

@end
