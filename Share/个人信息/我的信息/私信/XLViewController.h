//
//  XLViewController.h
//  Share
//
//  Created by 王一卓 on 2018/8/6.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "ViewController.h"

@interface XLViewController : ViewController<UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong)UITextField *text;
@property (nonatomic, strong)UITableView *tableView;
@property NSMutableArray *messageArray;
@property NSMutableArray *rowheightArray;
@property NSNumber *rowheight;
@end
