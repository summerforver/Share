//
//  MBIViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "MBIViewController.h"

@interface MBIViewController ()

@end

@implementation MBIViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    leftButton.tintColor = [UIColor colorWithRed:0.99f green:1.00f blue:1.00f alpha:1.00f];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 700)];
    self.tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 1;
}

- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @" ";
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @"";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return 0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 2;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 100;
    } else {
        return 50;
    }
}

- (void)tableView:(UITableView *)tableView willDisplayFooterView:(UIView *)view forSection:(NSInteger)section {
    view.tintColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UILabel *label = [[UILabel alloc] init];
    label.frame = CGRectMake(40, 20, 40, 20);
    if (indexPath.section == 0) {
        UITableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
        firstCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"firstCell"];
        
        UIImageView *pictureImageView = [[UIImageView alloc] initWithFrame:CGRectMake(110, 15, 70, 70)];
        pictureImageView.image = [UIImage imageNamed:@"sixin_img1"];
        [firstCell.contentView addSubview:pictureImageView];
//        firstCell.textLabel.text = @"头像";
//        firstCell.textLabel.frame = CGRectMake(40, 20, 40, 20);
        UILabel *label0l = [[UILabel alloc] init];
        label0l = [[UILabel alloc] init];
        label0l.frame = CGRectMake(40, 40, 40, 20);
        label0l.text = @"头像";
        label0l.font = [UIFont systemFontOfSize:16.0];
        label0l.textColor = [UIColor colorWithRed:0.11f green:0.12f blue:0.13f alpha:1.00f];
        [firstCell.contentView addSubview:label0l];
        
        return firstCell;
    } else if (indexPath.section == 1) {
        UITableViewCell *secondCell = [tableView dequeueReusableCellWithIdentifier:@"secondCell"];
        secondCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"secondCell"];
        UILabel *label2 = [[UILabel alloc] initWithFrame:CGRectMake(110, 15, 270, 20)];
        label2.text = @"share小白";
        label2.font = [UIFont systemFontOfSize:16.0];
        label2.textColor = [UIColor colorWithRed:0.07f green:0.08f blue:0.09f alpha:1.00f];
        [secondCell.contentView addSubview:label2];
        
        UILabel *label02 = [[UILabel alloc] init];
        label02 = [[UILabel alloc] init];
        label02.frame = CGRectMake(40, 15, 40, 20);
        label02.text = @"昵称";
        label02.font = [UIFont systemFontOfSize:16.0];
        label02.textColor = [UIColor colorWithRed:0.11f green:0.12f blue:0.13f alpha:1.00f];
        [secondCell.contentView addSubview:label02];
        
        
        return secondCell;
    } else if (indexPath.section == 2) {
        UITableViewCell *thirdCell = [tableView dequeueReusableCellWithIdentifier:@"thirdCell"];
        thirdCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"thirdCell"];
        UILabel *label3 = [[UILabel alloc] initWithFrame:CGRectMake(110, 15, 270, 20)];
        label3.text = @"开心了就笑，不开心了就过会再笑";
        label3.font = [UIFont systemFontOfSize:16.0];
        [thirdCell.contentView addSubview:label3];
        
        UILabel *label03 = [[UILabel alloc] init];
        label03 = [[UILabel alloc] init];
        label03.frame = CGRectMake(40, 15, 40, 20);
        label03.text = @"签名";
        label03.font = [UIFont systemFontOfSize:16.0];
        label03.textColor = [UIColor colorWithRed:0.11f green:0.12f blue:0.13f alpha:1.00f];
        [thirdCell.contentView addSubview:label03];
       
        return thirdCell;
    } else if (indexPath.section == 3) {
        UITableViewCell *fouthCell = [tableView dequeueReusableCellWithIdentifier:@"fouthCell"];
        fouthCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fouthCell"];
        UIButton *button = [[UIButton alloc] initWithFrame:CGRectMake(110, 15, 15, 20)];
        [button setImage:[UIImage imageNamed:@"girl_button"] forState:UIControlStateNormal];
        [button setImage:[UIImage imageNamed:@"boy_button"] forState:UIControlStateSelected];
        [button addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
        UILabel *label5 = [[UILabel alloc] initWithFrame:CGRectMake(130, 15, 20, 20)];
        label5.text = @"男";
        label5.font = [UIFont systemFontOfSize:16.0];
        
        UIButton *button1 = [[UIButton alloc] initWithFrame:CGRectMake(180, 15, 15, 20)];
        [button1 setImage:[UIImage imageNamed:@"girl_button"] forState:UIControlStateNormal];
        [button1 setImage:[UIImage imageNamed:@"boy_button"] forState:UIControlStateSelected];
        [button1 addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
        UILabel *label1 = [[UILabel alloc] initWithFrame:CGRectMake(200, 15, 20, 20)];
        label1.text = @"女";
        label1.font = [UIFont systemFontOfSize:16.0];
        [fouthCell.contentView addSubview:button];
        [fouthCell.contentView addSubview:button1];
        [fouthCell.contentView addSubview:label5];
        [fouthCell.contentView addSubview:label1];
        
        UILabel *label04 = [[UILabel alloc] init];
        label04 = [[UILabel alloc] init];
        label04.frame = CGRectMake(40, 15, 40, 20);
        label04.text = @"性别";
        label04.font = [UIFont systemFontOfSize:16.0];
        label04.textColor = [UIColor colorWithRed:0.11f green:0.12f blue:0.13f alpha:1.00f];
        [fouthCell.contentView addSubview:label04];
        
        return fouthCell;
    } else {
        UITableViewCell *fifthCell = [tableView dequeueReusableCellWithIdentifier:@"fifthCell"];
        fifthCell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"fifthCell"];
        UILabel *label4 = [[UILabel alloc] initWithFrame:CGRectMake(110, 15, 270, 20)];
        label4.text = @"186####3@qq.com" ;
        label4.font = [UIFont systemFontOfSize:16.0];
        [fifthCell.contentView addSubview:label4];
        
        UILabel *label05 = [[UILabel alloc] init];
        label05 = [[UILabel alloc] init];
        label05.frame = CGRectMake(40, 15, 40, 20);
        label05.text = @"邮箱";
        label05.font = [UIFont systemFontOfSize:16.0];
        label05.textColor = [UIColor colorWithRed:0.11f green:0.12f blue:0.13f alpha:1.00f];
        [fifthCell.contentView addSubview:label05];
        return fifthCell;
    }
}

- (void)press:(UIButton *)button {
    button.selected = !button.selected;
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
