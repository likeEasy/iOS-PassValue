//
//  ViewController.m
//  iOS-PassingValue
//
//  Created by Margin on 2019/6/18.
//  Copyright © 2019 Margin. All rights reserved.
//

#import "ViewController.h"

#import "PropertyPassViewController.h"
#import "UserDefaultPassViewController.h"
#import "BlockPassValueViewController.h"
#import "DelegatePassValueViewController.h"
#import "NotificationViewController.h"


#define k_ScreenWith [UIScreen mainScreen].bounds.size.width
#define k_ScreenHeight [UIScreen mainScreen].bounds.size.height

static NSString *const cellID = @"cellIdentifier";

@interface ViewController ()<UITableViewDelegate , UITableViewDataSource , PassValueDelegate>

@property (nonatomic, strong) UITableView *mainTableView;

@property (nonatomic, strong) NSArray *dataSource;

@property (weak, nonatomic) IBOutlet UILabel *backLabel;

@end

@implementation ViewController

#pragma mark ---------------LifeCycle
- (void)viewWillLayoutSubviews{
    
    [super viewWillLayoutSubviews];
    
}

- (void)dealloc{
    //移除观察者
    [[NSNotificationCenter defaultCenter] removeObserver:self];
}


- (void)viewDidLoad {
    [super viewDidLoad];

    self.view.backgroundColor = [UIColor whiteColor];
    
    //设置数据源
    self.dataSource = @[@"属性传值",@"userDefaults传值",@"block传值",@"代理传值",@"通知传值"];
    
    //userdefaults存放
    NSUserDefaults *defaults = [NSUserDefaults standardUserDefaults];
    [defaults setObject:@"defaults传值" forKey:@"userDefaultString"];
    [defaults synchronize];//立刻强制存储，系统默认会调用
    /**常用存储方法
     - setBool:forKey:
     - setFloat:forKey:
     - setInteger:forKey:
     - setDouble:forKey:
     - setURL:forKey:
     */
    
    
    //注册通知监听者
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(receiveMessage:) name:@"passValue" object:nil];
    
    
    [self.view addSubview:self.mainTableView];
    
    
}

- (void)receiveMessage:(NSNotification *)noti{
    /**noti有三个属性--name、object、userInfo
     name: 通知时间名称，推荐使用公用宏定义，用来标识通知对象
     object: 保存发送通知的对象
     userInfo: 保存给通知接受者传递的额外信息
     */
    self.backLabel.text = noti.userInfo[@"sendMessage"];
    
    NSLog(@"-------->name: %@,object: %@,userInfo: %@",noti.name,noti.object,noti.userInfo);
}





#pragma mark ---------------tableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.dataSource.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
        
        cell.selectionStyle = UITableViewCellSelectionStyleNone;
    }
    
    cell.textLabel.text = self.dataSource[indexPath.row];
    
    return cell;
}


#pragma mark ---------------tableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 60;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.row) {
        case 0:
        {//属性传值页
            PropertyPassViewController *passVC = [[PropertyPassViewController alloc]init];
            passVC.passString = @"属性传值文本信息";
            
            [self.navigationController pushViewController:passVC animated:YES];
        }
            break;
        case 1:{//userDefaults传值
            UserDefaultPassViewController *passVC = [[UserDefaultPassViewController alloc]init];
            [self.navigationController pushViewController:passVC animated:YES];
        }
            break;
        case 2:{//block传值
            BlockPassValueViewController *passVC = [[BlockPassValueViewController alloc]init];
            __weak typeof(self) weakSelf = self;
            passVC.blockPassValue = ^(NSString * _Nullable value) {
                NSLog(@"---------------");
                weakSelf.backLabel.text = value;
            };
            [self.navigationController pushViewController:passVC animated:YES];
        }
            break;
        case 3:{//代理传值
            DelegatePassValueViewController *passVC = [[DelegatePassValueViewController alloc]init];
            passVC.delegate = self;
            
            
            [self.navigationController pushViewController:passVC animated:YES];
        }
            break;
        case 4:{
            NotificationViewController *passVC = [[NotificationViewController alloc]init];
            
             [self.navigationController pushViewController:passVC animated:YES];
        }
            break;
            
        default:
            break;
    }
    
}


#pragma mark ---------------passValueDelegate
- (void)sendMessage:(NSString *)message{
    //代理返回值进行赋值
    self.backLabel.text = message;
}



#pragma mark ---------------lazyLoading
- (UITableView *)mainTableView{
    if (_mainTableView == nil) {
        UITableView *tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, k_ScreenWith, 500) style:UITableViewStylePlain];
        tableView.backgroundColor = [UIColor whiteColor];
        
        tableView.separatorStyle = UITableViewCellSeparatorStyleSingleLine;
        
        tableView.delegate = self;
        tableView.dataSource = self;
        
        _mainTableView = tableView;
        
    }
    return _mainTableView;
}


@end
