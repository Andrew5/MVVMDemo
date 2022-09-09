//
//  DHNewsModel.m
//  testSingature
//
//  Created by jabraknight on 2022/3/26.
//  Copyright © 2022 Jabraknight. All rights reserved.
//

#import "DHNewsModel.h"
@interface DHNewsModel ()

@property (nonatomic, strong) id dataList;

@end
@implementation DHNewsModel
//调用网络请求
- (void)getData {
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        self.dataList = @[
        @{
            @"addressname":@"标题1",
            @"name":@"name1",
            @"title":@"新闻一",
            @"date":@"2016-01-25",
            @"image":@"http://g.hiphotos.baidu.com/image/h%3D300/sign=bd5cccb88b5494ee982209191df4e0e1/c2cec3fdfc039245980aac088094a4c27d1e257d.jpg",
            @"content":@"加快开发效率，如果我们在一个大工程进行迭代开发，常常编译时间就很长，如果你开发的是一个入口比较深的模块，开发调试时，仅仅修改了一下UI界面位置等，重新编译运行然后再点点点到对应界面，常常浪费很多时间。而将模块拆成单独一个可执行的工程后，编译运行调试的时间大大缩减"},
          @{
              @"addressname":@"标题2",
              @"name":@"name2",
              @"title":@"新闻二",
              @"date":@"2016-01-27",
              @"image":@"http://a.hiphotos.baidu.com/image/h%3D300/sign=8d9d3903900a304e4d22a6fae1c9a7c3/ac4bd11373f082022a2ddc384cfbfbedab641b7d.jpg",
              @"content":@""},//并行开发，由于每个子工程都可以进行单独的版本控制，子工程在开发新功能中时，主工程可依赖低版本的子工程，不影响主工程的运行
          @{
              @"addressname":@"标题3",
              @"name":@"name3",
              @"title":@"新闻三",
              @"date":@"2016-01-29",
              @"image":@"http://a.hiphotos.baidu.com/image/h%3D300/sign=8d9d3903900a304e4d22a6fae1c9a7c3/ac4bd11373f082022a2ddc384cfbfbedab641b7d.jpg",
              @"content":@"分工性提高，不同子工程可由不同人员甚至不同团队负责"}
        ];
    });
}


@end
