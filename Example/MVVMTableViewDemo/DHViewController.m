//
//  DHViewController.m
//  MVVMTableViewDemo
//
//  Created by localhost3585@gmail.com on 04/18/2022.
//  Copyright (c) 2022 localhost3585@gmail.com. All rights reserved.
//

#import "DHViewController.h"
#import "GMVVMViewController.h"

@interface DHViewController ()

@end

@implementation DHViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    button.frame = CGRectMake(10, 100, 100, 30);
    button.layer.borderColor = [UIColor orangeColor].CGColor;
    button.layer.borderWidth = 1.0;
    [button setTitle:@"mvvm" forState:(UIControlStateNormal)];
    [button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:14];
    button.titleLabel.textAlignment = NSTextAlignmentCenter;
    [button addTarget:self action:@selector(pushpage) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button];
   
}

- (void)pushpage {
    GMVVMViewController *controller = GMVVMViewController.alloc.init;
//    [self.navigationController pushViewController:controller animated:YES];

    [self presentViewController:controller animated:YES completion:^{
    }];
}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
