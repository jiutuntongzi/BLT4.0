//
//  BLTManager.m
//  Warm
//
//  Created by 黄建华 on 15/8/10.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import "BLTManager.h"
#import "BLTUUID.h"

@interface BLTManager () <CBCentralManagerDelegate>

@property (nonatomic, strong) CBCentralManager *centralManager;
@property (nonatomic, strong) CBPeripheral *discoverPeripheral;
@property (nonatomic, strong) NSTimer *scanDeviceTimer;    //扫描设备的定时器

@end

@implementation BLTManager

DEF_SINGLETON(BLTManager)

- (instancetype) init
{
    self = [super init];
    if (self)
    {
    _allWareArray = [[NSMutableArray alloc] initWithCapacity:0];
    _centralManager = [[CBCentralManager alloc] initWithDelegate:self queue:nil];
    }
    return self;
}

- (void)centralManagerDidUpdateState:(CBCentralManager *)central
{
    if (central.state == CBCentralManagerStatePoweredOn)
    {
   
    }
    else
    {
        
    }

}

- (void)scanDevice:(CGFloat)time
{
    SHOWMBProgressHUD(@"开始扫描",nil, nil, NO, 1.0);
    if (_scanDeviceTimer)
    {
        [_scanDeviceTimer invalidate];
        _scanDeviceTimer = nil;
    }
    _scanDeviceTimer = [NSTimer scheduledTimerWithTimeInterval:time target:self selector:@selector(stopScan) userInfo:nil repeats:NO];
    
    // 先停止扫描然后继续扫描. 避免因为多线程操作设备数组导致崩溃.
    [_centralManager stopScan];
    
    [_allWareArray enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
        BltModel *model = obj;
        switch (model.peripheral.state)
        {
            case CBPeripheralStateConnected:
                
                break;
                
            default:
            {
                [_allWareArray removeObject:model];
            }
                break;
        }
    }];
    [_centralManager scanForPeripheralsWithServices:@[BLTUUID.uartServiceUUID]
                                        options:nil];
}

- (void)stopScan
{
    SHOWMBProgressHUD(@"停止扫描",nil, nil, NO, 1.0);
    [_scanDeviceTimer invalidate];
    _scanDeviceTimer = nil;
    [_centralManager stopScan];
}

- (void)centralManager:(CBCentralManager *)central didDiscoverPeripheral:(CBPeripheral *)peripheral advertisementData:(NSDictionary *)advertisementData RSSI:(NSNumber *)RSSI
{
//     NSLog(@"..%@..%@..%@", advertisementData, [peripheral.identifier UUIDString], peripheral.name);
    
    NSString *deviceName1 = peripheral.name;
    NSString *deviceName2 = [advertisementData objectForKey:@"kCBAdvDataLocalName"];
    
    NSString *idString = [peripheral.identifier UUIDString];
    
    if (!idString)
    {
        return;
    }
    
    NSLog(@"Device >>>>..%@..%@..%@", advertisementData, [peripheral.identifier UUIDString], peripheral.name);
    
    if (!_isUpdateing)
    {
            BltModel *model = [self checkIsAddInAllWareWithID:idString];
        if (model)
        {
            NSLog(@"已经存在device >>更新设备信息>>>");
            model.bltRSSI = [NSString stringWithFormat:@"%d", ABS(RSSI.intValue)];
            model.peripheral = peripheral;
        }
        else
        {
            // 从数据库取当前设备的模型.
            model = [BltModel getModelFromDBWtihUUID:idString];
            model.bltName = deviceName1 ? deviceName1 : (deviceName2 ? deviceName2 : @"");
            model.bltRSSI = [NSString stringWithFormat:@"%d", ABS(RSSI.intValue)];
            model.peripheral = peripheral;
            
            [_allWareArray addObject:model];
        }
        NSString *lastUUID = [BOINDUUID getObjectValue];
        NSLog(@"绑定的设备uuid:>>>>>>%@",lastUUID);
        
//        if ([lastUUID isEqualToString:model.bltUUID] && model.isBinding)
//        {
//            // 如果该设备已经绑定并且没有连接设备时就直接连接.
//            [self connectPeripheralWithModel:model];
//        }
    }
}

- (void)connectPeripheralWithModel:(BltModel *)model
{
    if (model == nil)
    {
        return;
    }
    
    if ([_model.bltUUID isEqualToString:model.bltUUID])
    {
        SHOWMBProgressHUD(@"同一个设备", nil, nil, NO, 1.0);
        if (model.peripheral.state != CBPeripheralStateConnected)
        {
            [_centralManager connectPeripheral:model.peripheral options:nil];
        }
    }
    else
    {
        if (_model.peripheral.state == CBPeripheralStateConnected)
        {
             [_centralManager cancelPeripheralConnection:_model.peripheral];
             [NSObject cancelPreviousPerformRequestsWithTarget:self selector:@selector(connectDevice) object:nil];
             [self performSelector:@selector(connectDevice) withObject:nil afterDelay:3.0];
             _model = model;
             SHOWMBProgressHUD(@"先断开之前设备", nil, nil, NO, 2.5);
            
        }
        else
        {
             _model = model;
            [self connectDevice];
        }
        
    }
    
//    if (model.peripheral.state == CBPeripheralStateConnected)
//    {
//        // 已经连接不作处理
//    }
//    
//    if (model.peripheral.state != CBPeripheralStateConnected)
//    {
//        if (_model)
//        {
//            // 将当前连接的模型干掉...
//            NSLog(@"准备连接新的设备...");
//          [_centralManager cancelPeripheralConnection:model.peripheral];
//        }
//        
//        _model = model;
//        _discoverPeripheral = model.peripheral;
//        [_centralManager connectPeripheral:_model.peripheral options:nil];
//
//        
//        [_centralManager stopScan];
//    }
}

// 连接设备并停止扫描
- (void)connectDevice
{   SHOWMBProgressHUD(@"连接设备", nil, nil, NO, 1.0);
    [_centralManager connectPeripheral:_model.peripheral options:nil];
    _discoverPeripheral = _model.peripheral;
    [_centralManager stopScan];
}

- (BltModel *)checkIsAddInAllWareWithID:(NSString *)idString
{
    for (BltModel *model in _allWareArray)
    {
        if ([model.bltUUID isEqualToString:idString])
        {
            return model;
        }
    }
    
    return nil;
}

@end
