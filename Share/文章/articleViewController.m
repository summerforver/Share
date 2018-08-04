//
//  articleViewController.m
//  Share
//
//  Created by 王一卓 on 2018/7/26.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "articleViewController.h"
#import "SHAreSecondTableViewCell.h"
#import "SHAreFirstTableViewCell.h"
#import "SHAreThirdTableViewCell.h"

@interface articleViewController ()
<
UITableViewDelegate,
UITableViewDataSource,
UIScrollViewDelegate
>
@property(nonatomic ,strong) UITableView *tableView;
@property(nonatomic ,strong) UITableView *tableView2;
@property(nonatomic ,strong) UITableView *tableView3;
@property(nonatomic,strong) UIScrollView *sv;
@property (nonatomic,strong)UISegmentedControl *segment;

@end

@implementation articleViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.94f alpha:1.00f];
    // Do any additional setup after loading the view.
    self.navigationItem.title = @"文章";
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor whiteColor], NSForegroundColorAttributeName, [UIFont systemFontOfSize:23.0], NSFontAttributeName, nil];
    
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(pressLeft)];
    leftButton.tintColor = [UIColor colorWithRed:0.99f green:1.00f blue:1.00f alpha:1.00f];
    self.navigationItem.leftBarButtonItem = leftButton;
    
//    /**
//     *  点击了导航栏左边的按钮
//     */
//    - (void)tagButtonClick
//    {
//        RecommendTagsViewController *vc = [[RecommendTagsViewController alloc] init];
//        [self.navigationController pushViewController:vc animated:YES];
//    }
    _tableView = [self loadTableView];
    _tableView2 = [self loadTableView];
    _tableView3 = [self loadTableView];
    
    _tableView.tag = 1;
    _tableView2.tag = 2;
    _tableView3.tag = 3;
    
    self.navigationItem.title = @"文章";
    self.view.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
    self.navigationController.navigationBar.titleTextAttributes = [NSDictionary dictionaryWithObjectsAndKeys:[UIColor  whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:24.0],NSFontAttributeName,nil];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.21f green:0.53f blue:0.81f alpha:1.00f];
    
    NSArray *array = [NSArray arrayWithObjects:@"精选文章",@"热门推荐",@"全部文章", nil];
    _segment = [[UISegmentedControl alloc] initWithItems:array];
    _segment.frame = CGRectMake(0, 60, self.view.frame.size.width, 40);
    _segment.backgroundColor = [UIColor colorWithRed:0.36f green:0.36f blue:0.36f alpha:1.00f];

     _segment.tintColor = [UIColor colorWithRed:0.36f green:0.36f blue:0.36f alpha:1.00f];
    

    NSDictionary* selectedTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18.0], NSForegroundColorAttributeName: [UIColor grayColor]};
    
    [_segment setTitleTextAttributes:selectedTextAttributes forState:UIControlStateSelected];//设置文字属性
    
    NSDictionary* unselectedTextAttributes = @{NSFontAttributeName:[UIFont systemFontOfSize:18.0], NSForegroundColorAttributeName: [UIColor whiteColor]};
    
    [_segment setTitleTextAttributes:unselectedTextAttributes forState:UIControlStateNormal];
    
    [self.view addSubview:_segment];
    
    
    _sv = [[UIScrollView alloc] init];
    _sv.frame = CGRectMake(10, 110, 355, [UIScreen mainScreen].bounds.size.height - 170);
    
    
    _sv.directionalLockEnabled = NO;
    _sv.indicatorStyle = UIScrollViewIndicatorStyleDefault;
    _sv.pagingEnabled = YES;
    _sv.bounces = YES;
    _sv.scrollEnabled = YES;

    _sv.scrollEnabled = YES;
    _sv.contentOffset = CGPointMake(0, 0);
    _sv.contentSize = CGSizeMake(355*3, [UIScreen mainScreen].bounds.size.height - 170);
    _sv.bounces = YES;
    _sv.delegate = self;
    
    
    [_sv addSubview:_tableView];
    [_sv addSubview:_tableView2];
    [_sv addSubview:_tableView3];
    
    _tableView.frame = CGRectMake(0, 0, 355, _sv.frame.size.height);
    _tableView2.frame = CGRectMake(355, 0, 355, _sv.frame.size.height);
    _tableView3.frame = CGRectMake(355*2, 0, 355, _sv.frame.size.height);
    
    [_segment addTarget:self action:@selector(didClicksegmentedControlAction:) forControlEvents:UIControlEventValueChanged];
    
    [self.view addSubview:_sv];
    
    
    
    
}

- (UITableView *)loadTableView
{
    UITableView  *tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 355, _sv.frame.size.height) style:UITableViewStyleGrouped];
    tableView.backgroundColor = [UIColor colorWithRed:0.93f green:0.93f blue:0.93f alpha:1.00f];
    tableView.showsVerticalScrollIndicator = NO;
    
    [tableView registerClass:[SHAreFirstTableViewCell class] forCellReuseIdentifier:@"cell1"];
    [tableView registerClass:[SHAreSecondTableViewCell class] forCellReuseIdentifier:@"cell2"];
    [tableView registerClass:[SHAreThirdTableViewCell class] forCellReuseIdentifier:@"cell3"];
    
    tableView.delegate = self;
    tableView.dataSource = self;
    
    [self.view addSubview:tableView];
    return tableView;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 1;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 5;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 131;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{ if (section == 0) {
    return 0;
} else {
    return 5;
}
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    return 5;
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    return @" ";
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    return @" ";
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSLog(@"");
    if(tableView.tag == 1){
        if(indexPath.section == 0){
            SHAreFirstTableViewCell *cell1 = nil;
            cell1 = [_tableView dequeueReusableCellWithIdentifier:@"cell1" ];
            cell1.labelFirst.text = @"collection扁平设计";
            cell1.labelSecond.text = @"share小吕";
            cell1.labelThird.text = @"平面设计-海报设计";
            cell1.labelFourth.text = @"17分钟前";
            cell1.pictureImageView.image = [UIImage imageNamed:@"list_img3"];
            cell1.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell1;
        } else if (indexPath.section == 1) {
            SHAreFirstTableViewCell *cell2 = nil;
            cell2 = [_tableView dequeueReusableCellWithIdentifier:@"cell1" ];
            cell2.labelFirst.text = @"关于设计反馈的五件事";
            cell2.labelSecond.text = @"share小白";
            cell2.labelThird.text = @"设计文章-原创-理论";
            cell2.labelFourth.text = @"16分钟前";
            cell2.pictureImageView.image = [UIImage imageNamed:@"note_img1"];
            cell2.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell2;
        } else if (indexPath.section == 2) {
            SHAreThirdTableViewCell *cell3 = nil;
            cell3 = [_tableView dequeueReusableCellWithIdentifier:@"cell3"];
            cell3.labelFirst.text = @"版式整体术:高效解决多风格要求";
            cell3.labelSecond.text = @"share小于";
            cell3.labelFourth.text = @"设计文章-经验-案例分析";
            cell3.labelFifth.text = @"18分钟前";
            cell3.pictureImageView.image = [UIImage imageNamed:@"list_img4"];
            cell3.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell3;
        } else if (indexPath.section == 3) {
            SHAreThirdTableViewCell *cell4 = nil;
            cell4 = [_tableView dequeueReusableCellWithIdentifier:@"cell3"];
            cell4.labelFirst.text = @"用户设计PK站!";
            cell4.labelSecond.text = @"share小王";
            cell4.labelFourth.text = @"设计文章-原创-Web/Flash";
            cell4.labelFifth.text = @"17分钟前";
            cell4.pictureImageView.image = [UIImage imageNamed:@"note_img2"];
            cell4.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell4;
        } else {
            SHAreSecondTableViewCell *cell5 = nil;
            cell5 = [_tableView dequeueReusableCellWithIdentifier:@"cell2"];
            cell5.labelFirst.text = @"字体故事";
            cell5.labelSecond.text = @"share小律";
            cell5.labelThird.text = @"设计文章-经验-设计观点";
            cell5.labelFourth.text = @"45分钟前";
            cell5.pictureImageView.image = [UIImage imageNamed:@"note_img3"];
            cell5.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell5;
        }
    }
    if(tableView.tag == 2){
        
        if(indexPath.section == 2){
            SHAreFirstTableViewCell *cell1 = nil;
            cell1 = [_tableView dequeueReusableCellWithIdentifier:@"cell1" ];
            cell1.labelFirst.text = @"collection扁平设计";
            cell1.labelSecond.text = @"share小吕";
            cell1.labelThird.text = @"平面设计-海报设计";
            cell1.labelFourth.text = @"17分钟前";
            cell1.pictureImageView.image = [UIImage imageNamed:@"list_img3"];
            cell1.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell1;
        } else if (indexPath.section == 4) {
            SHAreFirstTableViewCell *cell2 = nil;
            cell2 = [_tableView dequeueReusableCellWithIdentifier:@"cell1" ];
            cell2.labelFirst.text = @"关于设计反馈的五件事";
            cell2.labelSecond.text = @"share小白";
            cell2.labelThird.text = @"设计文章-原创-理论";
            cell2.labelFourth.text = @"16分钟前";
            cell2.pictureImageView.image = [UIImage imageNamed:@"note_img1"];
            cell2.selectionStyle = UITableViewCellSelectionStyleNone;
            
            return cell2;
        } else if (indexPath.section == 0) {
            SHAreThirdTableViewCell *cell3 = nil;
            cell3 = [_tableView dequeueReusableCellWithIdentifier:@"cell3"];
            cell3.labelFirst.text = @"版式整体术:高效解决多风格要求";
            cell3.labelSecond.text = @"share小于";
            cell3.labelFourth.text = @"设计文章-经验-案例分析";
            cell3.labelFifth.text = @"18分钟前";
            cell3.pictureImageView.image = [UIImage imageNamed:@"list_img4"];
            cell3.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell3;
        } else if (indexPath.section == 3) {
            SHAreThirdTableViewCell *cell4 = nil;
            cell4 = [_tableView dequeueReusableCellWithIdentifier:@"cell3"];
            cell4.labelFirst.text = @"用户设计PK站!";
            cell4.labelSecond.text = @"share小王";
            cell4.labelFourth.text = @"设计文章-原创-Web/Flash";
            cell4.labelFifth.text = @"17分钟前";
            cell4.pictureImageView.image = [UIImage imageNamed:@"note_img2"];
            cell4.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell4;
        } else {
            SHAreSecondTableViewCell *cell5 = nil;
            cell5 = [_tableView dequeueReusableCellWithIdentifier:@"cell2"];
            cell5.labelFirst.text = @"字体故事";
            cell5.labelSecond.text = @"share小律";
            cell5.labelThird.text = @"设计文章-经验-设计观点";
            cell5.labelFourth.text = @"45分钟前";
            cell5.pictureImageView.image = [UIImage imageNamed:@"note_img3"];
            cell5.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell5;
        }
    } else {
        if(indexPath.section == 3){
            SHAreFirstTableViewCell *cell1 = nil;
            cell1 = [_tableView dequeueReusableCellWithIdentifier:@"cell1" ];
            cell1.labelFirst.text = @"collection扁平设计";
            cell1.labelSecond.text = @"share小吕";
            cell1.labelThird.text = @"平面设计-海报设计";
            cell1.labelFourth.text = @"17分钟前";
            cell1.pictureImageView.image = [UIImage imageNamed:@"list_img3"];
            cell1.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell1;
        } else if (indexPath.section == 4) {
            SHAreFirstTableViewCell *cell2 = nil;
            cell2 = [_tableView dequeueReusableCellWithIdentifier:@"cell1" ];
            cell2.labelFirst.text = @"关于设计反馈的五件事";
            cell2.labelSecond.text = @"share小白";
            cell2.labelThird.text = @"设计文章-原创-理论";
            cell2.labelFourth.text = @"16分钟前";
            cell2.pictureImageView.image = [UIImage imageNamed:@"note_img1"];
            cell2.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell2;
        } else if (indexPath.section == 1) {
            SHAreThirdTableViewCell *cell3 = nil;
            cell3 = [_tableView dequeueReusableCellWithIdentifier:@"cell3"];
            cell3.labelFirst.text = @"版式整体术:高效解决多风格要求";
            cell3.labelSecond.text = @"share小于";
            cell3.labelFourth.text = @"设计文章-经验-案例分析";
            cell3.labelFifth.text = @"18分钟前";
            cell3.pictureImageView.image = [UIImage imageNamed:@"list_img4"];
            cell3.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell3;
        } else if (indexPath.section == 0) {
            SHAreThirdTableViewCell *cell4 = nil;
            cell4 = [_tableView dequeueReusableCellWithIdentifier:@"cell3"];
            cell4.labelFirst.text = @"用户设计PK站!";
            cell4.labelSecond.text = @"share小王";
            cell4.labelFourth.text = @"设计文章-原创-Web/Flash";
            cell4.labelFifth.text = @"17分钟前";
            cell4.pictureImageView.image = [UIImage imageNamed:@"note_img2"];
            cell4.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell4;
        } else {
            SHAreSecondTableViewCell *cell5 = nil;
            cell5 = [_tableView dequeueReusableCellWithIdentifier:@"cell2"];
            cell5.labelFirst.text = @"字体故事";
            cell5.labelSecond.text = @"share小律";
            cell5.labelThird.text = @"设计文章-经验-设计观点";
            cell5.labelFourth.text = @"45分钟前";
            cell5.pictureImageView.image = [UIImage imageNamed:@"note_img3"];
            cell5.selectionStyle = UITableViewCellSelectionStyleNone;
            return cell5;
        }
    }
}

-(void)didClicksegmentedControlAction:(UISegmentedControl *)Seg{
    
    switch (Seg.selectedSegmentIndex) {
        case 0:
//            [_sv setContentOffset:CGPointMake(_sv.bounds.size.width*0, 0)
//        animated:YES];
            [_sv setContentOffset:CGPointMake(0, 0)
                         animated:YES];

            break;
        case 1:
//            [_sv setContentOffset:CGPointMake(_sv.bounds.size.width*1, 0) animated:YES];
              [_sv setContentOffset:CGPointMake(355, 0) animated:YES];
            
            break;
        case 2:
//            [_sv setContentOffset:CGPointMake(_sv.bounds.size.width*2, 0) animated:YES];
//
              [_sv setContentOffset:CGPointMake(355*2, 0) animated:YES];
            break;
        default:
            break;
    }
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    if(scrollView.contentOffset.x/355 == 2){
         [self.segment setSelectedSegmentIndex:2];
        
    }
    if(scrollView.contentOffset.x/355 == 1){
        [self.segment setSelectedSegmentIndex:1];
    }
    if(scrollView.contentOffset.x/355 == 0) {
       [self.segment setSelectedSegmentIndex:0];
    }
    
    
}




- (void)pressLeft {
    NSLog(@"111");
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
