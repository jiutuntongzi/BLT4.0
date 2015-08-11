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
        [BLTManager sharedInstance];
        
        // DEF_WEAKSELF_(BLTAcceptModel);
        
        /**
         *  普通数据得更新
         *
         *  @param data 传入得数据data
         *
         *  @return
         */
        
        [BLTPeripheral sharedInstance].updateBigDataBlock = ^(NSData *data) {
            [self updateBigData:data];
        };
        
        [BLTPeripheral sharedInstance].updateBlock = ^(NSData *data, CBPeripheral *peripheral) {
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
     NSLog(@"接受普通数据  >>>>%@",data);
}


@end
