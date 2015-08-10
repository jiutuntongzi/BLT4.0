//
//  BLTManager.m
//  Warm
//
//  Created by 黄建华 on 15/8/10.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import "BLTManager.h"


@interface BLTManager () <CBCentralManagerDelegate>

@property (nonatomic, strong) CBCentralManager *centralManager;
@property (nonatomic, strong) CBPeripheral *discoverPeripheral;
@property (nonatomic, strong) NSTimer *scanTimer;

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
//    BLTModelConnectState = 1;
}

@end
