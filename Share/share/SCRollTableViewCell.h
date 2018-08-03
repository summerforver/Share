//
//  SCRollTableViewCell.h
//  Share
//
//  Created by 王一卓 on 2018/7/27.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface SCRollTableViewCell : UITableViewCell <UIScrollViewDelegate>

@property (nonatomic, strong)UIScrollView *scrollView;
@property (nonatomic, strong)UIView *titleView;
@property (nonatomic, strong)UIPageControl *pageControl;
@property (nonatomic, strong)NSTimer *timer;

//@property (nonatomic, strong) UIView *view;
//@property (nonatomic, strong) NSTimer  *timer;
@end
