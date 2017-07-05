//
//  main.m
//  Block基本使用
//
//  Created by chen on 2017/7/5.
//  Copyright © 2017年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

#pragma mark -- 面试题1
void demoBlock1(){
    int x = 10;
    NSLog(@"定义前 %p", &x);                 // 栈区
    
    // 提问：输出是多少？
    // 在定义block的时候，如果引用了外部变量，会对外部变量做一个copy，记录住定义block时变量的数值
    // 如果后续再修改x的值，不会影响block内部的数值变化！
    
    // 在默认情况下，不允许block内部修改外部变量的数值！因为会破坏代码的可读性，不易于维护！
    void(^myBlock)() = ^ {
        // 面试题之一
        //        x = 80;
        
        NSLog(@"%d", x);
        NSLog(@"in block %p", &x);          // 堆中的地址
    };
    
    NSLog(@"定义后 %p", &x);                 // 栈区
    x = 20;
    
    myBlock();
    
    
}
#pragma mark -- 面试题2 使用__block修改外部变量的数值
void demoBlock2(){
    // 使用 __block，说明不在关心x数值的具体变化
    __block int x = 10;
    NSLog(@"定义前 %p", &x);                 // 栈区
    
    // 如果要在block中，修改外部变量的数值，需要使用 __block 修饰符号
    // 定义block时，如果引用了外部使用__block的变量，block定义之后，外部变量的指针地址同样会变成堆区的地址
    void (^myBlock)() = ^ {
        x = 80;
        NSLog(@"in block %p", &x);          // 堆区
    };
    NSLog(@"定义后 %p", &x);                 // 堆区
    
    myBlock();
    NSLog(@"%d", x);
    
}

#pragma mark -- 面试题3 修改指针所指向的内容，修改指向的地址是不可以的
void demoBlock3() {
    
    // 指针记录的是地址
    NSMutableString *strM = [NSMutableString stringWithString:@"zhangsan"];
    NSLog(@"定义前 %p %p", strM, &strM);//&strM--栈区的地址 strM--堆地址
    
    void (^myBlock)() = ^ {
        // 修改strM指针指向的内容
        [strM setString:@"lisi"];
        NSLog(@"inblock %p %p", strM, &strM);
        
        // 这句代码是修改strM指针指向的地址
        //        strM = [NSMutableString stringWithString:@"wangwu"];
    };
    NSLog(@"定义后 %p %p", strM, &strM);
    
    myBlock();
    NSLog(@"%@", strM);
}



int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        demoBlock2();
   
    }
    return 0;
}
