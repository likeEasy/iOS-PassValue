//
//  NotificationViewController.m
//  iOS-PassingValue
//
//  Created by Margin on 2019/6/18.
//  Copyright © 2019 Margin. All rights reserved.
//

#import "NotificationViewController.h"

@interface NotificationViewController ()

@end

@implementation NotificationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    //设置数据源
    NSDictionary *dic = @{@"sendMessage":@"使用通知进行值传递"};
    //创建通知
    NSNotification *notification = [NSNotification notificationWithName:@"passValue" object:self userInfo:dic];
    
    //三秒之后发送通知
    [self performSelector:@selector(sendNoti:) withObject:notification afterDelay:3.0];
}

- (void)sendNoti:(NSNotification *)noti{
     //使用通知中心发送通知
    [[NSNotificationCenter defaultCenter]postNotification:noti];

}


@end
