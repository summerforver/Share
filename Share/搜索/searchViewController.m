//
//  searchViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/26.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "searchViewController.h"
#import "UploadViewController.h"
#import "DBViewController.h"

@interface searchViewController ()<UISearchBarDelegate, UIGestureRecognizerDelegate>
@property (nonatomic, strong) UISearchBar *searchBar;
@end

@implementation searchViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    [self navigationLoad];
    
    _searchBar = [[UISearchBar alloc] init];
    _searchBar.frame = CGRectMake(10, 80, 355, 40);
    _searchBar.placeholder = @"搜索 用户名 作品分类 文章";
    _searchBar.barStyle = UISearchBarIconSearch;
    _searchBar.backgroundColor = [UIColor whiteColor];
    _searchBar.barTintColor = [UIColor whiteColor];
    _searchBar.layer.masksToBounds = YES;
    _searchBar.layer.cornerRadius = 7;
    _searchBar.layer.borderColor = [UIColor whiteColor].CGColor;
    _searchBar.keyboardType = UIKeyboardTypeDefault;
    _searchBar.delegate = self;
    
    UIImageView *pictureFirstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 135, 66, 20)];
    pictureFirstImageView.image = [UIImage imageNamed:@"分类"];
    UIImageView *firstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 155, 355, 2)];
    firstImageView.image = [UIImage imageNamed:@"home_line"];
    
    UIImageView *pictureSecondImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 260, 66, 20)];
    pictureSecondImageView.image = [UIImage imageNamed:@"推荐"];
    UIImageView *secondImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 280, 355, 2)];
    secondImageView.image = [UIImage imageNamed:@"home_line"];
    
    UIImageView *pictureThirdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 345, 66, 20)];
    pictureThirdImageView.image = [UIImage imageNamed:@"时间"];
    UIImageView *thirdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 365, 355, 2)];
    thirdImageView.image = [UIImage imageNamed:@"home_line"];
    
    UIButton *firstButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 170, 80, 30)];
    [firstButton setTitle:@"平面设计" forState:UIControlStateNormal];
    firstButton.backgroundColor = [UIColor whiteColor];
    [firstButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    firstButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    firstButton.layer.masksToBounds = YES;
    firstButton.layer.cornerRadius = 5;
    [firstButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *secondButton = [[UIButton alloc] initWithFrame:CGRectMake(100, 170, 80, 30)];
    [secondButton setTitle:@"网页设计" forState:UIControlStateNormal];
    secondButton.backgroundColor = [UIColor whiteColor];
    [secondButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    secondButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    secondButton.layer.masksToBounds = YES;
    secondButton.layer.cornerRadius = 5;
    [secondButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *thirdButton = [[UIButton alloc] initWithFrame:CGRectMake(190, 170, 80, 30)];
    [thirdButton setTitle:@"UI/icon" forState:UIControlStateNormal];
    thirdButton.backgroundColor = [UIColor whiteColor];
    [thirdButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    thirdButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    thirdButton.layer.masksToBounds = YES;
    thirdButton.layer.cornerRadius = 5;
    [thirdButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *forthButton = [[UIButton alloc] initWithFrame:CGRectMake(280, 170, 85, 30)];
    [forthButton setTitle:@"插画/手绘" forState:UIControlStateNormal];
    forthButton.backgroundColor = [UIColor whiteColor];
    [forthButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    forthButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    forthButton.layer.masksToBounds = YES;
    forthButton.layer.cornerRadius = 5;
    [forthButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *fifthButton = [[UIButton alloc] initWithFrame:CGRectMake(10, 210, 90, 30)];
    [fifthButton setTitle:@"虚拟与设计" forState:UIControlStateNormal];
    fifthButton.backgroundColor = [UIColor whiteColor];
    [fifthButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    fifthButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    fifthButton.layer.masksToBounds = YES;
    fifthButton.layer.cornerRadius = 5;
    [fifthButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *sixthButton = [[UIButton alloc] initWithFrame:CGRectMake(110, 210, 80, 30)];
    [sixthButton setTitle:@"影视" forState:UIControlStateNormal];
    sixthButton.backgroundColor = [UIColor whiteColor];
    [sixthButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    sixthButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    sixthButton.layer.masksToBounds = YES;
    sixthButton.layer.cornerRadius = 5;
    [sixthButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *sevenButton = [[UIButton alloc] initWithFrame:CGRectMake(200, 210, 75, 30)];
    [sevenButton setTitle:@"摄影" forState:UIControlStateNormal];
    sevenButton.backgroundColor = [UIColor whiteColor];
    [sevenButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    sevenButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    sevenButton.layer.masksToBounds = YES;
    sevenButton.layer.cornerRadius = 5;
    [sevenButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *eightButton = [[UIButton alloc] initWithFrame:CGRectMake(285, 210, 80, 30)];
    [eightButton setTitle:@"其他" forState:UIControlStateNormal];
    eightButton.backgroundColor = [UIColor whiteColor];
    [eightButton setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    eightButton.titleLabel.font = [UIFont systemFontOfSize:16.0];
    eightButton.layer.masksToBounds = YES;
    eightButton.layer.cornerRadius = 5;
    [eightButton addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(10, 295, 80, 30)];
    [button1 setTitle:@"人气最高" forState:UIControlStateNormal];
    button1.backgroundColor = [UIColor whiteColor];
    [button1 setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    button1.titleLabel.font = [UIFont systemFontOfSize:16.0];
    button1.layer.masksToBounds = YES;
    button1.layer.cornerRadius = 5;
    [button1 addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    UIButton *button2 = [[UIButton alloc] initWithFrame:CGRectMake(100, 295, 80, 30)];
    [button2 setTitle:@"收藏最多" forState:UIControlStateNormal];
    button2.backgroundColor = [UIColor whiteColor];
    [button2 setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    button2.titleLabel.font = [UIFont systemFontOfSize:16.0];
    button2.layer.masksToBounds = YES;
    button2.layer.cornerRadius = 5;
    [button2 addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *button3 = [[UIButton alloc] initWithFrame:CGRectMake(190, 295, 80, 30)];
    [button3 setTitle:@"评论最多" forState:UIControlStateNormal];
    button3.backgroundColor = [UIColor whiteColor];
    [button3 setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    button3.titleLabel.font = [UIFont systemFontOfSize:16.0];
    button3.layer.masksToBounds = YES;
    button3.layer.cornerRadius = 5;
    [button3 addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *button4 = [[UIButton alloc] initWithFrame:CGRectMake(280, 295, 85, 30)];
    [button4 setTitle:@"编辑精选" forState:UIControlStateNormal];
    button4.backgroundColor = [UIColor whiteColor];
    [button4 setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    button4.titleLabel.font = [UIFont systemFontOfSize:16.0];
    button4.layer.masksToBounds = YES;
    button4.layer.cornerRadius = 5;
    [button4 addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *button01 = [[UIButton alloc] initWithFrame:CGRectMake(10, 380, 80, 30)];
    [button01 setTitle:@"30分钟前" forState:UIControlStateNormal];
    button01.backgroundColor = [UIColor whiteColor];
    [button01 setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    button01.titleLabel.font = [UIFont systemFontOfSize:16.0];
    button01.layer.masksToBounds = YES;
    button01.layer.cornerRadius = 5;
    [button01 addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *button02 = [[UIButton alloc] initWithFrame:CGRectMake(100, 380, 80, 30)];
    [button02 setTitle:@"1小时前" forState:UIControlStateNormal];
    button02.backgroundColor = [UIColor whiteColor];
    [button02 setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    button02.titleLabel.font = [UIFont systemFontOfSize:16.0];
    button02.layer.masksToBounds = YES;
    button02.layer.cornerRadius = 5;
    [button02 addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *button03 = [[UIButton alloc] initWithFrame:CGRectMake(190, 380, 80, 30)];
    [button03 setTitle:@"1个月前" forState:UIControlStateNormal];
    button03.backgroundColor = [UIColor whiteColor];
    [button03 setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    button03.titleLabel.font = [UIFont systemFontOfSize:16.0];
    button03.layer.masksToBounds = YES;
    button03.layer.cornerRadius = 5;
    [button03 addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    UIButton *button04 = [[UIButton alloc] initWithFrame:CGRectMake(280, 380, 85, 30)];
    [button04 setTitle:@"一年前" forState:UIControlStateNormal];
    button04.backgroundColor = [UIColor whiteColor];
    [button04 setTitleColor:[UIColor colorWithRed:0.15f green:0.15f blue:0.15f alpha:1.00f] forState:UIControlStateNormal];
    button04.titleLabel.font = [UIFont systemFontOfSize:16.0];
    button04.layer.masksToBounds = YES;
    button04.layer.cornerRadius = 5;
    [button04 addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
    
    
    [self.view addSubview:_searchBar];
    [self.view addSubview:pictureFirstImageView];
    [self.view addSubview:pictureSecondImageView];
    [self.view addSubview:pictureThirdImageView];
    [self.view addSubview:firstImageView];
    [self.view addSubview:secondImageView];
    [self.view addSubview:thirdImageView];
    [self.view addSubview:firstButton];
    [self.view addSubview:secondButton];
    [self.view addSubview:thirdButton];
    [self.view addSubview:forthButton];
    [self.view addSubview:fifthButton];
    [self.view addSubview:sixthButton];
    [self.view addSubview:sevenButton];
    [self.view addSubview:eightButton];
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    [self.view addSubview:button3];
    [self.view addSubview:button4];
    [self.view addSubview:button01];
    [self.view addSubview:button02];
    [self.view addSubview:button03];
    [self.view addSubview:button04];
    
    
}

- (void)navigationLoad {
    self.navigationItem.title = @"搜索";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:23.0], NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    leftButton.tintColor = [UIColor colorWithRed:0.99f green:1.00f blue:1.00f alpha:1.00f];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    UIBarButtonItem *rightButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"分享1"] style:UIBarButtonItemStylePlain target:self action:@selector(pressRight)];
    rightButton.tintColor = [UIColor colorWithRed:0.99f green:1.00f blue:1.00f alpha:1.00f];
    
    self.navigationItem.rightBarButtonItem = rightButton;
}

/**
*  点击了导航栏右边的按钮
*/
- (void)pressRight
{
    UploadViewController *vc = [[UploadViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}


- (void)pressLeft {
    NSLog(@"111");
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
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

// 键盘中，搜索按钮被按下，执行的方法
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar{
   
    if( [searchBar.text isEqualToString:@"大白"]){
        DBViewController *neww = [[DBViewController alloc] init];
        [self.navigationController pushViewController:neww animated:YES];
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
