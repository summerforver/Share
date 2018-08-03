//
//  SCRollTableViewCell.m
//  Share
//
//  Created by 王一卓 on 2018/7/27.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "SCRollTableViewCell.h"

@implementation SCRollTableViewCell

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        self.view = [[UIView alloc] initWithFrame:CGRectMake(10, 0, 365, 180)];
        
        self.scrollView = [[UIScrollView alloc] initWithFrame:CGRectMake(0, 0, 355, 180)];
//        [self.contentView addSubview:_view];
//        [self.view addSubview:_scrollView];
        [self.contentView addSubview:_scrollView];
        
    }
    return self;
}


- (void)layoutSubviews {
    [super layoutSubviews];
//    self.backgroundColor = [UIColor redColor];
//    self.backgroundView.frame = CGRectMake(10, 0, 365, 130);
    
    _scrollView.backgroundColor = [UIColor whiteColor];
    _scrollView.directionalLockEnabled = NO;
    _scrollView.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    _scrollView.pagingEnabled = YES;
    _scrollView.contentSize = CGSizeMake(355*4, 180);
    _scrollView.bounces = YES;
    _scrollView.scrollEnabled = YES;
    _scrollView.alwaysBounceHorizontal = YES;
    _scrollView.alwaysBounceVertical = NO;
    _scrollView.showsHorizontalScrollIndicator = YES;
    _scrollView.showsVerticalScrollIndicator = NO;
    
    for (int i = 0; i < 4; i ++){
        NSString *strName = [NSString stringWithFormat:@"main_img%d",i+1];
        UIImage *image = [UIImage imageNamed:strName];
        UIImageView *imageView = [[UIImageView alloc] initWithImage:image];

        imageView.frame = CGRectMake(355*i, 0, 360, 180);
        [_scrollView addSubview:imageView];
    }

    
    _pageControl = [[UIPageControl alloc]initWithFrame:CGRectMake(90, 150, 200, 30)];
    int count = 4;
    
//    self.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, 208)];
    
    self.titleView = [[UIView alloc] initWithFrame:CGRectMake(0, 0, 355, 200)];
    
    //4 设置pageControl
    self.pageControl.numberOfPages = count;
    self.pageControl.currentPageIndicatorTintColor = [UIColor whiteColor];
    self.pageControl.pageIndicatorTintColor = [UIColor blackColor];
    //5 设置scrollView的代理
    _scrollView.delegate = self;
    //6 添加定时器
    [self addTimerTask];
    [_titleView addSubview:_scrollView];
    [_titleView addSubview:_pageControl];
//    [_tableView registerClass:[TableViewCell1 class] forCellReuseIdentifier:@"pictureCell"];
    [self.contentView addSubview:_titleView];
    
}


//把定时器封装起来 方便调用
-(void)addTimerTask{
    //6 定时器
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    
    self.timer = timer;
    
    //消息循环
    NSRunLoop *runloop = [NSRunLoop currentRunLoop];
    // 默认是NSDefaultRunLoopMode  但是另外一个属性NSRunLoopCommonModes 能够在多线程中起作用
    [runloop addTimer:timer forMode:NSDefaultRunLoopMode];
    
    //立即执行定时器的方法  fire 是定时器自带的方法
    // [timer fire];
}

-(void)nextImage{
    //当前页码
    NSInteger page = self.pageControl.currentPage;
    //如果是到达最后一张
    if (page == self.pageControl.numberOfPages - 1) {
        page = 0;
        //设置偏移量  当到达最后一张时候 切换到第一张  不产生从最后一张倒回第一张效果
        _scrollView.contentOffset = CGPointMake(0, 0);
        [_scrollView setContentOffset:_scrollView.contentOffset animated:YES];
    }else{
        page++;
    }
    //  self.scrollView setContentOffset:(CGPoint) animated:(BOOL)
    
    CGFloat offsetX = page * _scrollView.frame.size.width;
    [UIView animateWithDuration:2.0 animations:^{
        self->_scrollView.contentOffset = CGPointMake(offsetX, 0);
    }];
}

//正在滚动的时候
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    //   (offset.x + 100/2)/100
    int page = (scrollView.contentOffset.x + scrollView.frame.size.width / 2)/ scrollView.frame.size.width;
    self.pageControl.currentPage = page;
}
//当你点击图片按住不动的时候 把定时器停止
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    //停止定时器
    [self.timer invalidate];
}
//当不再按图片 也就是松开的时候 立马调用计时器方法
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    
    //用scheduledTimerWithTimeInterval 创建定时器是用的系统默认的方法 当遇见多线程时候会出现问题
    //    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(nextImage) userInfo:nil repeats:YES];
    //所以还是调用上面创建的定时器方法
    [self addTimerTask];
}

//- (NSTimer)
//- (void)addtimer {
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:1.0f target:self selector:@selector(repeatPage) userInfo:nil repeats:YES];
//    [[NSRunLoop mainRunLoop] addTimer:self.timer forMode:NSRunLoopCommonModes];
//}

//- (void)addtimer {
//    self.timer = [NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(repeatPage) userInfo:nil repeats:YES];
//
//    NSRunLoop *runLoop = [NSRunLoop currentRunLoop];
//    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
//}
//
//- (void)repeatPage {
//    NSLog(@"123");
//}


- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
