
//
//  DBViewController.m
//  Share
//
//  Created by 王一卓 on 2018/8/3.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "DBViewController.h"
#import "SHAreFirstTableViewCell.h"
#import "SelectedViewController.h"
#import "UploadViewController.h"

@interface DBViewController ()<UITableViewDelegate, UITableViewDataSource,UIGestureRecognizerDelegate>
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation DBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    [self navigationLoad];
    [self creatTableView];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.frame = CGRectMake(10, 80, 355, 40);
    searchBar.placeholder = @"搜索 用户名 作品分类 文章";
    searchBar.text = @"大白";
    searchBar.barStyle = UISearchBarIconSearch;
    searchBar.backgroundColor = [UIColor whiteColor];
    searchBar.barTintColor = [UIColor whiteColor];
    searchBar.layer.masksToBounds = YES;
    searchBar.layer.cornerRadius = 7;
    searchBar.layer.borderColor = [UIColor whiteColor].CGColor;
    [self.view addSubview:searchBar];
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

- (void)pressLeft {
    [self.navigationController popViewControllerAnimated:YES];
}

- (void)pressRight
{
    UploadViewController *vc = [[UploadViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void) creatTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 135, 355, 600) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    
    [_tableView registerClass:[SHAreFirstTableViewCell class] forCellReuseIdentifier:@"cell3"];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    _tableView.showsVerticalScrollIndicator = NO;
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 131;
}
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView
{
    return 2;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @" ";
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @" ";
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (section == 0) {
        return 0.00001;
    } else {
        return 10;
    }
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 0.000001;
    
}



- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.section == 0) {
        SHAreFirstTableViewCell *cell3 = nil;
        cell3 = [_tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
        
        cell3.labelFirst.text = @"Icon of Baymax";
        cell3.labelSecond.text = @"share小王";
        cell3.labelThird.text = @"原创-UI-icon";
        cell3.labelFourth.text = @"15分钟前";
        
        cell3.pictureImageView.image = [UIImage imageNamed:@"大白1"];
        
        return cell3;
    } else {
        SHAreFirstTableViewCell *cell1 = nil;
        cell1 = [_tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
        
        cell1.labelFirst.text = @"每个人都需要一个大白";
        cell1.labelSecond.text = @"share小白";
        cell1.labelThird.text = @"原创作品-摄影";
        cell1.labelFourth.text = @"1个月前";
        
        cell1.pictureImageView.image = [UIImage imageNamed:@"大白2"];
        
        return cell1;
    }
    
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.tableView endEditing:YES];
    [self.view endEditing:YES];
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
