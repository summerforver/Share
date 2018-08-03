//
//  PERsonTableViewCell.m
//  Share
//
//  Created by 王一卓 on 2018/7/29.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "PERsonTableViewCell.h"

@implementation PERsonTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        self.pictureView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 20, 100, 100)];
        [self.contentView addSubview:_pictureView];
        
        self.labelFirst = [[UILabel alloc] initWithFrame:CGRectMake(140, 20, 100, 30)];
        [self.contentView addSubview:_labelFirst];
        
        self.labelSecond = [[UILabel alloc] initWithFrame:CGRectMake(140, 45, 100, 20)];
        [self.contentView addSubview:_labelSecond];
        
        self.labelThird = [[UILabel alloc] initWithFrame:CGRectMake(140, 70, 250, 30)];
        [self.contentView addSubview:_labelThird];
        
        self.buttonFirst = [[UIButton alloc] initWithFrame:CGRectMake(140, 100, 40, 30)];
        [self.contentView addSubview:_buttonFirst];
        
        self.buttonSecond = [[UIButton alloc] initWithFrame:CGRectMake(200, 100, 60, 30)];
        [self.contentView addSubview:_buttonSecond];
        
        self.buttonThird = [[UIButton alloc] initWithFrame:CGRectMake(260, 100, 80, 30)];
        [self.contentView addSubview:_buttonThird];
        
    }
    return self;
}

- (void)layoutSubviews {
    [super layoutSubviews];
    
    _labelFirst.backgroundColor = [UIColor whiteColor];
    _labelFirst.textColor = [UIColor colorWithRed:0.20f green:0.20f blue:0.20f alpha:1.00f];
    _labelFirst.font = [UIFont systemFontOfSize:18.0];
    
    _labelSecond.backgroundColor = [UIColor whiteColor];
    _labelSecond.textColor = [UIColor colorWithRed:0.25f green:0.25f blue:0.25f alpha:1.00f];
    _labelSecond.font = [UIFont systemFontOfSize:12.0];
    
    _labelThird.backgroundColor = [UIColor whiteColor];
    _labelThird.textColor = [UIColor colorWithRed:0.22f green:0.22f blue:0.22f alpha:1.00f];
    _labelThird.font = [UIFont systemFontOfSize:14.0];
    
    [_buttonFirst setTitle:@" 15" forState:UIControlStateNormal];
    [_buttonFirst setTitle:@" 15" forState:UIControlStateSelected];
    [_buttonFirst setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_buttonFirst setTitleColor:[UIColor colorWithRed:0.21f green:0.53f blue:0.81f alpha:1.00f] forState:UIControlStateSelected];
    _buttonFirst.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_buttonFirst setImage:[UIImage imageNamed:@"文件"] forState:UIControlStateNormal];
    [_buttonFirst setImage:[UIImage imageNamed:@"img1"] forState:UIControlStateSelected];
    [_buttonFirst addTarget:self action:@selector(buttonFirst:) forControlEvents:UIControlEventTouchUpInside];
    
    
    [_buttonSecond setTitle:@" 120" forState:UIControlStateNormal];
    [_buttonSecond setTitle:@" 120" forState:UIControlStateSelected];
    [_buttonSecond setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_buttonSecond setTitleColor:[UIColor colorWithRed:0.21f green:0.53f blue:0.81f alpha:1.00f] forState:UIControlStateSelected];
    _buttonSecond.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_buttonSecond setImage:[UIImage imageNamed:@"爱心"] forState:UIControlStateNormal];
    [_buttonSecond setImage:[UIImage imageNamed:@"爱心点击"] forState:UIControlStateSelected];
    [_buttonSecond addTarget:self action:@selector(buttonSecond:) forControlEvents:UIControlEventTouchUpInside];
    
   
    [_buttonThird setTitle:@" 89" forState:UIControlStateNormal];
    [_buttonThird setTitle:@" 89" forState:UIControlStateSelected];
    _buttonThird.titleLabel.textColor = [UIColor blackColor];
    [_buttonThird setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [_buttonThird setTitleColor:[UIColor colorWithRed:0.21f green:0.53f blue:0.81f alpha:1.00f] forState:UIControlStateSelected];
    _buttonThird.titleLabel.font = [UIFont systemFontOfSize:14.0];
    [_buttonThird setImage:[UIImage imageNamed:@"眼睛"] forState:UIControlStateNormal];
    [_buttonThird setImage:[UIImage imageNamed:@"眼睛点击"] forState:UIControlStateSelected];
    [_buttonThird addTarget:self action:@selector(buttonThird:) forControlEvents:UIControlEventTouchUpInside];
    
}

- (void)buttonFirst:(UIButton *)buttonFirst {
    _buttonFirst.selected = !_buttonFirst.selected;
    NSLog(@"分享");
}

- (void)buttonSecond:(UIButton *)buttonSecond {
    _buttonSecond.selected = !_buttonSecond.selected;
    NSLog(@"爱心");
}

- (void)buttonThird:(UIButton *)buttonThird {
    _buttonThird.selected = !_buttonThird.selected;
    NSLog(@"眼睛");
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
