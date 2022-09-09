//
//  DHNewsViewModel.h
//  testSingature
//
//  Created by jabraknight on 2022/4/5.
//  Copyright © 2022 Jabraknight. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DHNewsModel.h"
#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void (^callback) (NSArray *array);

@interface DHNewsViewModel : NSObject

@property (nonatomic, strong) DHNewsModel * model;
- (NSString *)observingKeyPath;

- (void)getData;
//提供方法给Controller来计算第section个分组下面应该有多少行cell：
- (NSInteger)numberOfRowsInSection:(NSInteger)section;

- (NSString *)cellTitleAtIndexPath:(NSIndexPath *)indexPath;
- (NSString *)cellDateAtIndexPath:(NSIndexPath *)indexPath;
- (NSURL *)cellImageUrlAtIndexPath:(NSIndexPath *)indexPath;

- (NSString *)cellContentAtIndexPath:(NSIndexPath *)indexPath;

//通过此方法 把model里的数据赋值给viewmodel
- (NSDictionary *)_cellDicAtIndexPath:(NSIndexPath *)indexPath;

@end

NS_ASSUME_NONNULL_END
