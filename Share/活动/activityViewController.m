//
//  activityViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/26.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "activityViewController.h"
#import "SEArchTableViewCell.h"

@interface activityViewController ()

@end

@implementation activityViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    [self navigationLoad];
    [self tableViewLoad];
    // Do any additional setup after loading the view.
}

- (void)navigationLoad {
    self.navigationItem.title = @"活动";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:23.0], NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    leftButton.tintColor = [UIColor colorWithRed:0.99f green:1.00f blue:1.00f alpha:1.00f];
    self.navigationItem.leftBarButtonItem = leftButton;
    
}

- (void)tableViewLoad {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, 355, [UIScreen mainScreen].bounds.size.height - 64) style:UITableViewStyleGrouped];
    //去掉右侧滚动条
//    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    
    [self.tableView registerClass:[SEArchTableViewCell class] forCellReuseIdentifier:@"cellFirst"];
    [self.tableView registerClass:[SEArchTableViewCell class] forCellReuseIdentifier:@"cellSecond"];
    [self.tableView registerClass:[SEArchTableViewCell class] forCellReuseIdentifier:@"cellThird"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    self.tableView.showsVerticalScrollIndicator = NO;
    
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 3;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 200;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @" ";
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @" ";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 10;
    } else {
        return 5;
    }
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        SEArchTableViewCell *cellFirst = [tableView dequeueReusableCellWithIdentifier:@"cellFirst" forIndexPath:indexPath];
        
        cellFirst.pictureImageView.image = [UIImage imageNamed:@"main_img2的副本"];
        cellFirst.label.text = @"   下厨也要美美的，从一条围裙开始一六月鲜围裙创意大赛";
        cellFirst.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cellFirst;
    } else if (indexPath.section == 1) {
        SEArchTableViewCell *cellSecond = [tableView dequeueReusableCellWithIdentifier:@"cellSecond" forIndexPath:indexPath];
        cellSecond.pictureImageView.image = [UIImage imageNamed:@"MIUI"];
        cellSecond.label.text = @"   MIUI主题市场让你的创意改变世界！";
        cellSecond.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cellSecond;
    } else {
        SEArchTableViewCell *cellThird = [tableView dequeueReusableCellWithIdentifier:@"cellThird" forIndexPath:indexPath];
        cellThird.pictureImageView.image = [UIImage imageNamed:@"华为"];
        cellThird.label.text = @"   千万花粉为你而来-华为花粉吉祥物设计大赛";
        cellThird.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cellThird;
    }
}

- (void)pressLeft {
    NSLog(@"111");
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
