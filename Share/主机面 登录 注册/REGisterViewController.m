//
//  REGisterViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "REGisterViewController.h"
#import "SUBmitViewController.h"

@interface REGisterViewController ()

@end

@implementation REGisterViewController

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
    
    UITextField *messageTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 270, 300, 50)];
    messageTextField.backgroundColor = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
    messageTextField.borderStyle = UITextBorderStyleRoundedRect;
    UIImageView *leftFirstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    leftFirstImageView.image = [UIImage imageNamed:@"email_img"];
    [messageTextField addSubview:leftFirstImageView];
    
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 6, 40, 40)];
    lineImageView.image = [UIImage imageNamed:@"竖线"];
    [messageTextField addSubview:lineImageView];
    
    
    UITextField *personTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 330, 300, 50)];
    personTextField.backgroundColor = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
    personTextField.borderStyle = UITextBorderStyleRoundedRect;
    UIImageView *leftSecondImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    leftSecondImageView.image = [UIImage imageNamed:@"user_img"];
    [personTextField addSubview:leftSecondImageView];
    
    UIImageView *lineSecondImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 6, 40, 40)];
    lineSecondImageView.image = [UIImage imageNamed:@"竖线"];
    [personTextField addSubview:lineSecondImageView];
    
    
    UITextField *passTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 390, 300, 50)];
    passTextField.backgroundColor = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
    passTextField.borderStyle = UITextBorderStyleRoundedRect;
    UIImageView *leftThirdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 40, 40)];
    leftThirdImageView.image = [UIImage imageNamed:@"pass_img"];
    [passTextField addSubview:leftThirdImageView];
    
    UIImageView *lineThirdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 6, 40, 40)];
    lineThirdImageView.image = [UIImage imageNamed:@"竖线"];
    [passTextField addSubview:lineThirdImageView];
    
    
    //    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    UIButton *button = [[UIButton alloc] init];
    button.frame = CGRectMake(120, 480, 130, 35);
    [button setTitle:@"确认注册" forState:UIControlStateNormal];
    button.titleLabel.font = [UIFont systemFontOfSize:21.0];
    [button setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    button.layer.masksToBounds = YES;
    button.layer.cornerRadius = 5;
    
    button.layer.borderWidth = 0.5;
    button.layer.borderColor = [UIColor whiteColor].CGColor;
    [button addTarget:nil action:@selector(pressLogin) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:firstImageView];
    [self.view addSubview:shareLabel];
    [self.view addSubview:messageTextField];
    [self.view addSubview:personTextField];
    [self.view addSubview:passTextField];
    [self.view addSubview:button];
    
}

- (void)pressLogin
{
    SUBmitViewController *enter = [[SUBmitViewController alloc] init];
    enter.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
    [UIView animateWithDuration:0.9 animations:^{
        enter.view.transform = CGAffineTransformIdentity;
    }];
    
    //[self presentViewController:enter animated:YES completion:nil];
    self.view.window.rootViewController = enter;
    
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
