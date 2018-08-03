//
//  shareViewController.h
//  Share
//
//  Created by 王一卓 on 2018/7/26.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SCRollTableViewCell.h"

@interface shareViewController : UIViewController<UITableViewDelegate, UITableViewDataSource>
//{
//    NSMutableArray *_bigArray;
//}

@property (nonatomic, strong)UITableView *tableView;



@end
