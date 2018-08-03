
//  shareViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/26.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "shareViewController.h"
#import "SCRollTableViewCell.h"
#import "SHAreFirstTableViewCell.h"
#import "SHAreSecondTableViewCell.h"
#import "SHAreThirdTableViewCell.h"
#import "HOLidayViewController.h"

@interface shareViewController ()

@end

@implementation shareViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    
    [self navigationLoad];
    [self tableViewLoad];
    // Do any additional setup after loading the view.
}

- (void)navigationLoad {
    self.navigationItem.title= @"SHARE";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:23.0], NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    
}

- (void)tableViewLoad {
//    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, 355, 700) style:UITableViewStyleGrouped];
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, 355, [UIScreen mainScreen].bounds.size.height - 60) style:UITableViewStyleGrouped];
//    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    self.tableView.showsVerticalScrollIndicator = NO;
    

    
//    self.tableView.backgroundColor = [UIColor whiteColor];
    
    [self.tableView registerClass:[SCRollTableViewCell class] forCellReuseIdentifier:@"scrollCell"];
    
    [self.tableView registerClass:[SHAreSecondTableViewCell class] forCellReuseIdentifier:@"firstCell"];
    
    [self.tableView registerClass:[SHAreFirstTableViewCell class] forCellReuseIdentifier:@"secondCell"];
    
    [self.tableView registerClass:[SHAreFirstTableViewCell class] forCellReuseIdentifier:@"thirdCell"];
    
    [self.tableView registerClass:[SHAreThirdTableViewCell class] forCellReuseIdentifier:@"fouthCell"];
    
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {

    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {

    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    if (indexPath.section == 0) {
        return 180;
    } else {
        return 131;
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
        return 5;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return 5;
}

//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    return 131;
//}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
//    UITableViewCell *firstCell = nil;
//    firstCell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];

    
    if (indexPath.section == 0) {
        SCRollTableViewCell *scrollCell = [tableView dequeueReusableCellWithIdentifier:@"scrollCell" forIndexPath:indexPath];
        scrollCell.backgroundView.frame = CGRectMake(0, 0, 345, 180);
        scrollCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        

        return scrollCell;
    }   else if (indexPath.section == 1) {
        SHAreSecondTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
        
        firstCell.labelFirst.text = @"假日";
        firstCell.labelSecond.text = @"share小白";
        firstCell.labelThird.text = @"原创-插画-练习写作";
        firstCell.labelFourth.text = @"15分钟前";
        firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        
//        self.tableView.rowHeight = UITableViewAutomaticDimension;
//        self.tableView.estimatedRowHeight = 131;
//
//        firstCell.pictureImageView
        firstCell.pictureImageView.image = [UIImage imageNamed:@"list_img1"];
//        firstCell.imageView.frame = CGRectMake(0, 0, 170, 131);
        
        
        
        return firstCell;
    } else if (indexPath.section == 2){
        SHAreFirstTableViewCell *secondCell = [tableView dequeueReusableCellWithIdentifier:@"secondCell"];
        
        secondCell.labelFirst.text = @"国外画册欣赏";
        secondCell.labelSecond.text = @"share小王";
        secondCell.labelThird.text = @"平面设计-画册设计";
        secondCell.labelFourth.text = @"16分钟前";
        secondCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        secondCell.pictureImageView.image = [UIImage imageNamed:@"list_img2"];
//        secondCell.imageView.frame = CGRectMake(0, 0, 170, 131);
        
        return secondCell;

    } else if (indexPath.section == 3) {
        SHAreFirstTableViewCell *thirdCell = [tableView dequeueReusableCellWithIdentifier:@"thirdCell"];
        
        thirdCell.labelFirst.text = @"collection扁平设计";
        thirdCell.labelSecond.text = @"share小吕";
        thirdCell.labelThird.text = @"平面设计-海报设计";
        thirdCell.labelFourth.text = @"17分钟前";
        thirdCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        thirdCell.pictureImageView.image = [UIImage imageNamed:@"list_img3"];
//        thirdCell.imageView.frame = CGRectMake(0, 0, 170, 131);
        return thirdCell;
    } else {
        SHAreThirdTableViewCell *fouthCell = [tableView dequeueReusableCellWithIdentifier:@"fouthCell"];
        
        fouthCell.labelFirst.text = @"版式整体术:高效解决";
        fouthCell.labelSecond.text = @"多风格要求";
        fouthCell.labelThird.text = @"share小于";
        fouthCell.labelFourth.text = @"设计文章-经验-案例分析";
        fouthCell.labelFifth.text = @"18分钟前";
        fouthCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        fouthCell.pictureImageView.image = [UIImage imageNamed:@"list_img4"];
//        fouthCell.imageView.frame = CGRectMake(0, 0, 170, 131);
        return fouthCell;
        
    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    HOLidayViewController *a = [[HOLidayViewController alloc] init];
    if (indexPath.section == 1) {
        [self.navigationController pushViewController:a animated:YES];
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
