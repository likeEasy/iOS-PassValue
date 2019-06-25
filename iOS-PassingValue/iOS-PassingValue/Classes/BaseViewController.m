//
//  BaseViewController.m
//  iOS-PassingValue
//
//  Created by Margin on 2019/6/18.
//  Copyright © 2019 Margin. All rights reserved.
//

#import "BaseViewController.h"

@interface BaseViewController ()

@property (nonatomic, strong) UILabel *contentLabel;

@end

@implementation BaseViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self.view addSubview:self.contentLabel];
}

#pragma mark ---------------setter
- (void)setContentText:(NSString *)contentText{
    _contentText = contentText;
    
    self.contentLabel.text = contentText;
}


#pragma mark ---------------LazyLoading

- (UILabel *)contentLabel{
    if (_contentLabel == nil) {
        UILabel *label = [[UILabel alloc]initWithFrame:CGRectMake(100, 100, 200, 60)];
        label.textAlignment = NSTextAlignmentCenter;
        label.font = [UIFont systemFontOfSize:16];
    
        _contentLabel = label;
        
        [self.view addSubview:_contentLabel];
    }
    return _contentLabel;
}



@end
