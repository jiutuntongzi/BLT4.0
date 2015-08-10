//
//  HotMoxibustionVc.m
//  Warm
//
//  Created by 黄建华 on 15/8/4.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import "HotMoxibustionVc.h"
#import "HotmoxibustionModelTableView.h"

@interface HotMoxibustionVc ()

@property (nonatomic, strong) NavButton *remarkButton;
@property (nonatomic, strong) NavLabel *navTitleLabel;
@property (nonatomic, strong) NavLabel *showTemperatureLabel;
@property (nonatomic, strong) ZJSwitch *switchButton;
@property (nonatomic, strong) UIButton *reduceTemperatureButton;
@property (nonatomic, strong) UIButton *addTemperatureButton;
@property (nonatomic, strong) NavLabel *showLastTimeLabel;

@property (nonatomic, assign) NSInteger currentTemperature;
@property (nonatomic, strong) UIButton *temperatureSelectButton;
@property (nonatomic, strong) HotmoxibustionModelTableView *hotTableView;

@end

@implementation HotMoxibustionVc

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
}

- (void)loadHotView
{
    UIImageView *bgImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 750.0 / 2, 1334.0/2)];
    bgImageView.image = UIImageNamed(@"3rejiu_1bg_6@2x.png");
    [self.view addSubview:bgImageView];
}

- (void)loadButton
{
    _switchButton = [[ZJSwitch alloc] initWithFrame:CGRectMake(self.view.width - 65, 20 + (44 - 35 ) /2.0, 52, 35)];
    _switchButton.backgroundColor = [UIColor clearColor];
    _switchButton.tintColor = AUTOCOLORGRAY;
    _switchButton.onTintColor = AUTOCOLORDEEPPINK;
    _switchButton.onText = @"ON";
    _switchButton.offText = @"OFF";
    [_switchButton addTarget:self action:@selector(handleSwitchEvent:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_switchButton];
    
    _remarkButton = [[NavButton alloc] initWithFrame:CGRectMake(0, 20, 60, 44)];
    [_remarkButton setTitle:@"纪录" forState:UIControlStateNormal];
    [_remarkButton addTarget:self action:@selector(remarkButtonClick:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_remarkButton];
    
    _reduceTemperatureButton = [[UIButton alloc] initWithFrame:CGRectMake(53, 125, 44, 44)];
    _reduceTemperatureButton.bgImageNormal = @"3rejiu_adjust_reduce_normal_6@2x.png";
    _reduceTemperatureButton.bgImageHighlight = @"3rejiu_adjust_reduce_press_6@2x.png";
    [_reduceTemperatureButton addTarget:self action:@selector(reduceTemperatureButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_reduceTemperatureButton];
    
    _addTemperatureButton = [[UIButton alloc] initWithFrame:CGRectMake(278, 125, 44, 44)];
    _addTemperatureButton.bgImageNormal = @"3rejiu_adjust_plus_normal_6@2x.png";
    _addTemperatureButton.bgImageHighlight = @"3rejiu_adjust_plus_press_6@2x.png";
    [_addTemperatureButton addTarget:self action:@selector(addTemperatureButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_addTemperatureButton];
    
    _temperatureSelectButton = [[UIButton alloc] initWithFrame:CGRectMake(270,256, 90, 42)];
    _temperatureSelectButton.bgImageNormal = @"3rejiu_minutes_6@2x.png";
    [_temperatureSelectButton addTarget:self action:@selector(temperatureSelectButton:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:_temperatureSelectButton];
}

- (void)loadLabel
{
    _navTitleLabel = [[NavLabel alloc] initWithFrame:CGRectMake(0, 20 + (44-20)/2, self.view.width, 20)];
    _navTitleLabel.text = @"暖男热灸";
    [self.view addSubview:_navTitleLabel];
    
    // 温度显示
    NavLabel *temperatureLabelInfo = [[NavLabel alloc] initWithFrame:CGRectMake(0, 220, self.view.width, 20)];
    temperatureLabelInfo.text = @"当前温度";
    temperatureLabelInfo.textColor = AUTOCOLORDEEPPINK;
    [self.view addSubview:temperatureLabelInfo];
    
    _showTemperatureLabel = [[NavLabel alloc] initWithFrame:CGRectMake(-15, 256 / 2, self.view.width, 40)];
    _showTemperatureLabel.font = AUTOFONTSIZE(40);
    _showTemperatureLabel.textColor = AUTOCOLORDEEPPINK;
    [self.view addSubview:_showTemperatureLabel];
    
    NavLabel *temperatureLabelInfo02 = [[NavLabel alloc] initWithFrame:CGRectMake(17, 267, 140 / 2, 20)];
    temperatureLabelInfo02.textAlignment = NSTextAlignmentLeft;
    temperatureLabelInfo02.font = AUTOFONTSIZE(16.0);
    temperatureLabelInfo02.text = @"已持续 :";
    [self.view addSubview:temperatureLabelInfo02];
    
    NavLabel *temperatureLabelInfo03 = [[NavLabel alloc] initWithFrame:CGRectMake(self.view.width / 2 + 8, 267, 180 / 2, 20)];
    temperatureLabelInfo03.textAlignment = NSTextAlignmentLeft;
    temperatureLabelInfo03.font = AUTOFONTSIZE(16.0);
    temperatureLabelInfo03.text = @"剩余时间:";
    [self.view addSubview:temperatureLabelInfo03];

    _showLastTimeLabel = [[NavLabel alloc] initWithFrame:CGRectMake(temperatureLabelInfo02.origin.x + 70, 267, 120, 20)];
    _showLastTimeLabel.textAlignment = NSTextAlignmentLeft;
    _showLastTimeLabel.text = @"2小时45分";
    [self.view addSubview:_showLastTimeLabel];
    
}

- (void)loadData
{
    _currentTemperature = 40;
    _showTemperatureLabel.text = [NSString stringWithFormat:@"%lu",_currentTemperature];
    _showLastTimeLabel.text = @"2小时45分";
}

- (void)loadHotTableView
{
    _hotTableView = [[HotmoxibustionModelTableView alloc] initWithFrame:CGRectMake(0, 400 - 5, self.view.width, 220)];
    _hotTableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:_hotTableView];
}
// 记录按钮点击
- (void)remarkButtonClick:(NavButton *)sender
{
    
}

// 减少温度
- (void)reduceTemperatureButton:(UIButton *)sender
{
    if (_currentTemperature < 0)
    {
        return;
    }
    _currentTemperature -= 1;
    _showTemperatureLabel.text = [NSString stringWithFormat:@"%lu",_currentTemperature];
}

// 增加温度
- (void)addTemperatureButton:(UIButton *)sender
{
    if (_currentTemperature > 100)
    {
        return;
    }
    _currentTemperature += 1;
    _showTemperatureLabel.text = [NSString stringWithFormat:@"%lu",_currentTemperature];
}

// 剩余时间按钮选择
- (void)temperatureSelectButton:(UIButton *)sender
{
    
}

- (void)handleSwitchEvent:(ZJSwitch *)switchbutton
{
    NSLog(@"switchbutton>>>%i",switchbutton.on);
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
