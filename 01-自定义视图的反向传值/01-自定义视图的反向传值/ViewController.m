//
//  ViewController.m
//  01-自定义视图的反向传值
//
//  Created by chen on 2017/5/21.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "ViewController.h"
#import "EditView.h"


@interface ViewController ()
@property (weak, nonatomic) IBOutlet UILabel *displayNameLabel;
@property (weak, nonatomic) IBOutlet EditView *editView;


@end



@implementation ViewController

/**
 block的陷阱--有可能会出现循环引用
 解决方法:
 1. 要对内存对象之间的引用关系要清楚
 技巧：
 1. 在block中碰到self，要格外小心，有可能出现循环引用，通常最好思考一下。
 2. 利用dealloc协助判断，如果不能被正常释放就说明有循环引用。
 
 */
- (void)viewDidLoad {
    [super viewDidLoad];
    
    
//   这种写法就会造成循环引用
//    self.editView.completeDemo = ^(NSString *name){
//        
//        self.displayNameLabel.text = name;
//    };
    
    //准备快代码
    //block在引用外部变量self时候，会自动做一次copy操作
    //在oc中定义变量，默认都是强引用，使用__weak可以变成弱引用。
    
    //   这种写法用__weak关键字，避免了循环引用，
   __weak ViewController *weakSelf = self;
    self.editView.completeDemo = ^(NSString *name){
      
        weakSelf.displayNameLabel.text = name;
    };
    
}

-(void)dealloc{
    NSLog(@"调用 我走了  = %s",__func__);
}


@end
