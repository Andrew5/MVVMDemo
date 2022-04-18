//
//  DHNewsModel.h
//  testSingature
//
//  Created by jabraknight on 2022/3/26.
//  Copyright © 2022 zk. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
//Model的头文件应该有两个方法：一个只读属性用来存数据、一个实例方法用来取数据：
@interface DHNewsModel : NSObject
//存数据
@property (nonatomic, strong, readonly) id dataList;
@property (nonatomic,strong) NSString *title;

//取数据
- (void)getData;
@end

NS_ASSUME_NONNULL_END
