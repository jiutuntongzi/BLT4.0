//
//  BackGroundTaskView.m
//  CoreBlueTooth
//
//  Created by bodyconn on 15/2/2.
//  Copyright (c) 2015年 bodyconn. All rights reserved.
//

#import "BackGroundTaskView.h"
#import "BLTManager.h"
@implementation BackGroundTaskView
DEF_SINGLETON(BackGroundTaskView)
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (instancetype)init
{
    self = [super init];
    if (self)
    {
        _isBackGroundTask =YES;
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(BecomeActive:) name:UIApplicationDidBecomeActiveNotification object:nil];
        [[NSNotificationCenter defaultCenter]addObserver:self selector:@selector(Bebackground:) name:UIApplicationDidEnterBackgroundNotification object:nil];
    }
    return  self;
}

-(void)dealloc
{
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"BecomeActive" object:nil];
    [[NSNotificationCenter defaultCenter]removeObserver:self name:@"Bebackground" object:nil];
}

#pragma mark --- 应用切换到后台模式 ---
- (void)Bebackground:(NSNotification*)Info
{
    if (_BackGroundTaskBlock)
    {
        _BackGroundTaskBlock (YES);
    }
    if (!_isBackGroundTask)
    {
//        [[BTCenterManager sharedInstance]disconnectPeripheral:nil];
    }
    else
    {
        UIApplication *application;
        
        _bgTaskId = [application beginBackgroundTaskWithExpirationHandler:^{
            //结束指定的任务
            [application endBackgroundTask:_bgTaskId];
        }];

        _Runcount=0;
        _RunTotalCount=0;
        
    }
    _countTimer= [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(runTimer:) userInfo:nil repeats:YES];
    
}
- (void)runTimer:(NSTimer*)timer
{
    _Runcount++;
    _RunTotalCount++;
    NSLog(@"后台运行总时间>>>%d 运行间隔>>>%d",_RunTotalCount,_Runcount);
    if (_bgTaskId==UIBackgroundTaskInvalid)
    {
        UIApplication *application = [UIApplication sharedApplication];
        _bgTaskId = [application beginBackgroundTaskWithExpirationHandler:^{
            
            
            //结束指定的任务
            [application endBackgroundTask:_bgTaskId];
        }];
    }
    if (_Runcount % 150 == 0) {
        _Runcount=0;
//        UInt8 val[4]={0};
//        val[0]=0xA6;
//        val[1]=0x61;
//        val[2]=0x0A;
//        NSData *fd = [[NSData alloc] initWithBytes:&val length:3];
//        [[BTCenterManager sharedInstance]WriteData:fd];
        
    }
}
#pragma mark --- 应用切换到前台模式 ---
- (void)BecomeActive:(NSNotification*)Info
{
    if (_countTimer) {
        [_countTimer invalidate];
        _countTimer=nil;
    }
    
    if (_bgTaskId != UIBackgroundTaskInvalid) {
        [[UIApplication sharedApplication] endBackgroundTask:_bgTaskId];
        _bgTaskId = UIBackgroundTaskInvalid;

    }
    if (_BackGroundTaskBlock) {
        _BackGroundTaskBlock (NO);
    }
    
}
@end
