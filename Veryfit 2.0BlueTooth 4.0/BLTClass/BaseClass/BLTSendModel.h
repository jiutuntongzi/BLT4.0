//
//  BLTSendModel.h
//  PlaneCup
//
//  Created by zorro on 15/3/19.
//  Copyright (c) 2015年 zorro. All rights reserved.
//

#define BLT_Binding @"BLT_Binding"
#define BLT_InfoDelayTime 0.1 // 蓝牙通信间隔 避免造成堵塞.

#import <Foundation/Foundation.h>
#import "BLTAcceptModel.h"

@interface BLTSendModel : NSObject

//typedef void(^BLTSendDataBackUpdate)(NSDate *date);

AS_SINGLETON(BLTSendModel)

// 拍照控制
+ (void)sendControlTakePhotoState:(BOOL)type WithUpdateBlock:(BLTAcceptModelUpdateValue)block;

@end
