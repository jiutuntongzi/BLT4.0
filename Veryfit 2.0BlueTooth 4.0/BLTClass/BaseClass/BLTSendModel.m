//
//  BLTSendModel.m
//  PlaneCup
//
//  Created by zorro on 15/3/19.
//  Copyright (c) 2015年 zorro. All rights reserved.
//

#import "BLTSendModel.h"
#import "BLTManager.h"

@implementation BLTSendModel

DEF_SINGLETON(BLTSendModel)

// 拍照控制
+ (void)sendControlTakePhotoState:(BOOL)type WithUpdateBlock:(BLTAcceptModelUpdateValue)block
{
    UInt8 ControlType = 0x00;
    if(type)
    {
        ControlType = 0x00;
    }
    else
    {
        ControlType = 0x01;
    }
    UInt8 val[3] = {0x06, 0x02,ControlType};
    [self sendDataToWare:val
              withLength:3
              withUpdate:block];
}

+ (void)sendDataToWare:(UInt8 *)val
            withLength:(NSInteger)length
            withUpdate:(BLTAcceptModelUpdateValue)block
{
    usleep(2500);
    [BLTAcceptModel sharedInstance].updateValue = block;
    [BLTAcceptModel sharedInstance].type = BLTAcceptModelTypeUnKnown;
    [BLTAcceptModel sharedInstance].dataType = BLTAcceptModelDataTypeUnKnown;
    
    NSData *sData = [[NSData alloc] initWithBytes:val length:length];
    [[BLTPeripheral sharedInstance] senderDataToPeripheral:sData];
}


@end
