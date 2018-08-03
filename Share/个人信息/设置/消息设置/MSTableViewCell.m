//
//  MSTableViewCell.m
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "MSTableViewCell.h"

@implementation MSTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(40, 15, 150, 20)];
        self.label.textColor = [UIColor colorWithRed:0.16f green:0.16f blue:0.16f alpha:1.00f];
        [self.contentView addSubview:_label];
        
        
        self.button = [[UIButton alloc] initWithFrame:CGRectMake(270, 17, 20, 20)];
        [_button setImage:[UIImage imageNamed:@"my_button_normal"] forState:UIControlStateNormal];
        [_button setImage:[UIImage imageNamed:@"my_button_pressed"] forState:UIControlStateSelected];
//        [_button addTarget:nil action:@selector(press:) forControlEvents:UIControlEventTouchDown];
        
        [self.contentView addSubview:_button];
    }
    return self;
    
}

//- (void)press:(UIButton *)button {
//    button.selected = !button.selected;
////    if (button.selected) {
////        button.selected = NO;
////    } else {
////        button.selected = YES;
////    }
//}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
