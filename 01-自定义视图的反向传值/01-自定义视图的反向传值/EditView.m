//
//  EditView.m
//  01-自定义视图的反向传值
//
//  Created by chen on 2017/5/21.
//  Copyright © 2017年 chen. All rights reserved.
//

#import "EditView.h"

@interface EditView ()
@property(nonatomic,weak)IBOutlet UITextField *nameTextField;


@end

@implementation EditView

-(IBAction)saveName:(id)sender
{
    //执行块代码
    if (self.completeDemo) {
        self.completeDemo(self.nameTextField.text);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
