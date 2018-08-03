//
//  MPMTableViewCell.m
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "MPMTableViewCell.h"

@implementation MPMTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.pictureImageView = [[UIImageView alloc] initWithFrame:CGRectMake(40, 15, 50, 50)];
        [self.contentView addSubview:_pictureImageView];
        
        self.firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(105, 20, 100, 20)];
        [self.contentView addSubview:_firstLabel];
        
        self.secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(285, 20, 90, 15)];
        self.secondLabel.font = [UIFont systemFontOfSize:12.0];
        self.secondLabel.textColor = [UIColor colorWithRed:0.78f green:0.79f blue:0.79f alpha:1.00f];
        [self.contentView addSubview:_secondLabel];
        
        
        self.thirdLabel = [[UILabel alloc] initWithFrame:CGRectMake(105, 50, 230, 20)];
        self.thirdLabel.font = [UIFont systemFontOfSize:14.0];
        self.thirdLabel.textColor = [UIColor colorWithRed:0.31f green:0.59f blue:0.84f alpha:1.00f];
        
        [self.contentView addSubview:_thirdLabel];
        
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
