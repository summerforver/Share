//
//  RootViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/31.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "RootViewController.h"
#import "SUBmitViewController.h"

@interface RootViewController ()

@end

@implementation RootViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIViewController *viewController = [[UIViewController alloc] init];
    UIImageView *iView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 375, 670)];
    
    [viewController.view addSubview:iView];
    iView.image = [UIImage imageNamed:@"login_1.jpg"];
    
    [self.view addSubview:iView];
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
