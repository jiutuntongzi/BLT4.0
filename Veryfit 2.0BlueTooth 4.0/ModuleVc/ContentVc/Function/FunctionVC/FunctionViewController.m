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
    [_photoControl setTitle:@"开启拍照" forState:UIControlStateNormal];
    [_photoControl setTitle:@"关闭拍照" forState:UIControlStateSelected];
 
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

- (IBAction)photoControl:(NavButton *)sender
{
    if (_photoControl.selected)
    {
        _photoControl.selected = NO;
    }
    else
    {
        _photoControl.selected = YES;
    }
    [BLTSendModel sendControlTakePhotoState:_photoControl.selected WithUpdateBlock:^(id object, BLTAcceptModelType type)
     {
         if (_photoControl.selected)
         {
              SHOWMBProgressHUD(@"开启拍照模式", nil, nil, NO, 1.0);
         }
         else
         {
              SHOWMBProgressHUD(@"关闭拍照模式", nil, nil, NO, 1.0);
         }
    }];
}


@end
