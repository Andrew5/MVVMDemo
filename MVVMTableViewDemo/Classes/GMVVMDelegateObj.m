//
//  GMVVMDelegateObj.m
//  testSingature
//
//  Created by jabraknight on 2022/4/18.
//  Copyright © 2022 Jabraknight. All rights reserved.
//

#import "GMVVMDelegateObj.h"
#import "CustomTableViewCell.h"

@interface GMVVMDelegateObj ()

@property (nonatomic, strong) DHNewsViewModel   *dataList;
@property (nonatomic,   copy) selectCell selectBlock;

@end

@implementation GMVVMDelegateObj

+ (instancetype)createTableViewDelegateWithDataList:(DHNewsViewModel *)dataList
                                        selectBlock:(selectCell)selectBlock {
    return [[[self class] alloc] initTableViewDelegateWithDataList:dataList
                                                       selectBlock:selectBlock];
}
 
- (instancetype)initTableViewDelegateWithDataList:(DHNewsViewModel *)dataList selectBlock:(selectCell)selectBlock {
    self = [super init];
    if (self) {
        self.dataList = dataList;
        self.selectBlock = selectBlock;
    }
    return self;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewAutomaticDimension;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return [self.dataList numberOfRowsInSection:section];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CustomTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    if (cell == nil) {
        cell = [[CustomTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"Cell"];
    }
    cell.titlestr = [self.dataList cellTitleAtIndexPath:indexPath];
    cell.titlestrstr = [self.dataList cellContentAtIndexPath:indexPath];
    NSURL * imageUrl = [self.dataList cellImageUrlAtIndexPath:indexPath];

    dispatch_async(dispatch_get_global_queue(0, 0), ^{
        NSData * imageData = [NSData dataWithContentsOfURL:imageUrl];
        UIImage * image = [UIImage imageWithData:imageData];
        dispatch_async(dispatch_get_main_queue(), ^{
            cell.imageView.image = image;
        });
    });
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
    NSLog(@"输出--%@",[self.dataList cellTitleAtIndexPath:indexPath]);
    // 将点击事件通过block的方式传递出去
    if (self.selectBlock){
        self.selectBlock(indexPath);
    }
}
@end
