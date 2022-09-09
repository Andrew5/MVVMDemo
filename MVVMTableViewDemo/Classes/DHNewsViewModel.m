//
//  DHNewsViewModel.m
//  testSingature
//
//  Created by jabraknight on 2022/4/5.
//  Copyright © 2022 Jabraknight. All rights reserved.
//

#import "DHNewsViewModel.h"
/*
 1. 低耦合。视图（View）可以独立于Model变化和修改，一个ViewModel可以绑定到不同的"View"上，当View变化的时候Model可以不变，当Model变化的时候View也可以不变。
 2. 可重用性。你可以把一些视图逻辑放在一个ViewModel里面，让很多view重用这段视图逻辑。
 3. 独立开发。开发人员可以专注于业务逻辑和数据的开发（ViewModel），设计人员可以专注于页面设计，使用Expression Blend可以很容易设计界面并生成xaml代码。
 4. 可测试。界面素来是比较难于测试的，而现在测试可以针对ViewModel来写。

 */

@implementation DHNewsViewModel


#pragma mark - interface methods

- (NSString *)observingKeyPath {
    return @"model.dataList";
}

- (void)getData {
    [self.model getData];
}

#pragma mark - private methods
//数据赋值给viewmodel
- (NSDictionary *)_cellDicAtIndexPath:(NSIndexPath *)indexPath {
    return self.model.dataList[indexPath.row];
}

- (NSInteger)numberOfRowsInSection:(NSInteger)section {
    return [self.model.dataList count];
}

- (NSString *)cellTitleAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary * cellDic = [self _cellDicAtIndexPath:indexPath];
    return cellDic[@"title"];
}

- (NSString *)cellDateAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary * cellDic = [self _cellDicAtIndexPath:indexPath];
    return cellDic[@"date"];
}
- (NSURL *)cellImageUrlAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary * cellDic = [self _cellDicAtIndexPath:indexPath];
    return [NSURL URLWithString:cellDic[@"image"]];
}

- (NSString *)cellContentAtIndexPath:(NSIndexPath *)indexPath {
    NSDictionary * cellDic = [self _cellDicAtIndexPath:indexPath];
    return cellDic[@"content"];
}

#pragma mark - getter
- (DHNewsModel *)model {
    if (!_model) {
        _model = [[DHNewsModel alloc] init];
    }
    return _model;
}


@end
