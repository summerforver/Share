//
//  SEArchTableViewCell.m
//  Share
//
//  Created by 王一卓 on 2018/7/27.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "SEArchTableViewCell.h"

@implementation SEArchTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        self.pictureImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 356, 170)];
        [self.contentView addSubview:_pictureImageView];
        
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(0, 170, 355, 30)];
        [self.contentView addSubview:_label];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _label.textColor = [UIColor colorWithRed:0.08f green:0.08f blue:0.09f alpha:1.00f];
    _label.font = [UIFont systemFontOfSize:13.0];
    
    
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
