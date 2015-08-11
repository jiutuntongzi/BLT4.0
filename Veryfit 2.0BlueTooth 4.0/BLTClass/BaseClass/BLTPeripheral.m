//
//  BLTPeripheral.m
//  Warm
//
//  Created by 黄建华 on 15/8/11.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import "BLTPeripheral.h"

@interface BLTPeripheral ()

@property (nonatomic, strong) NSMutableData *receiveData;
@property (nonatomic, assign) CBCharacteristicWriteType writeType;
@property (nonatomic, assign) CBCharacteristic *readCharac;

@end

@implementation BLTPeripheral

DEF_SINGLETON(BLTPeripheral)

- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _receiveData = [[NSMutableData alloc] init];
        _writeType = CBCharacteristicWriteWithResponse;
    }
    
    return self;
}

- (void)setPeripheral:(CBPeripheral *)peripheral
{
    _peripheral = peripheral;
    
    if (peripheral)
    {
        // [self startUpdateRSSI];
    }
    else
    {
        // [self stopUpdateRSSI];
    }
}

@end
