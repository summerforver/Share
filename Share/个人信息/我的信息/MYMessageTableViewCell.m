//
//  MYMessageTableViewCell.m
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "MYMessageTableViewCell.h"

@implementation MYMessageTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(40, 15, 100, 20)];
        self.label.textColor = [UIColor colorWithRed:0.16f green:0.16f blue:0.16f alpha:1.00f];
        [self.contentView addSubview:_label];
        
        
        self.pictureView = [[UIImageView alloc] initWithFrame:CGRectMake(270, 17, 15, 15)];
        self.pictureView.image = [UIImage imageNamed:@"img3"];
        [self.contentView addSubview:_pictureView];
        
        self.firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 17, 15, 15)];
        self.firstLabel.textColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
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
