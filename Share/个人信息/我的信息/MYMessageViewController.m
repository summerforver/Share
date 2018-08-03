//
//  MYMessageViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "MYMessageViewController.h"
#import "MYMessageTableViewCell.h"
#import "NCViewController.h"
#import "MPMViewController.h"

@interface MYMessageViewController ()

@end

@implementation MYMessageViewController

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
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.tableView registerClass:[MYMessageTableViewCell class] forCellReuseIdentifier:@"firstCell"];
    [self.tableView registerClass:[MYMessageTableViewCell class] forCellReuseIdentifier:@"secondCell"];
    [self.tableView registerClass:[MYMessageTableViewCell class] forCellReuseIdentifier:@"thirdCell"];
    [self.tableView registerClass:[MYMessageTableViewCell class] forCellReuseIdentifier:@"fouthCell"];
    [self.tableView registerClass:[MYMessageTableViewCell class] forCellReuseIdentifier:@"fifthCell"];
    
    
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
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
    return 2;
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    view.tintColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        MYMessageTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
        
        firstCell.label.text = @"评论";
        firstCell.firstLabel.text = @"7";
        firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return firstCell;
    } else if (indexPath.section == 1) {
        MYMessageTableViewCell *secondCell = [tableView dequeueReusableCellWithIdentifier:@"secondCell"];
        
        secondCell.label.text = @"推荐我的";
        secondCell.firstLabel.text = @"9";
        secondCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return secondCell;
    } else if (indexPath.section == 2) {
        MYMessageTableViewCell *thirdCell = [tableView dequeueReusableCellWithIdentifier:@"thirdCell"];
        
        thirdCell.label.text = @"新关注的";
        thirdCell.firstLabel.text = @"5";
        thirdCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return thirdCell;
    } else if (indexPath.section == 3) {
        MYMessageTableViewCell *fouthCell = [tableView dequeueReusableCellWithIdentifier:@"fouthCell"];
        
        fouthCell.label.text = @"私信";
        fouthCell.firstLabel.text = @"4";
        fouthCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return fouthCell;
    } else {
        MYMessageTableViewCell *fifthCell = [tableView dequeueReusableCellWithIdentifier:@"fifthCell"];
        
        fifthCell.label.text = @"活动通知";
        fifthCell.firstLabel.text = @"1";
        fifthCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return fifthCell;
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    NCViewController *a = [[NCViewController alloc] init];
    MPMViewController *b = [[MPMViewController alloc] init];
    if (indexPath.section == 2) {
        [self.navigationController pushViewController:a animated:YES];
    }
    if (indexPath.section == 3) {
        [self.navigationController pushViewController:b animated:YES];

    }
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
