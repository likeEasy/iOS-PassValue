//
//  DelegatePassValueViewController.h
//  iOS-PassingValue
//
//  Created by Margin on 2019/6/18.
//  Copyright © 2019 Margin. All rights reserved.
//

#import "BaseViewController.h"

@protocol PassValueDelegate <NSObject>

@required//必须实现方法
-(void)sendMessage:(NSString *_Nullable)message;

@optional//可选实现方法


@end


NS_ASSUME_NONNULL_BEGIN

@interface DelegatePassValueViewController : BaseViewController

@property (nonatomic, weak) id<PassValueDelegate> delegate;



@end

NS_ASSUME_NONNULL_END
