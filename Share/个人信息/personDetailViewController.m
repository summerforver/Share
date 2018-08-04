//
//  personDetailViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/26.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "personDetailViewController.h"
#import "PERsonTableViewCell.h"
#import "PERsonDetailTableViewCell.h"
#import "SETViewController.h"
#import "MYMessageViewController.h"
#import "MRViewController.h"
#import "MUViewController.h"

@interface personDetailViewController ()

@end

@implementation personDetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    // Do any additional setup after loading the view.
    [self navigationLoad];
    [self tableViewLoad];
}

- (void)navigationLoad {
    self.navigationItem.title = @"个人信息";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:23.0], NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    leftButton.tintColor = [UIColor colorWithRed:0.99f green:1.00f blue:1.00f alpha:1.00f];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    
}

- (void)tableViewLoad {
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 620)];
    
//    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    
    
    [self.tableView registerClass:[PERsonTableViewCell class] forCellReuseIdentifier:@"cellFirst"];
    
    [self.tableView registerClass:[PERsonDetailTableViewCell class] forCellReuseIdentifier:@"cellSecond"];
    
    [self.tableView registerClass:[PERsonDetailTableViewCell class] forCellReuseIdentifier:@"cellThird"];
    
    [self.tableView registerClass:[PERsonDetailTableViewCell class] forCellReuseIdentifier:@"cellFouth"];
    
    [self.tableView registerClass:[PERsonDetailTableViewCell class] forCellReuseIdentifier:@"cellFifth"];
    
    [self.tableView registerClass:[PERsonDetailTableViewCell class] forCellReuseIdentifier:@"cellSixth"];
    
    [self.tableView registerClass:[PERsonDetailTableViewCell class] forCellReuseIdentifier:@"cellSeventh"];
    
    
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @" ";
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @" ";
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 137;
    } else {
        return 47;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0.000001;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    if (section == 0) {
        return 15;
    } else {
        return 2;
    }
}


//改变TableView的尾标题栏颜色
- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    view.tintColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    
    //改变标题文字颜色
//    UITableViewHeaderFooterView *footer = (UITableViewHeaderFooterView *)view;
//    [footer.textLabel setTextColor:[UIColor whiteColor]];
}



- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        PERsonTableViewCell *cellFirst = [[PERsonTableViewCell alloc] init];
        cellFirst = [tableView dequeueReusableCellWithIdentifier:@"cellFirst"];
        cellFirst.labelFirst.text = @"share小白";
        cellFirst.labelSecond.text = @"树媒/设计爱好者";
        cellFirst.labelThird.text = @"开心了就笑，不开心了就过会再笑";
        cellFirst.pictureView.image = [UIImage imageNamed:@"sixin_img1"];
        cellFirst.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        return cellFirst;
        
    } else if (indexPath.section == 1) {
        PERsonDetailTableViewCell *cellSecond = [[PERsonDetailTableViewCell alloc] init];
        cellSecond = [tableView dequeueReusableCellWithIdentifier:@"cellSecond"];
        
        cellSecond.pictureView.image = [UIImage imageNamed:@"img2"];
        cellSecond.iView.image = [UIImage imageNamed:@"img3"];
        cellSecond.label.text = @"我上传的";
        cellSecond.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
        return cellSecond;
    } else if (indexPath.section == 2) {
        PERsonDetailTableViewCell *cellThird = [[PERsonDetailTableViewCell alloc] init];
        cellThird = [tableView dequeueReusableCellWithIdentifier:@"cellThird"];
        
        cellThird.pictureView.image = [UIImage imageNamed:@"img4"];
        cellThird.iView.image = [UIImage imageNamed:@"img3"];
        cellThird.label.text = @"我的信息";
        cellThird.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cellThird;
    } else if (indexPath.section == 3) {
        PERsonDetailTableViewCell *cellFouth = [[PERsonDetailTableViewCell alloc] init];
        cellFouth = [tableView dequeueReusableCellWithIdentifier:@"cellFouth"];
        
        cellFouth.pictureView.image = [UIImage imageNamed:@"button_zan"];
        cellFouth.iView.image = [UIImage imageNamed:@"img3"];
        cellFouth.label.text = @"我推荐的";
        cellFouth.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cellFouth;
    } else if (indexPath.section == 4) {
        PERsonDetailTableViewCell *cellFifth = [[PERsonDetailTableViewCell alloc] init];
        cellFifth = [tableView dequeueReusableCellWithIdentifier:@"cellFifth"];
        
        cellFifth.pictureView.image = [UIImage imageNamed:@"img5"];
        cellFifth.iView.image = [UIImage imageNamed:@"img3"];
        cellFifth.label.text = @"院系通知";
        cellFifth.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cellFifth;
    } else if (indexPath.section == 5) {
        PERsonDetailTableViewCell *cellSixth = [[PERsonDetailTableViewCell alloc] init];
        cellSixth = [tableView dequeueReusableCellWithIdentifier:@"cellSixth"];
        
        cellSixth.pictureView.image = [UIImage imageNamed:@"img6"];
        cellSixth.iView.image = [UIImage imageNamed:@"img3"];
        cellSixth.label.text = @"设置";
        cellSixth.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cellSixth;
    } else {
        PERsonDetailTableViewCell *cellSeventh = [[PERsonDetailTableViewCell alloc] init];
        cellSeventh = [tableView dequeueReusableCellWithIdentifier:@"cellSeventh"];
        
        cellSeventh.pictureView.image = [UIImage imageNamed:@"img7"];
        cellSeventh.iView.image = [UIImage imageNamed:@"img3"];
        cellSeventh.label.text = @"退出";
        cellSeventh.selectionStyle = UITableViewCellSelectionStyleNone;
        
        return cellSeventh;
    }
    
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (indexPath.section == 5) {
        SETViewController *b = [[SETViewController alloc] init];
        [self.navigationController pushViewController:b animated:YES];
    }
    
    
    if (indexPath.section == 3) {
        MRViewController *a = [[MRViewController alloc] init];
        [self.navigationController pushViewController:a animated:YES];
    }
    
    
    if (indexPath.section == 2) {
        MYMessageViewController *c = [[MYMessageViewController alloc] init];
        [self.navigationController pushViewController:c animated:YES];
    }
    if (indexPath.section == 1) {
        MUViewController *d = [[MUViewController alloc] init];
        [self.navigationController pushViewController:d animated:YES];
    }
    
}


- (void)pressLeft {
    NSLog(@"123");
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
