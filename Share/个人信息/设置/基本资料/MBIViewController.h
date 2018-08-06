//
//  MBIViewController.h
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "ViewController.h"

@interface MBIViewController : ViewController
<UITableViewDelegate, UITableViewDataSource>
@property (nonatomic, strong)UITableView *tableView;
@property (nonatomic, strong)UIButton *button;
@property (nonatomic, strong)UIButton *button1;
@end
