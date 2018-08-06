//
//  REGisterViewController.h
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "ViewController.h"

typedef void (^ReturnTextBlock)(NSString *showText, NSString *passText);//重新定义了一个block类型变量

@interface REGisterViewController : ViewController
@property (nonatomic,retain)UITextField *personTextField;
@property (nonatomic,retain)UITextField *passTextField;
@property (nonatomic,copy) ReturnTextBlock returnTextBlock;//定义的一个Block属性

- (void)returnText:(ReturnTextBlock)block;
@end
