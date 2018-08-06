//
//  CPViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "CPViewController.h"
#import "CPTableViewCell.h"

@interface CPViewController ()<UIGestureRecognizerDelegate>

@end

@implementation CPViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    leftButton.tintColor = [UIColor colorWithRed:0.99f green:1.00f blue:1.00f alpha:1.00f];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 60, 375, 160)];
    //    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    self.tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.tableView registerClass:[CPTableViewCell class] forCellReuseIdentifier:@"firstCell"];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(150, 260, 90, 30)];
    [button setTitle:@"提交" forState:UIControlStateNormal];
   
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    button.backgroundColor = [UIColor blackColor];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    
    [button addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:button];
    
    
    [self.view addSubview:_tableView];
    id target = self.navigationController.interactivePopGestureRecognizer.delegate;
    // 创建全屏滑动手势，调用系统自带滑动手势的target的action方法
    UIPanGestureRecognizer *pan = [[UIPanGestureRecognizer alloc] initWithTarget:target action:@selector(handleNavigationTransition:)];
    // 设置手势代理，拦截手势触发
    pan.delegate = self;
    // 给导航控制器的view添加全屏滑动手势
    [self.view addGestureRecognizer:pan];
    // 禁止使用系统自带的滑动手势
    self.navigationController.interactivePopGestureRecognizer.enabled = NO;
}
- (void)handleNavigationTransition:(UIPanGestureRecognizer *)pan {
    NSLog(@"左滑");
}

- (BOOL)gestureRecognizerShouldBegin:(UIGestureRecognizer *)gestureRecognizer
{
    // 注意：只有非根控制器才有滑动返回功能，根控制器没有。
    // 判断导航控制器是否只有一个子控制器，如果只有一个子控制器，肯定是根控制器
    if (self.childViewControllers.count == 1) {
        // 表示用户在根控制器界面，就不需要触发滑动手势，
        return NO;
    }
    return YES;
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //    return 5;
//    return 2;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //    return 1;
//    if (section == 0) {
//        return 3;
//    } else {
//        return 1;
//    }
//
    return 3;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 3) {
//        return 600;
//    } else {
//        return 50;
//    }
    return 50;
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @" ";
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @" ";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
  
    return 0;
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 2;
    } else {
        return 0.0001;
    }
    
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    view.tintColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    NSArray *array = [NSArray arrayWithObjects:@"旧密码", @"新密码", @"确认密码", nil];
    NSArray *firstArray = [NSArray arrayWithObjects:@"6-20英文或数字组合", @"6-20英文或数字组合", @"请再次确认输入密码", nil];
//    if (indexPath.section == 1) {
//        UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];
//        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"cell"];
//
//        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(150, 40, 70, 30)];
//        [button setTitle:@"提交" forState:UIControlStateNormal];
//        button.layer.masksToBounds = YES;
//        button.layer.cornerRadius = 5;
//        button.backgroundColor = [UIColor blackColor];
//        [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
//        [cell.contentView addSubview:button];
//
//        return cell;
//    } else {
//
        CPTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
        firstCell.label.text = array[indexPath.row];
    
    firstCell.textField.tag = indexPath.row;
    
        firstCell.textField.placeholder = firstArray[indexPath.row];
    [firstCell.textField addTarget:self action:@selector(textFieldDidChange:) forControlEvents:UIControlEventEditingChanged];
    
//    if (indexPath.row == 1) {
//        self.str1 = firstCell.textField.text;
//    }
//    if (indexPath.row == 2) {
//        self.str2 = firstCell.textField.text;
//    }
    
        firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return firstCell;
//    }
}

- (void)textFieldDidChange:(UITextField *)textField {
    if (textField.tag == 1) {
        self.str1 = textField.text;
    }
    if (textField.tag == 2) {
        self.str2 = textField.text;
    }
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    UITouch * touch = touches.anyObject;//获取触摸对象
//    NSLog(@"%@",touch);
    [self.tableView endEditing:YES];
    [self.view endEditing:YES];
}

- (void)pressLeft {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)press:(UIButton *)sender {
    
    if (_str1 != nil && _str2 != nil) {
        if ([_str1 isEqualToString: _str2]) {
            [sender setTitle:@"提交成功" forState:UIControlStateSelected];
            
            //           sender.selected = NO;
        } else {
            [sender setTitle:@"提交失败" forState:UIControlStateSelected];
            
            //           sender.selected = NO;
        }
        
    } else {
        UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"请输入新密码" message:@" " preferredStyle:UIAlertControllerStyleAlert];
//        NSMutableAttributedString *titleText = [[NSMutableAttributedString alloc] initWithString:@"请输入新密码"];
//        [titleText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:18] range:NSMakeRange(0, 8)];
//        [titleText addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 8)];
//        [alert setValue:titleText forKey:@"attributedTitle"];
        
        UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            //响应事件
            NSLog(@"action = %@", action);
        }];
        UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault handler:^(UIAlertAction * action) {
            //响应事件
            NSLog(@"action = %@", action);
        }];
        
        [alert addAction:defaultAction];
        [alert addAction:cancelAction];
        alert.view.tintColor = [UIColor blackColor];
        [self presentViewController:alert animated:YES completion:nil];
        
    }
    
    sender.selected = !sender.selected;
   
    
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
