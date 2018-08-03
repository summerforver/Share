//
//  MPMViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "MPMViewController.h"
#import "MPMTableViewCell.h"

@interface MPMViewController ()

@end

@implementation MPMViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    leftButton.tintColor = [UIColor colorWithRed:0.99f green:1.00f blue:1.00f alpha:1.00f];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 700)];
    //    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    self.tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.tableView registerClass:[MPMTableViewCell class] forCellReuseIdentifier:@"firstCell"];
    
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    //    return 5;
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    //    return 1;
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 80;
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
    return 2;
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    view.tintColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    NSArray *array = [NSArray arrayWithObjects:@"sixin_img1", @"sixin_img2", @"sixin_img3", @"sixin_img4", nil];
    NSArray *firstArray = [NSArray arrayWithObjects:@"share小格", @"share小兰", @"share小明", @"share小雪", nil];
    NSArray *secondArray = [NSArray arrayWithObjects:@"11-03 09:45", @"11-03 10:00", @"11-03 10:23", @"11-03 11:20", nil];
    NSArray *thirdArray = [NSArray arrayWithObjects:@"你的作品我很喜欢!!!", @"谢谢，已关注你", @"为你点赞！", @"你好可以问问你是怎么拍的吗？", nil];
    
    MPMTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
    
    firstCell.pictureImageView.image = [UIImage imageNamed:array[indexPath.row]];
    firstCell.firstLabel.text = firstArray[indexPath.row];
    firstCell.secondLabel.text = secondArray[indexPath.row];
    firstCell.thirdLabel.text = thirdArray[indexPath.row];
    firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    return firstCell;
}

- (void)pressLeft {
    [self.navigationController popViewControllerAnimated:YES];
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
