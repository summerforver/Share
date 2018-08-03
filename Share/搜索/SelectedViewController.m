//
//  SelectedViewController.m
//  Share
//
//  Created by 王一卓 on 2018/8/3.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "SelectedViewController.h"
#import "SelectedCollectionViewCell.h"

@interface SelectedViewController ()

@end

@implementation SelectedViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    UIBarButtonItem *RightBtn = [[UIBarButtonItem alloc] initWithImage:[[UIImage imageNamed:@"上传图片"]imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal] style:UIBarButtonItemStylePlain target:self action:@selector(showAlert:)];
    //RightBtn.backgroundColor = [UIColor colorWithRed:0.34f green:0.55f blue:0.85f alpha:1.00f];
    //[RightBtn setImage:[UIImage imageNamed:@"上传图片"]];
    //[RightBtn setTitle:@"上传"];
    RightBtn.tintColor = [UIColor whiteColor];
    
    //[RightBtn  setTitleTextAttributes:[NSDictionary dictionaryWithObjectsAndKeys:[UIColor  whiteColor],NSForegroundColorAttributeName,[UIFont boldSystemFontOfSize:20.0],NSFontAttributeName,nil] forState:UIControlStateNormal];
    //[RightBtn setTintColor:[UIColor whiteColor]];
    self.navigationItem.rightBarButtonItem = RightBtn;
    
    //初始化layout
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc] init];
    //设置collectionView滚动方向
    [layout setScrollDirection:UICollectionViewScrollDirectionVertical];
    //设置headerReferanceSize的尺寸大小
    layout.headerReferenceSize = CGSizeMake(self.view.frame.size.width, 5);
    layout.itemSize = CGSizeMake(110, 150);
    
    //初始化collectionView大小
    mainCollectionView = [[UICollectionView alloc] initWithFrame:self.view.bounds collectionViewLayout:layout];
    mainCollectionView.backgroundColor = [UIColor whiteColor];
    mainCollectionView.delegate = self;
    mainCollectionView.dataSource = self;
    
    //注册colletionviewCell
    //此处的reuseIdentifier 必须和cellForItemAtIndexPath方法中一致均为cellID
    [mainCollectionView registerClass:[SelectedCollectionViewCell class] forCellWithReuseIdentifier:@"cellID"];
    //    [mainCollectionView registerClass:[SelectCollectionViewCell class] forSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView"];
    [self.view addSubview:mainCollectionView];
    
    // Do any additional setup after loading the view.
}
- (NSInteger) numberOfSectionsInCollectionView:(UICollectionView *)collectionView
{
    return 1;
}

- (NSInteger) collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return 33;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    SelectedCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"cellID" forIndexPath:indexPath];
    NSArray *array = [NSArray arrayWithObjects:@"timg.jpeg",@"timg1.jpeg",@"timg-2.jpeg",@"timg-3.jpeg",@"timg-4.jpeg",@"timg-5.jpeg",@"timg-6.jpeg",@"timg-7.jpeg",@"timg-8.jpeg",@"timg-9.jpeg",@"timg-11.jpeg",@"timg-12.jpeg",@"timg-13.jpeg",@"timg-14.jpeg",@"timg-15.jpeg",@"1.jpg",@"2.jpg",@"3.jpg",@"4.jpg",@"5.jpg",@"6.jpg",@"7.jpg",@"8.jpg",@"9.jpg",@"10.jpg",@"11.jpg",@"12.jpg",@"13.jpg",@"14.jpg",@"15.jpg",@"16.jpg",@"17.jpg",@"18.jpg", nil];
    
    cell.backgroundColor = [UIColor whiteColor];
    
    cell.pictureImageView.image =  [UIImage imageNamed:array[indexPath.row]];
    
    
    //cell.userInteractionEnabled = YES;
    
    return cell;
}
//设置每个item的尺寸
- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath
{
    return CGSizeMake(123, 123);
}
//设置每个item的UIEdgeInsets
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
    return UIEdgeInsetsMake(0, 0, 0,0);
}
//设置每个item的水平间距
-(CGFloat) collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumLineSpacingForSectionAtIndex:(NSInteger)section
{
    return 2;
}
//设置每个item的垂直间距
- (CGFloat)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout minimumInteritemSpacingForSectionAtIndex:(NSInteger)section
{
    return 0;
}
//- (UICollectionReusableView *) colletionView:(UICollectionView *) collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath
//{
//    UICollectionReusableView *headerView = [collectionView dequeueReusableSupplementaryViewOfKind:UICollectionElementKindSectionHeader withReuseIdentifier:@"reusableView" forIndexPath:indexPath];
//    headerView.backgroundColor = [UIColor grayColor];
//    UILabel *label = [[UILabel alloc] initWithFrame:headerView.bounds];
//    label.text = @"这是collectionView的头部";
//    label.font = [UIFont systemFontOfSize:20];
//    [headerView addSubview:label];
//    return headerView;
//}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    SelectedCollectionViewCell *cell =(SelectedCollectionViewCell *) [collectionView cellForItemAtIndexPath:indexPath];
    cell.picturebutton.selected = !cell.picturebutton.selected;
    cell.backgroundColor = [UIColor colorWithRed:0.43f green:0.43f blue:0.43f alpha:1.00f];
}



- (IBAction)showAlert:(UIButton *)sender {
    UIAlertController* alert = [UIAlertController alertControllerWithTitle:@"确定上传所选内容"
                                                                   message:@" "
                                                            preferredStyle:UIAlertControllerStyleAlert];
    NSMutableAttributedString *titleText = [[NSMutableAttributedString alloc] initWithString:@"确定上传所选内容"];
    [titleText addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20] range:NSMakeRange(0, 8)];
    [titleText addAttribute:NSForegroundColorAttributeName value:[UIColor blackColor] range:NSMakeRange(0, 8)];
    [alert setValue:titleText forKey:@"attributedTitle"];
    
    UIAlertAction* defaultAction = [UIAlertAction actionWithTitle:@"确定" style:UIAlertActionStyleDefault
                                                          handler:^(UIAlertAction * action) {
                                                              //响应事件
                                                              NSLog(@"action = %@", action);
                                                          }];
    UIAlertAction* cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleDefault
                                                         handler:^(UIAlertAction * action) {
                                                             //响应事件
                                                             NSLog(@"action = %@", action);
                                                         }];
    
    [alert addAction:defaultAction];
    [alert addAction:cancelAction];
    alert.view.tintColor = [UIColor blackColor];
    [self presentViewController:alert animated:YES completion:nil];
    
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
