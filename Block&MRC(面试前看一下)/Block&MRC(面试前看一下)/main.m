//
//  main.m
//  Block&MRC(面试前看一下)
//
//  Created by chen on 2017/7/5.
//  Copyright © 2017年 chen. All rights reserved.
//

#import <Foundation/Foundation.h>

//块代码可以当做参数，也可以当做返回值
typedef void(^eBlock)();
/**
 问
 －以下代码在ARC中有问题吗？＝》没有问题
 －在MRC中有问题吗？存在内存隐患，i和b都是局部变量，出了作用域就会被释放
 
 解决问题：
 －返回前使用     Block_copy
 －使用后，使用   Block_release
 
 网上错误答案 return [b copy];
 
 *********
 Product - Analyze （静态分析）
 
 从代码结构上分析是否存在缺陷！本身并不会运行程序！并不能够检测到真正的内存泄漏！
 
 但是：只要是静态分析工具发现的问题，通常都是需要提升的代码！
 
 静态分析工具，是MRC开发时的利器！提前发现内存隐患！
 
 另外，在ARC开发时，如果程序要上架之前，建议使用静态分析工具检测一下，通常可以发现一些不注意的警告，有助于提升代码质量！尤其在使用到C语言框架的代码！
 */

eBlock myBlock (){
    int i = 10;
    eBlock b = ^ {
        NSLog(@"hello %d", i);
    };
    return  Block_copy(b);
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        eBlock bb = myBlock();
        bb();
        
        Block_release(bb);
    }
    return 0;
}
