//
//  CPTableViewCell.m
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "CPTableViewCell.h"

@implementation CPTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(40, 15, 80, 20)];
        self.label.textColor = [UIColor colorWithRed:0.07f green:0.08f blue:0.08f alpha:1.00f];
        [self.contentView addSubview:_label];
        
        self.firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(140, 15, 170, 20)];
        self.firstLabel.textColor = [UIColor colorWithRed:0.07f green:0.08f blue:0.08f alpha:1.00f];
        [self.contentView addSubview:_firstLabel];
    }
    return self;
    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
