
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

@interface DBViewController ()<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@end

@implementation DBViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    [self navigationLoad];
    
    UISearchBar *searchBar = [[UISearchBar alloc] init];
    searchBar.frame = CGRectMake(10, 80, 355, 40);
    searchBar.placeholder = @"搜索 用户名 作品分类 文章";
    searchBar.barStyle = UISearchBarIconSearch;
    searchBar.backgroundColor = [UIColor whiteColor];
    searchBar.barTintColor = [UIColor whiteColor];
    searchBar.layer.masksToBounds = YES;
    searchBar.layer.cornerRadius = 7;
    searchBar.layer.borderColor = [UIColor whiteColor].CGColor;
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
    SelectedViewController *vc = [[SelectedViewController alloc] init];
    [self.navigationController pushViewController:vc animated:YES];
}
- (void) creatTableView
{
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 145, 400, 300) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    
    [_tableView registerClass:[SHAreFirstTableViewCell class] forCellReuseIdentifier:@"cell3"];
    _tableView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
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
    return 1;
}

- (NSInteger) tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 2;
}

- (UITableViewCell *) tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    SHAreFirstTableViewCell *cell3 = nil;
    cell3 = [_tableView dequeueReusableCellWithIdentifier:@"cell3" forIndexPath:indexPath];
    
    NSArray *array1 = [NSArray arrayWithObjects:@"Icon of Baymax",@"每个人都需要一个大白", nil];
    NSArray *array2 = [NSArray arrayWithObjects:@"share小王",@"share小吕",nil];
    NSArray *array3 = [NSArray arrayWithObjects:@"平面设计-画册设计",@"平面设计-海报设计", nil];
    NSArray *array4 = [NSArray arrayWithObjects:@"15分钟前",@"16分钟前",nil];
    cell3.labelFirst.text = array1[indexPath.row];
    cell3.labelSecond.text = array2[indexPath.row];
    cell3.labelThird.text = array3[indexPath.row];
    cell3.labelFourth.text = array4[indexPath.row];
    
    NSArray *array8 = [NSArray arrayWithObjects:@"大白1",@"大白2",nil];
    cell3.pictureImageView.image = [UIImage imageNamed:array8[indexPath.row]];
    
    return cell3;
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
    return 8;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 8;
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
