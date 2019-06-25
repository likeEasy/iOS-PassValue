//
//  DelegatePassValueViewController.m
//  iOS-PassingValue
//
//  Created by Margin on 2019/6/18.
//  Copyright © 2019 Margin. All rights reserved.
//

#import "DelegatePassValueViewController.h"

@interface DelegatePassValueViewController ()

@end

@implementation DelegatePassValueViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    

    //三秒之后执行代理
    [self performSelector:@selector(sendMessage) withObject:nil afterDelay:3.0];

}


- (void)sendMessage{
    
    [self.delegate sendMessage:@"使用代理进行值传递"];
    
}

@end
