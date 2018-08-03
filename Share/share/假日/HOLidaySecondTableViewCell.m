//
//  HOLidaySecondTableViewCell.m
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "HOLidaySecondTableViewCell.h"

@implementation HOLidaySecondTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.label = [[UILabel alloc] initWithFrame:CGRectMake(10, 7, 300, 20)];
        self.label.text = @"多希望列车能把我带到有你的城市";
        self.label.font = [UIFont systemFontOfSize:14.0];
        [self.contentView addSubview:_label];
        
        self.pictureFirstImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 35, 355, 200)];
        [self.contentView addSubview:_pictureFirstImageView];
        
        self.pictureSecondImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 240, 355, 200)];
        [self.contentView addSubview:_pictureSecondImageView];
        
        self.pictureThirdImageView = [[UIImageView alloc] initWithFrame:CGRectMake(80, 445, 210, 290)];
        [self.contentView addSubview:_pictureThirdImageView];
        
        self.pictureFouthImageView = [[UIImageView alloc] initWithFrame:CGRectMake(80, 745, 210, 290)];
        [self.contentView addSubview:_pictureFouthImageView];
        
        
        
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
