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

@property (nonatomic, strong) CBPeripheral *peripheral;

AS_SINGLETON(BLTPeripheral)

@end
