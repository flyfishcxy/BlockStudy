//
//  main.m
//  Block作为函数参数
//
//  Created by chen on 2017/7/5.
//  Copyright © 2017年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

void myWork(void (^dayWork)())
{
  
    
    NSLog(@"------");
    NSLog(@"起床");
    NSLog(@"出门");
    NSLog(@"地铁");
    
    // 每天的工作内容...
    // 是一个预先准备好的代码，在需要的时候执行！
    void (^work)() = dayWork;
    work();
    
    NSLog(@"下班");
    NSLog(@"晚饭");
    NSLog(@"洗洗睡了");
    
}

void dailyWork(int day){
    

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
    myWork(work);
    
}
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        for (int i = 0; i < 6; i++) {
         
            dailyWork(i);
        }
    }
    return 0;
}
