//
//  fieldTextView.h
//  Share
//
//  Created by 王一卓 on 2018/8/3.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface fieldTextView : UITextView

@property (nonatomic,strong) UILabel *placeHolderLabel;
@property (nonatomic, copy) NSString *placeholder;
@property (nonatomic, strong)UIColor *placeholderColor;

@end
