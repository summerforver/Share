//
//  UploadViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/31.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "UploadViewController.h"
#import "SelectedViewController.h"
#import "fieldTextView.h"

@interface UploadViewController ()<UIGestureRecognizerDelegate, UITextViewDelegate, UITableViewDelegate, UITableViewDataSource>

@end

@implementation UploadViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    leftButton.tintColor = [UIColor colorWithRed:0.99f green:1.00f blue:1.00f alpha:1.00f];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    [self creatButton];
    
    
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

- (void)creatButton {
    UIImageView *FirstImageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"选择图片"]];
    FirstImageView.frame = CGRectMake(10, 80, 200, 110);
    FirstImageView.userInteractionEnabled= YES;
    [self.view addSubview:FirstImageView];
    
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(tapClick:)];
    //手势相关属性
    tapGesture.numberOfTapsRequired = 1;
    tapGesture.numberOfTouchesRequired = 1;
    [FirstImageView addGestureRecognizer:tapGesture];
    
    UILabel *firstlabel = [[UILabel alloc] initWithFrame:CGRectMake(255, 110, 80, 20)];
    firstlabel.text = @"陕西省西安市";
    firstlabel.textAlignment = NSTextAlignmentCenter;
    firstlabel.font = [UIFont systemFontOfSize:12.0];
    firstlabel.layer.cornerRadius = 8;
    firstlabel.layer.masksToBounds = YES;
    firstlabel.backgroundColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    firstlabel.textColor = [UIColor whiteColor];
    [self.view addSubview:firstlabel];
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(230, 110,  20, 20)];
    [btn setImage:[UIImage imageNamed:@"定位"] forState:UIControlStateNormal];
    [self.view addSubview:btn];
    
    
    UIButton *leftButton = [[UIButton alloc]initWithFrame:CGRectMake(230, 140, 80, 30)];
    leftButton.backgroundColor = [UIColor lightGrayColor];
    [self.view addSubview:leftButton];
    
    
    UIButton *rightButton = [[UIButton alloc] initWithFrame:CGRectMake(310, 140, 30, 30)];
    [rightButton setImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateNormal];
//    [rightButton setImage:[UIImage imageNamed:@"按钮"] forState:UIControlStateSelected];
    [rightButton addTarget:self action:@selector(rightButton:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:rightButton];

//    UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(230, 179, 80, 50) style:UITableViewStyleGrouped];
//    tableView.delegate = self;
//    tableView.dataSource = self;
//    tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
//
//    [self.view addSubview:tableView];
    
    
    
    
    UIButton *firstButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 220, 80, 30)];
    [firstButton setTitle:@"平面设计" forState:UIControlStateNormal];
    firstButton.backgroundColor = [UIColor whiteColor];
    [firstButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    firstButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    firstButton.layer.masksToBounds = YES;
    firstButton.layer.cornerRadius = 5;
    [firstButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *secondButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 220, 80, 30)];
    [secondButton setTitle:@"网页设计" forState:UIControlStateNormal];
    secondButton.backgroundColor = [UIColor whiteColor];
    [secondButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    secondButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    secondButton.layer.masksToBounds = YES;
    secondButton.layer.cornerRadius = 5;
    [secondButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *thirdButton = [[UIButton alloc] initWithFrame:CGRectMake(190, 220, 80, 30)];
    [thirdButton setTitle:@"UI/icon" forState:UIControlStateNormal];
    thirdButton.backgroundColor = [UIColor whiteColor];
    [thirdButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    thirdButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    thirdButton.layer.masksToBounds = YES;
    thirdButton.layer.cornerRadius = 5;
    [thirdButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *forthButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 220, 85, 30)];
    [forthButton setTitle:@"插画/手绘" forState:UIControlStateNormal];
    forthButton.backgroundColor = [UIColor whiteColor];
    [forthButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    forthButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    forthButton.layer.masksToBounds = YES;
    forthButton.layer.cornerRadius = 5;
    [forthButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *fifthButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 260, 90, 30)];
    [fifthButton setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    fifthButton.backgroundColor = [UIColor whiteColor];
    [fifthButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    fifthButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    fifthButton.layer.masksToBounds = YES;
    fifthButton.layer.cornerRadius = 5;
    [fifthButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *sixthButton = [[UIButton alloc] initWithFrame:CGRectMake(110, 260, 80, 30)];
    [sixthButton setTitle:@"影视" forState:UIControlStateNormal];
    sixthButton.backgroundColor = [UIColor whiteColor];
    [sixthButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    sixthButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    sixthButton.layer.masksToBounds = YES;
    sixthButton.layer.cornerRadius = 5;
    [sixthButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *sevenButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 260, 75, 30)];
    [sevenButton setTitle:@"摄影" forState:UIControlStateNormal];
    sevenButton.backgroundColor = [UIColor whiteColor];
    [sevenButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    sevenButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    sevenButton.layer.masksToBounds = YES;
    sevenButton.layer.cornerRadius = 5;
    [sevenButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *eightButton = [[UIButton alloc] initWithFrame:CGRectMake(285, 260, 80, 30)];
    [eightButton setTitle:@"其他" forState:UIControlStateNormal];
    eightButton.backgroundColor = [UIColor whiteColor];
    [eightButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    eightButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    eightButton.layer.masksToBounds = YES;
    eightButton.layer.cornerRadius = 5;
    [eightButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    UITextField *titleTextField = [[UITextField alloc] initWithFrame:CGRectMake(0, 310, 375, 25)];
    UIImageView *iv = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 3, 25)];
    titleTextField.backgroundColor = [UIColor whiteColor];
    titleTextField.placeholder = @" 作品名称";
    titleTextField.font = [UIFont systemFontOfSize:14.0];
    titleTextField.leftView = iv;
    titleTextField.leftViewMode = UITextFieldViewModeAlways;
    
    
    fieldTextView *textView = [[fieldTextView alloc] initWithFrame:CGRectMake(0, 350, 375, 90)];
    textView.backgroundColor = [UIColor whiteColor];
    textView.placeholderColor = [UIColor colorWithRed:0.80f green:0.80f blue:0.80f alpha:1.00f];
    textView.placeholder = @"请添加作品的名称和介绍";
    textView.font = [UIFont systemFontOfSize:14];
    textView.delegate = self;
    //textView.layer.borderWidth =1;
    textView.layer.borderColor =[UIColor whiteColor].CGColor;
    //[textView.layer setCornerRadius:10.0f];
    
//    // 创建textView
//    UITextView *textView =[[UITextView alloc]initWithFrame:CGRectMake(0, 350, 375, 90)];
//    textView.backgroundColor= [UIColor whiteColor];
//    textView.font = [UIFont systemFontOfSize:14.0]；
//    textView.text = @"请添加作品的名称和介绍";
//    textView.textColor = [UIColor colorWithRed:0.85f green:0.85f blue:0.85f alpha:1.00f];
//    textView.delegate = self;
    [self.view addSubview:textView];
    
    
    
    
    UIButton *fabuButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 460, 355, 50)];
    fabuButton.backgroundColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    fabuButton.layer.cornerRadius = 1;
    fabuButton.layer.masksToBounds = YES;
    [fabuButton setTitle:@"发布" forState:UIControlStateNormal];
    [fabuButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [fabuButton setTitleColor:[UIColor lightGrayColor] forState:UIControlStateSelected];
    [fabuButton addTarget:self action:@selector(pressDown:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *forbidButton = [[UIButton alloc] initWithFrame:CGRectMake(5, 520, 80, 20)];
    [forbidButton setImage:[UIImage imageNamed:@"checkbox_unchecked"] forState:UIControlStateNormal];
    [forbidButton setImage:[UIImage imageNamed:@"checkbox_checked"] forState:UIControlStateSelected];
    [forbidButton setTitle:@" 禁止下载" forState:UIControlStateNormal];
    forbidButton.tintColor = [UIColor lightGrayColor];
    forbidButton.titleLabel.font = [UIFont systemFontOfSize:12.0];
    [forbidButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [forbidButton addTarget:self action:@selector(pressButton:) forControlEvents:UIControlEventTouchDown];
    
    [self.view addSubview:forbidButton];
    [self.view addSubview:fabuButton];
    
    
    [self.view addSubview:firstButton];
    [self.view addSubview:secondButton];
    [self.view addSubview:thirdButton];
    [self.view addSubview:forthButton];
    [self.view addSubview:fifthButton];
    [self.view addSubview:sixthButton];
    [self.view addSubview:sevenButton];
    [self.view addSubview:eightButton];
    [self.view addSubview:titleTextField];

}

- (void)textViewDidChange:(fieldTextView *)textView

{

    if([textView.placeholder length] == 0)
    {
        return;
    }
    if([textView.placeholder length]  == 0)
    {
        [textView.placeHolderLabel setAlpha:1];
    }
    else
    {
        [textView.placeHolderLabel  setAlpha:0];
    }

    if ([textView.text isEqualToString:@""]) {
        [textView.placeHolderLabel setAlpha:1];
    }
}

//- (void)textViewDidEndEditing:(UITextView *)textView
//{
//    if(textView.text.length < 1){
//        textView.text = @"请添加作品的名称和介绍";
//        textView.textColor = [UIColor grayColor];
//    }
//}
//- (void)textViewDidBeginEditing:(UITextView *)textView
//{
//    if([textView.text isEqualToString:@"请添加作品的名称和介绍"]){
//        textView.text=@"";
//        textView.textColor=[UIColor blackColor];
//    }
//}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void) tapClick:(UITapGestureRecognizer *)tap
{
    SelectedViewController *new = [[SelectedViewController alloc] init];
    [self.navigationController pushViewController:new animated:YES];
}

- (void)pressButton:(UIButton *)button {
    button.selected = !button.selected;
}

- (void)pressDown:(UIButton *)button {
    button.selected = !button.selected;
}

- (void)press:(UIButton *)button {
    if (button.selected) {
        button.backgroundColor = [UIColor whiteColor];
        button.selected = NO;
        
    } else {
        
        button.backgroundColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
        button.selected = YES;
    }
    
}

- (void)pressLeft {
    [self.navigationController popViewControllerAnimated:YES];
}



- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @" ";
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @" ";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
   UITableViewCell *cell1 = nil;
    NSArray *array = [NSArray arrayWithObjects:@"原创作品", @"设计资料", @"设计师观点",@"设计教程", nil];
    if (cell1 == nil) {
        
        cell1 = [tableView dequeueReusableCellWithIdentifier:@"cell1"];
        cell1.textLabel.text = array[indexPath.row];
    }
    return cell1;

}

- (void)rightButton:(UIButton *)button {

    if (button.selected){
        UITableView *tableView = [[UITableView alloc] initWithFrame:CGRectMake(230, 179, 80, 50) style:UITableViewStyleGrouped];
        tableView.delegate = self;
        tableView.dataSource = self;
        tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];

        [self.view addSubview:tableView];
    }

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
