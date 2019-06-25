//
//  PropertyPassViewController.m
//  iOS-PassingValue
//
//  Created by Margin on 2019/6/18.
//  Copyright © 2019 Margin. All rights reserved.
//

#import "PropertyPassViewController.h"

@interface PropertyPassViewController ()

@end

@implementation PropertyPassViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    self.contentText = self.passString ? self.passString:@"";

}



@end
