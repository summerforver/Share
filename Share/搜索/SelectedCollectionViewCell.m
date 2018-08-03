//
//  SelectedCollectionViewCell.m
//  Share
//
//  Created by 王一卓 on 2018/8/3.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "SelectedCollectionViewCell.h"

@implementation SelectedCollectionViewCell
- (instancetype) initWithFrame:(CGRect)frame
{
    if(self = [super initWithFrame:frame]){
        
        self.pictureImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 123, 123)];
        [self.contentView addSubview:_pictureImageView];
        
        self.picturebutton = [[UIButton alloc]initWithFrame:CGRectMake(85, 5, 30, 30)];
        [self.picturebutton setImage:[UIImage imageNamed:@"my_button_normal"] forState:UIControlStateNormal];
        [self.picturebutton setImage:[UIImage imageNamed:@"my_button_pressed"] forState:UIControlStateSelected];
        [self.picturebutton addTarget:self action:@selector(press:) forControlEvents:UIControlEventTouchUpInside];
        [self.contentView addSubview:_picturebutton];
    }
    return self;
}
- (void)press:(UIButton *)btn{
    btn.selected = !btn.selected;
}
@end
