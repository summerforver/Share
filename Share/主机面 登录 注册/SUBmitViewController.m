//
//  SUBmitViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/29.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "SUBmitViewController.h"
#import "REGisterViewController.h"
#import "RootViewController.h"
#import "shareViewController.h"
#import "searchViewController.h"
#import "articleViewController.h"
#import "activityViewController.h"
#import "personDetailViewController.h"
#import "SUBmitViewController.h"

@interface SUBmitViewController ()

@end

@implementation SUBmitViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    UIImageView *firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(135, 80, 110, 110)];
    UIImage *imageFirst = [UIImage imageNamed:@"login_logo"];
    firstImageView.image = imageFirst;
    
    UILabel *shareLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 190, 120, 50)];
    shareLabel.text = @"SHARE";
    shareLabel.font = [UIFont systemFontOfSize:33.0];
    shareLabel.textColor = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
    
    
    UITextField *personTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 270, 300, 50)];
    personTextField.backgroundColor = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
    personTextField.borderStyle = UITextBorderStyleRoundedRect;
    
//    personTextField.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *leftFirstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    leftFirstImageView.image = [UIImage imageNamed:@"user_img"];
    [personTextField addSubview:leftFirstImageView];
    
    
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 6, 40, 40)];
    lineImageView.image = [UIImage imageNamed:@"竖线"];
    [personTextField addSubview:lineImageView];
    
    
    UITextField *passTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 330, 300, 50)];
    passTextField.backgroundColor = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
    passTextField.borderStyle = UITextBorderStyleRoundedRect;
    

    
    
    UIImageView *leftSecondImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    leftSecondImageView.image = [UIImage imageNamed:@"pass_img"];
    [passTextField addSubview:leftSecondImageView];
    
//        passTextField.leftView = leftSecondImageView;
    //    passTextField.leftViewMode = UITextFieldViewModeAlways;
    
    UIImageView *lineSecondImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 6, 40, 40)];
    lineSecondImageView.image = [UIImage imageNamed:@"竖线"];
    [passTextField addSubview:lineSecondImageView];
//        passTextField.leftView = lineSecondImageView;
    //
    
    UIButton *submitButton = [UIButton buttonWithType:UIButtonTypeCustom];
    submitButton.frame = CGRectMake(80, 400, 90, 35);
    [submitButton setTitle:@"登陆" forState:UIControlStateNormal];
    submitButton.titleLabel.font = [UIFont systemFontOfSize:21.0];
    [submitButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    submitButton.layer.masksToBounds = YES;
    submitButton.layer.cornerRadius = 5;
    
    submitButton.layer.borderWidth = 0.5;
    submitButton.layer.borderColor = [UIColor whiteColor].CGColor;
    
    [submitButton addTarget:nil action:@selector(pressSubmit) forControlEvents:UIControlEventTouchDown];
    
    
    
    
    UIButton *loginButton = [UIButton buttonWithType:UIButtonTypeCustom];
    loginButton.frame = CGRectMake(210, 400, 90, 35);
    [loginButton setTitle:@"注册" forState:UIControlStateNormal];
    loginButton.titleLabel.font = [UIFont systemFontOfSize:21.0];
    [loginButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    loginButton.layer.masksToBounds = YES;
    loginButton.layer.cornerRadius = 5;
    
    loginButton.layer.borderWidth = 0.5;
    loginButton.layer.borderColor = [UIColor whiteColor].CGColor;
    [loginButton addTarget:nil action:@selector(pressLogin) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(30, 450, 30, 30)];
    [button setImage:[UIImage imageNamed:@"checkbox_unchecked"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"checkbox_checked"] forState:UIControlStateSelected];
    
    button.layer.borderWidth = 0.1;
    button.layer.borderColor = [UIColor blackColor].CGColor;
    
    
    UILabel *submitLabel = [[UILabel alloc] initWithFrame:CGRectMake(60, 450, 80, 30)];
    submitLabel.text = @"自动登录";
    submitLabel.font = [UIFont systemFontOfSize:15.0];
    submitLabel.textColor = [UIColor colorWithRed:0.12f green:0.34f blue:0.64f alpha:1.00f];
    
    
    
    
    [self.view addSubview:firstImageView];
    [self.view addSubview:shareLabel];
    [self.view addSubview:personTextField];
    [self.view addSubview:passTextField];
    [self.view addSubview:submitButton];
    [self.view addSubview:loginButton];
    [self.view addSubview:button];
    [self.view addSubview:submitLabel];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

//- (void)press:(UIButton *)button {
//    REGisterViewController *b = [[REGisterViewController alloc] init];
//    if (button.selected == NO) {
//        [self.navigationController pushViewController:b animated:YES];
//    }
//}

- (void)pressLogin
{
    REGisterViewController *a = [[REGisterViewController alloc] init];
    a.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.9 animations:^{
        a.view.transform = CGAffineTransformIdentity;
    }];
   
    self.view.window.rootViewController = a;
    
}

- (void)pressSubmit {
    
    UITabBarController *tabBarController = [[UITabBarController alloc] init];
    //    self.window.rootViewController = tabBarController;
    //文字颜色
    //    [[UITabBar appearance] setTintColor:[UIColor colorWithRed:0.14f green:0.14f blue:0.15f alpha:1.00f]];
    //背景颜色
    [[UITabBar appearance] setBarTintColor:[UIColor colorWithRed:0.11f green:0.11f blue:0.11f alpha:1.00f]];
    [UITabBar appearance].translucent = NO;
    //    [[UITabBar appearance] setBackgroundColor:[UIColor blackColor]];
    
    
    shareViewController *share = [[shareViewController alloc] init];
    share.tabBarItem.image = [[UIImage imageNamed:@"首页"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    share.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button1_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    searchViewController *search = [[searchViewController alloc] init];
    search.tabBarItem.image = [[UIImage imageNamed:@"搜索"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    search.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button2_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    articleViewController *article = [[articleViewController alloc] init];
    article.tabBarItem.image = [[UIImage imageNamed:@"文章"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    article.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button3_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    activityViewController *activity = [[activityViewController alloc] init];
    activity.tabBarItem.image = [[UIImage imageNamed:@"活动"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    activity.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button4_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    personDetailViewController *personDetails = [[personDetailViewController alloc] init];
    personDetails.tabBarItem.image = [[UIImage imageNamed:@"个人信息"]
        imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    personDetails.tabBarItem.selectedImage = [[UIImage imageNamed:@"radio_button5_pressed"] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal];
    
    
    UINavigationController *shareNavigationController = [[UINavigationController alloc] initWithRootViewController:share];
    UINavigationController *searchNavigationController = [[UINavigationController alloc] initWithRootViewController:search];
    UINavigationController *articleNavigationController = [[UINavigationController alloc] initWithRootViewController:article];
    UINavigationController *activityNavigationController = [[UINavigationController alloc] initWithRootViewController:activity];
    UINavigationController *personDetailsNavigationController = [[UINavigationController alloc] initWithRootViewController:personDetails];
    
    tabBarController.viewControllers = @[shareNavigationController, searchNavigationController, articleNavigationController, activityNavigationController, personDetailsNavigationController];
    
    self.view.window.rootViewController = tabBarController;
    
//    RootViewController *enter = [[RootViewController alloc] init];
//
//    enter.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
//    [UIView animateWithDuration:0.9 animations:^{
//        enter.view.transform = CGAffineTransformIdentity;
//
//    }];
//
//    self.view.window.rootViewController = enter;
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
