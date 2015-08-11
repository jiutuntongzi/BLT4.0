//
//  HomeViewController.m
//  Warm
//
//  Created by 黄建华 on 15/8/10.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import "HomeViewController.h"

@interface HomeViewController ()

@end

@implementation HomeViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    NavLabel *title = [[NavLabel alloc] initWithFrame:CGRectMake(0,20 + 12, self.view.width, 20)];
    title.text = @"蓝牙设备";
    title.font = AUTOFONTSIZE(17.0);
    title.textAlignment = NSTextAlignmentCenter;
    title.textColor = [UIColor whiteColor];
    [self.view addSubview:title];
    
    self.view.backgroundColor = AUTOCOLORPINK;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, self.view.width, 4 * 60) style:UITableViewStylePlain];
    _tableView.delegate =self;
    _tableView.dataSource =self;
    _tableView.backgroundColor = [UIColor clearColor];
    [self.view addSubview:_tableView];
    
    _deviceList = [[NSArray alloc] initWithObjects:@"1",@"2",@"3", nil];
    NSLog(@"设备>>>%@",_deviceList);
    
    CGFloat width = (self.view.width - 20)/4;
    
    _scanButton = [[NavButton alloc] initWithFrame:CGRectMake(0, 320, width, 44)];
    [_scanButton setTitle:@"扫描设备" forState:UIControlStateNormal];
    [_scanButton setTitle:@"停止扫描" forState:UIControlStateSelected];
    [_scanButton addTarget:self action:@selector(scanButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_scanButton];
    
    NavButton *refreshButton = [[NavButton alloc] initWithFrame:CGRectMake(width + 5, 320, width, 44)];
    [refreshButton setTitle:@"重新扫描" forState:UIControlStateNormal];
    [refreshButton addTarget:self action:@selector(refreshButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:refreshButton];
    
    NavButton *connectButton = [[NavButton alloc] initWithFrame:CGRectMake(width * 2 + 10, 320, width, 44)];
    [connectButton setTitle:@"链接设备" forState:UIControlStateNormal];
    [connectButton addTarget:self action:@selector(connectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:connectButton];
    
    NavButton *disConnectButton = [[NavButton alloc] initWithFrame:CGRectMake(width * 3 + 15 , 320, width, 44)];
    [disConnectButton setTitle:@"断开设备" forState:UIControlStateNormal];
    [disConnectButton addTarget:self action:@selector(disConnectButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:disConnectButton];
    
    NavButton *boindButton = [[NavButton alloc] initWithFrame:CGRectMake(10, 370, self.view.width - 20, 44)];
    [boindButton setTitle:@"绑定设备" forState:UIControlStateNormal];
    [boindButton addTarget:self action:@selector(boindButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:boindButton];
    
    NavButton *removeBoindButton = [[NavButton alloc] initWithFrame:CGRectMake(10, 420, self.view.width - 20, 44)];
    [removeBoindButton setTitle:@"解绑设备" forState:UIControlStateNormal];
    [removeBoindButton addTarget:self action:@selector(removeBoindButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:removeBoindButton];
    
    [BLTManager sharedInstance];
}

- (void)scanButtonClick:(NavButton *)sender
{
    if (sender.selected ==YES)
    {
     [[BLTManager sharedInstance]stopScan];
        sender.selected = NO;
    }
    else
    {
     [[BLTManager sharedInstance]scanDevice];
        sender.selected = YES;
    }
}

- (void)refreshButtonClick:(NavButton *)sender
{
    
}

- (void)connectButtonClick:(NavButton *)sender
{
    
}

- (void)disConnectButtonClick:(NavButton *)sender
{
    
}

- (void)boindButtonClick:(NavButton *)sender
{
    
}

- (void)removeBoindButtonClick:(NavButton *)sender
{
    
}

- (void)setDeviceList:(NSArray *)deviceList
{
    _deviceList = deviceList;
    NSLog(@"设备>>>%@",_deviceList);
    
    [_tableView reloadData];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return _deviceList.count;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 60.0f;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *ListViewCellId = @"DeviceTableViewCell";
    DeviceTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ListViewCellId];
    if (cell == nil)
    {
        cell = [[DeviceTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ListViewCellId];
    }
    cell.backgroundColor = AUTOCOLORDEEPPINK;
    [cell updateBltModel:nil];

    return  cell;
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
