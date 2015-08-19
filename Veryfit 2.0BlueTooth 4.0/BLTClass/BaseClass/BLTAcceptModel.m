//
//  BLTAcceptModel.m
//  Warm
//
//  Created by 黄建华 on 15/8/11.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import "BLTAcceptModel.h"
#import "BLTPeripheral.h"

@implementation BLTAcceptModel


DEF_SINGLETON(BLTAcceptModel)

- (instancetype)init
{
    self = [super init];
    if (self)
    {
//        _lastSerial = -999;
//        _shakeArray = [[NSMutableArray alloc] init];
//        _syncData = [[NSMutableData alloc] init];
//        _indexArray = [[NSMutableArray alloc] init];
//        
        // 直接启动蓝牙
//        [BLTManager sharedInstance];
        
        // DEF_WEAKSELF_(BLTAcceptModel);
        
        /**
         *  普通数据得更新
         *
         *  @param data 传入得数据data
         *
         *  @return
         */
        
        [BLTPeripheral sharedInstance].updateBigDataBlock = ^(NSData *data)
        {
            [self updateBigData:data];
        };
        
        [BLTPeripheral sharedInstance].updateBlock = ^(NSData *data, CBPeripheral *peripheral)
        {
            [self acceptData:data withPeripheral:peripheral];
        };
    }
    return self;
}

- (void)updateBigData:(NSData *)data
{
    NSLog(@"接受大数据  >>>>%@",data);
}

- (void)acceptData:(NSData *)data withPeripheral:(CBPeripheral *)peripheral
{
    NSLog(@"接受普通数据 >>>>%@",data);
    
    _type = BLTAcceptModelTypeSuccess;
    UInt8 val[20] = {0};
    [data getBytes:&val length:data.length];
    
    // NSLog(@"..%x..%x..%x..%x..%x...%x", val[0], val[1], val[2], val[3], val[4], val[5]);
    id object = nil;
    
    if (val[0] == 0x06)
    {
        object = data;
    }
    
    if (_updateValue)
    {
        _updateValue(object, _type);
        _updateValue = nil;
    }
}


@end
