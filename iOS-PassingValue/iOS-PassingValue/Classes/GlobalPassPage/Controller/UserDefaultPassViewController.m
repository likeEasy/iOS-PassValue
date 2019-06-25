//
//  GlobalPassViewController.m
//  iOS-PassingValue
//
//  Created by Margin on 2019/6/18.
//  Copyright © 2019 Margin. All rights reserved.
//

#import "UserDefaultPassViewController.h"

#import "ViewController.h"

@interface UserDefaultPassViewController ()

@end

@implementation UserDefaultPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    
    
    self.contentText = [defaults objectForKey:@"userDefaultString"];
}



@end
