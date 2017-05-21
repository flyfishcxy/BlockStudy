//
//  EditViewController.m
//  02-视图控制器反向传值－测试循环引用
//
//  Created by chen on 2017/5/21.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "EditViewController.h"

@interface EditViewController ()
@property(nonatomic,weak)IBOutlet UITextField *name;


@end

@implementation EditViewController

- (IBAction)saveName:(id)sender {
    
    if (self.completion) {
        self.completion(self.name.text);
        
    }
    
    [self.navigationController popViewControllerAnimated:YES];
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
