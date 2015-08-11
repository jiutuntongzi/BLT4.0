//
//  BLTPeripheral.h
//  Warm
//
//  Created by 黄建华 on 15/8/11.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreBluetooth/CoreBluetooth.h>

@interface BLTPeripheral : NSObject <CBPeripheralDelegate>

typedef void(^BLTPeripheralRSSI)(NSInteger RSSI);
typedef void(^BLTPeripheralDidConnect)();
typedef void(^BLTPeripheralUpdate)(NSData *data, CBPeripheral *peripheral);
typedef void(^BLTPeripheralUpdateBigData)(NSData *data);

@property (nonatomic, strong) BLTPeripheralUpdate updateBlock;
@property (nonatomic, strong) BLTPeripheralUpdateBigData updateBigDataBlock;
@property (nonatomic, strong) BLTPeripheralDidConnect connectBlock;
@property (nonatomic, strong) BLTPeripheralRSSI rssiBlock;

@property (nonatomic, strong) CBPeripheral *peripheral;


AS_SINGLETON(BLTPeripheral)

@end
