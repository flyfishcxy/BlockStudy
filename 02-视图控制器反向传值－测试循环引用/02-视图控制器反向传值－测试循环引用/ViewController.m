//
//  ViewController.m
//  02-视图控制器反向传值－测试循环引用
//
//  Created by chen on 2017/5/21.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "ViewController.h"
#import "EditViewController.h"

@interface ViewController ()

@property(nonatomic,weak) IBOutlet UILabel *nameLabel;
@property(nonatomic,strong)EditViewController *editVC;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    
}


-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    
    __weak ViewController *weakSelf = self;
    EditViewController *vc = segue.destinationViewController;
    vc.completion = ^(NSString *str){
        weakSelf.nameLabel.text = str;
    };
}


- (void)dealloc {
    
    NSLog(@"我走了....");

}


@end
