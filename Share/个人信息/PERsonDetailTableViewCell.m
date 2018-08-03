//
//  PERsonDetailTableViewCell.m
//  Share
//
//  Created by 王一卓 on 2018/7/29.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "PERsonDetailTableViewCell.h"

@implementation PERsonDetailTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.pictureView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 17, 17, 17)];
        [self.contentView addSubview:_pictureView];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(65, 10, 100, 30)];
        self.label.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
        self.label.font = [UIFont systemFontOfSize:17.0];
        
        [self.contentView addSubview:_label];
        
        self.iView = [[UIImageView alloc] initWithFrame:CGRectMake(300, 17, 15, 15)];
        [self.contentView addSubview:_iView];
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
