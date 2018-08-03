//
//  MRViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "MRViewController.h"
#import "SHAreFirstTableViewCell.h"
#import "SHAreSecondTableViewCell.h"
#import "SHAreThirdTableViewCell.h"

@interface MRViewController ()<UIGestureRecognizerDelegate>

@end

@implementation MRViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    leftButton.tintColor = [UIColor colorWithRed:0.99f green:1.00f blue:1.00f alpha:1.00f];
    self.navigationItem.leftBarButtonItem = leftButton;
    
    self.tableView = [[UITableView alloc] initWithFrame:CGRectMake(10, 0, 355, [UIScreen mainScreen].bounds.size.height - 60) style:UITableViewStyleGrouped];
    //    self.tableView.showsVerticalScrollIndicator = NO;
    
    self.tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    
    
    [self.tableView registerClass:[SHAreSecondTableViewCell class] forCellReuseIdentifier:@"firstCell"];
    
    [self.tableView registerClass:[SHAreFirstTableViewCell class] forCellReuseIdentifier:@"secondCell"];
    
    [self.tableView registerClass:[SHAreFirstTableViewCell class] forCellReuseIdentifier:@"thirdCell"];
    
    [self.tableView registerClass:[SHAreSecondTableViewCell class] forCellReuseIdentifier:@"fouthCell"];
    
    [self.tableView registerClass:[SHAreThirdTableViewCell class] forCellReuseIdentifier:@"fifthCell"];
    self.tableView.showsVerticalScrollIndicator = NO;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.view addSubview:_tableView];
    
    
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


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    
    return 5;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    
    return 1;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
//    if (indexPath.section == 0) {
//        return 180;
//    } else {
//        return 131;
//    }
    return 131;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section {
    return @" ";
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section {
    return @" ";
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
//    if (section == 0) {
//        return 0;
//    } else {
//        return 5;
//    }
    return 5;
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
        
        SHAreSecondTableViewCell *firstCell = [tableView dequeueReusableCellWithIdentifier:@"firstCell"];
        
        firstCell.labelFirst.text = @"假日";
        firstCell.labelSecond.text = @"share小白";
        firstCell.labelThird.text = @"原创-插画-练习写作";
        firstCell.labelFourth.text = @"10分钟前";
        firstCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        firstCell.pictureImageView.image = [UIImage imageNamed:@"list_img1"];
        
        return firstCell;
        
    }   else if (indexPath.section == 1) {
        SHAreFirstTableViewCell *secondCell = [tableView dequeueReusableCellWithIdentifier:@"secondCell"];
        
        secondCell.labelFirst.text = @"国外画册欣赏";
        secondCell.labelSecond.text = @"share小王";
        secondCell.labelThird.text = @"平面设计-画册设计";
        secondCell.labelFourth.text = @"16分钟前";
        secondCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        secondCell.pictureImageView.image = [UIImage imageNamed:@"list_img2"];
        //        secondCell.imageView.frame = CGRectMake(0, 0, 170, 131);
        
        return secondCell;
        
    } else if (indexPath.section == 2){
        SHAreFirstTableViewCell *thirdCell = [tableView dequeueReusableCellWithIdentifier:@"thirdCell"];
        
        thirdCell.labelFirst.text = @"collection扁平设计";
        thirdCell.labelSecond.text = @"share小吕";
        thirdCell.labelThird.text = @"平面设计-海报设计";
        thirdCell.labelFourth.text = @"17分钟前";
        thirdCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        thirdCell.pictureImageView.image = [UIImage imageNamed:@"list_img3"];
        //        thirdCell.imageView.frame = CGRectMake(0, 0, 170, 131);
        return thirdCell;
    } else if (indexPath.section == 3) {
        
        SHAreSecondTableViewCell *fouthCell = [tableView dequeueReusableCellWithIdentifier:@"fouthCell"];
        
        fouthCell.labelFirst.text = @"字体故事";
        fouthCell.labelSecond.text = @"share小律";
        fouthCell.labelThird.text = @"设计文章-经验-设计观点";
        fouthCell.labelFourth.text = @"45分钟前";
        fouthCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        fouthCell.pictureImageView.image = [UIImage imageNamed:@"note_img3"];
        
        return fouthCell;
        
    } else {
        SHAreThirdTableViewCell *fifthCell = [tableView dequeueReusableCellWithIdentifier:@"fifthCell"];
        
        fifthCell.labelFirst.text = @"版式整体术:高效解决";
        fifthCell.labelSecond.text = @"多风格要求";
        fifthCell.labelThird.text = @"share小于";
        fifthCell.labelFourth.text = @"设计文章-经验-案例分析";
        fifthCell.labelFifth.text = @"18分钟前";
        fifthCell.selectionStyle = UITableViewCellSelectionStyleNone;
        
        fifthCell.pictureImageView.image = [UIImage imageNamed:@"list_img4"];
        
        return fifthCell;
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
