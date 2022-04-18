//
//  GMVVMViewController.m
//  testSingature
//
//  Created by jabraknight on 2022/4/5.
//  Copyright © 2022 zk. All rights reserved.
//
//https://mp.weixin.qq.com/s/L7s8cK-0LXGUXaiAzXP3OA
#import "GMVVMViewController.h"
#import "GMVVMDelegateObj.h"
#import "Masonry.h"

//对于一个类，它不该知道的，不该做的事，就一定不要让它知道，不要让它去做，之所以要这样设计，主要是因为耦合度的问题，以后修改某个地方不会影响其他地方；并且出了问题以后，能够快速锁定问题出在哪里，因为所有的类各司其职，分工明确
//这个类的.h里面有那么多属性，这些属性有什么意义？这个属性如果我不给它赋值会有什么问题？这样会给调用方或者业务逻辑的实现方产生大量的困扰，显然是对开发很不利的。所以有些属性，该readonly就readonly，该作为私有属性就要弄成私有属性。
@interface GMVVMViewController ()
/** 代理 */
@property (nonatomic, strong) GMVVMDelegateObj *tbd_obj;
@end

@implementation GMVVMViewController

#pragma mark - LifeCycle

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"MVVM";
    self.view.backgroundColor = UIColor.whiteColor;
    [self.view addSubview:self.tableView];
    [self makeConstraints];
//这样在Controller的ViewDidLoad中只需要调用ViewModel的getData方法就相当于调用了model的getData方法，这样就开始网络请求了:
    [self.viewModel getData];
    // model跟view要在任意时刻保持同步
    // KVO
    [self _registerObeserver];

}


- (void)makeConstraints {
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo (self.view);
        make.bottom.equalTo (self.view).offset(-80);
        make.top.equalTo (self.view);
    }];
}
#pragma mark - private methods
//Controller一旦遇到和Model相关的任何问题，都可以找ViewModel要。所以，我们的keyPath就应该由ViewModel提供一个方法出来供Controller调用。
//Controller要什么，VM就给什么（和Model相关的）
- (void)_registerObeserver {
    [self.viewModel addObserver:self forKeyPath:[self.viewModel observingKeyPath] options:NSKeyValueObservingOptionNew context:nil];
}

//模拟数据源
//KVO的回调以及getter的相关代码：
#pragma mark - callback
- (void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary *)change context:(void *)context {
    
    self.tbd_obj = [GMVVMDelegateObj createTableViewDelegateWithDataList:self.viewModel
                                                                 selectBlock:^(NSIndexPath *indexPath) {
        NSLog(@"第%@行",indexPath);
    }];
    self.tableView.delegate = self.tbd_obj;
    self.tableView.dataSource = self.tbd_obj;
    [self.tableView reloadData];
}


- (void)_unregisterObserver {
    [self.viewModel removeObserver:self forKeyPath:[self.viewModel observingKeyPath]];
}
/*
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return [self.viewModel numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell * cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdf"];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"cellIdf"];
    }

    cell.textLabel.text = [self.viewModel cellTitleAtIndexPath:indexPath];
    cell.detailTextLabel.text = [self.viewModel cellDateAtIndexPath:indexPath];
    NSURL * imageUrl = [self.viewModel cellImageUrlAtIndexPath:indexPath];

    dispatch_async(dispatch_get_global_queue(0, 0), ^{


        NSData * imageData = [NSData dataWithContentsOfURL:imageUrl];
        UIImage * image = [UIImage imageWithData:imageData];

        dispatch_async(dispatch_get_main_queue(), ^{
            cell.imageView.image = image;
        });

    });

    return cell;
}

 */
#pragma mark - Getter
- (UITableView *)tableView {
    if (!_tableView) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
//        _tableView.dataSource = self;
//        _tableView.delegate = self;
        _tableView.tableFooterView = [[UIView alloc] init];
        _tableView.keyboardDismissMode = UIScrollViewKeyboardDismissModeOnDrag;
        _tableView.rowHeight = UITableViewAutomaticDimension;
        _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
        _tableView.estimatedRowHeight = 200;
    }
    return _tableView;
}

- (DHNewsViewModel *)viewModel {
    if (!_viewModel) {
        _viewModel = [[DHNewsViewModel alloc] init];
    }
    return _viewModel;
}

- (void)dealloc {
    [self _unregisterObserver];
}


#pragma mark - Public


#pragma mark - Setter


/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
