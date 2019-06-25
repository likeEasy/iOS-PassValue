//
//  BlockPassValueViewController.m
//  iOS-PassingValue
//
//  Created by Margin on 2019/6/18.
//  Copyright © 2019 Margin. All rights reserved.
//

#import "BlockPassValueViewController.h"

@interface BlockPassValueViewController ()

@end

@implementation BlockPassValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    //三秒之后进行反向传值
    [self performSelector:@selector(sendValuesBack) withObject:nil afterDelay:3.0];
}


- (void)sendValuesBack{
    
    if (self.blockPassValue) {
        self.blockPassValue(@"使用block进行值传递");
    }
    
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
