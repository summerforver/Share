//
//  fieldTextView.m
//  Share
//
//  Created by 王一卓 on 2018/8/3.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "fieldTextView.h"

@implementation fieldTextView

- (instancetype) initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    
    if(self){
        [self setUpSubViews];
    }
    return self;
}

- (void) setUpSubViews
{
    self.text = @"";
    
    [self setPlaceholder:@""];
    [self setPlaceholderColor:[UIColor  lightGrayColor]];
}
- (void) setText:(NSString *) text{
    [super setText:text];
}

- (void) drawRect:(CGRect)rect
{
    [super drawRect:rect];
    if([[self placeholder] length] > 0){
        if(_placeHolderLabel == nil){
            _placeHolderLabel = [[UILabel alloc] initWithFrame:CGRectMake(8, 8, self.bounds.size.width - 16, 0)];
            _placeHolderLabel.numberOfLines = 0;
            _placeHolderLabel.font = self.font;
            _placeHolderLabel.backgroundColor = [UIColor clearColor];
            _placeHolderLabel.textColor = self.placeholderColor;
            _placeHolderLabel.alpha = 0;
            _placeHolderLabel.tag = 999;
            [self addSubview: _placeHolderLabel];
        }
        _placeHolderLabel.text = self.placeholder;
        [_placeHolderLabel sizeToFit];
        [self sendSubviewToBack:_placeHolderLabel];
    }
    if([[self text] length] == 0 && [[self placeholder] length] > 0){
        [[self viewWithTag:999] setAlpha:1];
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
