//
//  main.m
//  Block作为返回值
//
//  Created by chen on 2017/7/5.
//  Copyright © 2017年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^workBlock)();

workBlock workFunc(int day);
//workBlock -- 函数的返回值
//workFunc -- 函数名
//int day -- 函数参数


//解决思路：
//设置一个 day 的参数，根据day来决定具体执行哪个块代码
//
//新的尝试：block当作返回值



workBlock workFunc(int day){
    
    void (^work)();
    
    
    switch (day) {
        case 0:
            work = ^{
                NSLog(@"新员工入职");
                NSLog(@"开通svn");
                NSLog(@"看程序");
            };
            break;
            
        case 1:
            work = ^{
                NSLog(@"看需求文档");
            };
            break;
            
        case 2:
            work = ^{
                NSLog(@"写程序");
            };
            break;
            
        case 3:
            work = ^{
                NSLog(@"测试");
            };
            break;
        case 4:
            work = ^{
                NSLog(@"上架");
            };
            break;
            
            
        default:
            work = ^{
                NSLog(@"休息");
            };
            break;
            
    }
    
    return work;

}

void myWork(int day){
    NSLog(@"------");
    NSLog(@"起床");
    NSLog(@"出门");
    NSLog(@"地铁");
    
    // 每天的工作内容...
    // 如果有一个函数能够返回一个block
    workBlock block = workFunc(day);
    block();
    
    NSLog(@"下班");
    NSLog(@"晚饭");
    NSLog(@"洗洗睡了");
    
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        for (int i = 0; i < 7; i++) {
            myWork(i);
        }
    }
    return 0;
}
