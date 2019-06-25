//
//  BlockPassValueViewController.h
//  iOS-PassingValue
//
//  Created by Margin on 2019/6/18.
//  Copyright © 2019 Margin. All rights reserved.
//

#import "BaseViewController.h"

typedef void(^BlockPassValue)(NSString * _Nullable value);


NS_ASSUME_NONNULL_BEGIN

@interface BlockPassValueViewController : BaseViewController

@property(nonatomic ,copy) BlockPassValue blockPassValue;

@end

NS_ASSUME_NONNULL_END
