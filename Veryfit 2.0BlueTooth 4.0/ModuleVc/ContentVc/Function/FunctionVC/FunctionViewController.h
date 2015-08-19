//
//  FunctionViewController.h
//  Warm
//
//  Created by 黄建华 on 15/8/18.
//  Copyright (c) 2015年 kenny. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NavViewController.h"

@interface FunctionViewController : NavViewController

- (IBAction)photoControl:(NavButton *)sender;
@property (weak, nonatomic) IBOutlet NavButton *photoControl;

@end
