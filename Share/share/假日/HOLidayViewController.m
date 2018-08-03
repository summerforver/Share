//
//  HOLidayViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "HOLidayViewController.h"
#import "HOLidayFirstTableViewCell.h"
#import "HOLidaySecondTableViewCell.h"

@interface HOLidayViewController ()

@end

@implementation HOLidayViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.95f green:0.95f blue:0.95f alpha:1.00f];
    [self navigationLoad];
    [self tableViewLoad];
}

- (void)navigationLoad {
    self.navigationItem.title= @"SHARE";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:23.0], NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    
//    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:nil action:@selector(pressLeft)];
//    leftButton.tintColor = [UIColor colorWithRed:0.99f green:1.00f blue:1.00f alpha:1.00f];
//    self.navigationItem.leftBarButtonItem = leftButton;
    
}

- (void)tableViewLoad {

    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 700) style:UITableViewStyleGrouped];
    self.tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;

    [self.tableView registerClass:[HOLidayFirstTableViewCell class] forCellReuseIdentifier:@"firstCell"];
    [self.tableView registerClass:[HOLidaySecondTableViewCell class] forCellReuseIdentifier:@"secondCell"];
    
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 2;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 80;
    } else {
        return 1140;
    }
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @" ";
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @" ";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    if (section == 0) {
        return 0;
    } else {
        return 0.0001;
    }
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 0.00001;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        HOLidayFirstTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];

        firstCell.pictureImageView.image = [UIImage imageNamed:@"works_head"];
        firstCell.firstLabel.text = @"假日";
        firstCell.secondLabel.text = @"15分钟前";
        firstCell.thirdLabel.text = @"share小白";
        
        firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return firstCell;
    } else {
        HOLidaySecondTableViewCell *secondCell = [tableView dequeueReusableCellWithIdentifier:@"secondCell"];
        
        secondCell.pictureFirstImageView.image = [UIImage imageNamed:@"works_img1"];
        secondCell.pictureSecondImageView.image = [UIImage imageNamed:@"works_img2"];
        secondCell.pictureThirdImageView.image = [UIImage imageNamed:@"works_img3"];
        secondCell.pictureFouthImageView.image = [UIImage imageNamed:@"works_img5"];
        
        secondCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return secondCell;
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
