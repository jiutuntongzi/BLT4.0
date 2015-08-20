//
//  FunctionViewController.m
//  Warm
//
//  Created by 黄建华 on 15/8/18.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import "FunctionViewController.h"

@interface FunctionViewController ()

@end

@implementation FunctionViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    self.title = @"蓝牙指令";
//    [_photoControl setTitle:@"开启拍照" forState:UIControlStateNormal];
//    [_photoControl setTitle:@"关闭拍照" forState:UIControlStateSelected];

    FuncionViewTable *table = [[FuncionViewTable alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
    [self.view addSubview:table];
    
    DEF_WEAKSELF_(FunctionViewController)
    table.FuncionTableSelectBlock = ^(NSInteger index)
    {
        NSLog(@"index>>>>>%d",index);
        [weakSelf functionTableSelect:index];
    };
}

- (void)functionTableSelect:(NSInteger)index
{
    NSLog(@"[BLTManager sharedInstance].model uuid >>>%@",[BLTManager sharedInstance].model.bltName);
    
    if(![[BLTManager sharedInstance]isConnect])
    {
        SHOWMBProgressHUD(@"请连接设备", nil, nil, NO, 1.0);
        return;
    }
    
    if (index == 0)
    {
        [BLTSendModel sendBoindDeviceState:YES WithUpdateBlock:^(id object, BLTAcceptModelType type)
         {
             if (type == BLTAcceptModelTypeBindingSuccess)
             {
                 SHOWMBProgressHUD(@"绑定成功", nil, nil, NO, 1.0);
                 [BLTManager sharedInstance].model.isBoind = YES;
             }
             else
             {
                 SHOWMBProgressHUD(@"绑定失败", nil, nil, NO, 1.0);
             }
        }];
    }
    else if (index == 1)
    {
        [BLTSendModel sendBoindDeviceState:NO WithUpdateBlock:^(id object, BLTAcceptModelType type)
         {
             if (type == BLTAcceptModelTypeRemoveBindingSuccess)
             {
                 SHOWMBProgressHUD(@"解绑成功", nil, nil, NO, 1.0);
                 [BLTManager sharedInstance].model.isBoind = NO;
             }
             else
             {
                 SHOWMBProgressHUD(@"解绑失败", nil, nil, NO, 1.0);
             }
         }];
    }
    else if (index == 2)
    {
        [BLTSendModel sendControlTakePhotoState:YES WithUpdateBlock:^(id object, BLTAcceptModelType type)
         {
            SHOWMBProgressHUD(@"开启拍照模式", nil, nil, NO, 1.0);
         }];
    }
    else if (index == 3)
    {
        [BLTSendModel sendControlTakePhotoState:NO WithUpdateBlock:^(id object, BLTAcceptModelType type)
         {
            SHOWMBProgressHUD(@"关闭拍照模式", nil, nil, NO, 1.0);
         }];
    }
    else if (index == 4)
    {
        [BLTSendModel sendDeviceInfo:BLTsendDeviceBasicInfo WithUpdateBlock:^(id object, BLTAcceptModelType type)
        {
            
        }];
    }
    else if (index == 5)
    {
        [BLTSendModel sendDeviceInfo:BLTsendDeviceBasicTime WithUpdateBlock:^(id object, BLTAcceptModelType type)
         {
             
         }];
    }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/


@end
