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
    
    
    UIImageView *leftFirstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 40)];
    leftFirstImageView.image = [UIImage imageNamed:@"email_img"];
    
    
    UIImageView *lineImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 6, 40, 40)];
    lineImageView.image = [UIImage imageNamed:@"竖线"];
    
    UITextField *messageTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 270, 300, 50)];
    messageTextField.backgroundColor = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
    messageTextField.borderStyle = UITextBorderStyleRoundedRect;
    messageTextField.leftView = leftFirstImageView;
    messageTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [messageTextField addSubview:leftFirstImageView];
    
    
    [messageTextField addSubview:lineImageView];
    
    
    UIImageView *leftSecondImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 40)];
    leftSecondImageView.image = [UIImage imageNamed:@"user_img"];
    
    UIImageView *lineSecondImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 6, 40, 40)];
    lineSecondImageView.image = [UIImage imageNamed:@"竖线"];
    
    
    _personTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 330, 300, 50)];
    _personTextField.backgroundColor = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
    _personTextField.borderStyle = UITextBorderStyleRoundedRect;
    _personTextField.leftView = leftSecondImageView;
    _personTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [_personTextField addSubview:leftSecondImageView];
    
    
    [_personTextField addSubview:lineSecondImageView];
    
    
    UIImageView *leftThirdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(5, 5, 50, 40)];
    leftThirdImageView.image = [UIImage imageNamed:@"pass_img"];
    
    UIImageView *lineThirdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 6, 40, 40)];
    lineThirdImageView.image = [UIImage imageNamed:@"竖线"];
    
    _passTextField = [[UITextField alloc] initWithFrame:CGRectMake(40, 390, 300, 50)];
    _passTextField.backgroundColor = [UIColor colorWithRed:1.00f green:1.00f blue:1.00f alpha:1.00f];
    _passTextField.borderStyle = UITextBorderStyleRoundedRect;
    _passTextField.leftView = leftThirdImageView;
    _passTextField.leftViewMode = UITextFieldViewModeAlways;
    
    [_passTextField addSubview:leftThirdImageView];
    
    
    [_passTextField addSubview:lineThirdImageView];
    
    
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
    [button addTarget:self action:@selector(pressLogin) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:firstImageView];
    [self.view addSubview:shareLabel];
    [self.view addSubview:messageTextField];
    [self.view addSubview:_personTextField];
    [self.view addSubview:_passTextField];
    [self.view addSubview:button];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)pressLogin
{
//    SUBmitViewController *enter = [[SUBmitViewController alloc] init];
//    enter.view.transform = CGAffineTransformMakeScale(0.2, 0.2);
//    [UIView animateWithDuration:0.9 animations:^{
//        enter.view.transform = CGAffineTransformIdentity;
//    }];
    
//    self.returnTextBlock(self.personTextField.text);
    
//    a.str1 = _personTextField.text;
//    a.str2 = _passTextField.text;
    
    [self dismissViewControllerAnimated:YES completion:nil];
//    self.view.window.rootViewController = a;
//    [self dismissViewControllerAnimated:YES completion:nil];
//    [self presentedViewController:enter animated: YES completion: nil];
    //[self presentViewController:enter animated:YES completion:nil];
//    self.view.window.rootViewController = enter;
    
}

//把传进来的Block语句块保存到本类的实例变量returnTextBlock（.h中定义的属性）中，然后寻找一个时机调用
-(void)returnText:(ReturnTextBlock)block{
    self.returnTextBlock = block;
}
//而这个时机就是当视图将要消失的时候，需要重写：
-(void)viewWillDisappear:(BOOL)animated{
    if (self.returnTextBlock != nil) {
       self.returnTextBlock(self.personTextField.text,self.passTextField.text);
        
    }
}
//- (void)doButton{
//    [self dismissViewControllerAnimated:YES completion:nil];
//}

- (void)keyboardWillDisAppear:(NSNotification *)notification{
    // 第一个参数是动画持续时间
    // 第二个参数是方法，这里让视图恢复原来的位置就好
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

- (void)keyboardWillAppear:(NSNotification *)notification{
    // 计算键盘高度
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    // 视图整体上升，这里的64是状态栏高度
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - 530);}];
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
