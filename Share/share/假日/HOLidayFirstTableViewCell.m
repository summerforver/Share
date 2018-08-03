//
//  HOLidayFirstTableViewCell.m
//  Share
//
//  Created by 王一卓 on 2018/7/30.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "HOLidayFirstTableViewCell.h"

@implementation HOLidayFirstTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.pictureImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10, 15, 55, 55)];
        [self.contentView addSubview:_pictureImageView];
        
        self.firstLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 5, 50, 40)];
        [self.contentView addSubview:_firstLabel];
        
        self.secondLabel = [[UILabel alloc] initWithFrame:CGRectMake(300, 15, 70, 20)];
        [self.contentView addSubview:_secondLabel];
        
        self.thirdLabel = [[UILabel alloc] initWithFrame:CGRectMake(75, 45, 100, 30)];
        [self.contentView addSubview:_thirdLabel];
        
        self.buttonFirst = [[UIButton alloc] initWithFrame:CGRectMake(210, 48, 50, 20)];
        [self.contentView addSubview:_buttonFirst];
        
        self.buttonSecond = [[UIButton alloc] initWithFrame:CGRectMake(270, 48, 47, 23)];
        [self.contentView addSubview:_buttonSecond];
        
        self.buttonThird = [[UIButton alloc] initWithFrame:CGRectMake(320, 48, 50, 20)];
        [self.contentView addSubview:_buttonThird];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _firstLabel.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
    _firstLabel.font = [UIFont systemFontOfSize:22.0];
    
    _secondLabel.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
    _secondLabel.font = [UIFont systemFontOfSize:13.0];
    
    _thirdLabel.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
    _thirdLabel.font = [UIFont systemFontOfSize:19.0];
    
    
    
    
    _buttonFirst.selected = NO;
    //    _buttonFirst.backgroundColor = [UIColor clearColor];
    [_buttonFirst setTitle:@" 102" forState:UIControlStateNormal];
    [_buttonFirst setTitle:@" 102" forState:UIControlStateSelected];
    [_buttonFirst setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_buttonFirst setTitleColor:[UIColor colorWithRed:0.21f green:0.53f blue:0.81f alpha:1.00f] forState:UIControlStateSelected];
    _buttonFirst.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_buttonFirst setImage:[UIImage imageNamed:@"爱心"] forState:UIControlStateNormal];
    [_buttonFirst setImage:[UIImage imageNamed:@"爱心点击"] forState:UIControlStateSelected];
    [_buttonFirst addTarget:self action:@selector(buttonFirst:) forControlEvents:UIControlEventTouchUpInside];
    
    
    
    _buttonSecond.selected = NO;
    //    _buttonSecond.backgroundColor = [UIColor clearColor];
    [_buttonSecond setTitle:@" 26" forState:UIControlStateNormal];
    [_buttonSecond setTitle:@" 26" forState:UIControlStateSelected];
    //  _buttonSecond.titleLabel.textColor = [UIColor blackColor];
    [_buttonSecond setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_buttonSecond setTitleColor:[UIColor colorWithRed:0.21f green:0.53f blue:0.81f alpha:1.00f] forState:UIControlStateSelected];
    _buttonSecond.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_buttonSecond setImage:[UIImage imageNamed:@"眼睛"] forState:UIControlStateNormal];
    [_buttonSecond setImage:[UIImage imageNamed:@"眼睛点击"] forState:UIControlStateSelected];
    [_buttonSecond addTarget:self action:@selector(buttonSecond:) forControlEvents:UIControlEventTouchUpInside];
  
    _buttonThird.selected = NO;
    //    _buttonThird.backgroundColor = [UIColor clearColor];
    [_buttonThird setTitle:@" 20" forState:UIControlStateNormal];
    [_buttonThird setTitle:@" 20" forState:UIControlStateSelected];
    _buttonThird.titleLabel.textColor = [UIColor blackColor];
    [_buttonThird setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_buttonThird setTitleColor:[UIColor colorWithRed:0.21f green:0.53f blue:0.81f alpha:1.00f] forState:UIControlStateSelected];
    _buttonThird.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_buttonThird setImage:[UIImage imageNamed:@"分享"] forState:UIControlStateNormal];
    [_buttonThird setImage:[UIImage imageNamed:@"分享点击"] forState:UIControlStateSelected];
    [_buttonThird addTarget:self action:@selector(buttonThird:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonFirst:(UIButton *)buttonFirst {
    _buttonFirst.selected = !_buttonFirst.selected;
    NSLog(@"爱心");
}

- (void)buttonSecond:(UIButton *)buttonSecond {
    _buttonSecond.selected = !_buttonSecond.selected;
    NSLog(@"眼睛");
}

- (void)buttonThird:(UIButton *)buttonThird {
    _buttonThird.selected = !_buttonThird.selected;
    NSLog(@"分享");
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
