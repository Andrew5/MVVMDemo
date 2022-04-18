//
//  GMVVMViewController.h
//  testSingature
//
//  Created by jabraknight on 2022/4/5.
//  Copyright © 2022 zk. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DHNewsViewModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface GMVVMViewController : UIViewController
@property (nonatomic, strong) UITableView * tableView;
//Controller持有ViewModel，ViewModel持有Model，这样的话我们在Controller里面注册观察者就只能给ViewModel来添加观察者
@property (nonatomic, strong) DHNewsViewModel * viewModel;

- (void)_registerObeserver;
- (void)_unregisterObserver;
@end

NS_ASSUME_NONNULL_END
