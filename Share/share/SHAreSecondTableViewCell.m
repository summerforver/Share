//
//  SHAreSecondTableViewCell.m
//  Share
//
//  Created by 王一卓 on 2018/7/27.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "SHAreSecondTableViewCell.h"

@implementation SHAreSecondTableViewCell

-  (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        
        
        self.labelFirst = [[UILabel alloc] init];
        [self.contentView addSubview:_labelFirst];
        
        self.labelSecond = [[UILabel alloc] init];
        [self.contentView addSubview:_labelSecond];
        
        self.labelThird = [[UILabel alloc] init];
        [self.contentView addSubview:_labelThird];
        
        self.labelFourth = [[UILabel alloc] init];
        [self.contentView addSubview:_labelFourth];
        
        self.buttonFirst = [[UIButton alloc] init];
        [self.contentView addSubview:_buttonFirst];

        self.buttonSecond = [[UIButton alloc] init];
        [self.contentView addSubview:_buttonSecond];

        self.buttonThird = [[UIButton alloc] init];
        [self.contentView addSubview:_buttonThird];
        
        self.pictureImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 170, 131)];
        [self.contentView addSubview:_pictureImageView];
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _labelFirst.frame = CGRectMake(180, 10, 180, 30);
    _labelFirst.backgroundColor = [UIColor whiteColor];
    _labelFirst.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
    _labelFirst.font = [UIFont systemFontOfSize:17.0];
    
    _labelSecond.frame = CGRectMake(280, 20, 100, 10);
    _labelSecond.backgroundColor = [UIColor whiteColor];
    _labelSecond.textColor = [UIColor colorWithRed:0.22f green:0.22f blue:0.22f alpha:1.00f];
    _labelSecond.font = [UIFont systemFontOfSize:13.0];
    
    _labelThird.frame = CGRectMake(180, 45, 150, 10);
    _labelThird.backgroundColor = [UIColor whiteColor];
    _labelThird.textColor = [UIColor colorWithRed:0.25f green:0.25f blue:0.25f alpha:1.00f];
    _labelThird.font = [UIFont systemFontOfSize:12.0];
    
    _labelFourth.frame = CGRectMake(180, 65, 180, 10);
    _labelFourth.backgroundColor = [UIColor whiteColor];
    _labelFourth.textColor = [UIColor colorWithRed:0.25f green:0.25f blue:0.25f alpha:1.00f];
    _labelFourth.font = [UIFont systemFontOfSize:12.0];
    
    _buttonFirst.frame = CGRectMake(180, 100, 50, 20);
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
    
    
    _buttonSecond.frame = CGRectMake(237, 98, 50, 23);
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
    
    _buttonThird.frame = CGRectMake(290, 100, 50, 20);
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
