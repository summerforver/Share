//
//  XLViewController.m
//  Share
//
//  Created by 王一卓 on 2018/8/6.
//  Copyright © 2018年 王一卓. All rights reserved.
//

#import "XLViewController.h"

@interface XLViewController ()

@end

@implementation XLViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.navigationItem.title = @"与小兰的对话";
    self.view.backgroundColor = [UIColor whiteColor];
    self.navigationController.navigationBar.barTintColor = [UIColor colorWithRed:0.22f green:0.52f blue:0.81f alpha:1.00f];
    
  
    
    UIBarButtonItem *leftButton = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"返回"] style:UIBarButtonItemStylePlain target:self action:@selector(press)];
    leftButton.tintColor = [UIColor colorWithRed:0.99f green:1.00f blue:1.00f alpha:1.00f];
    
    self.navigationItem.leftBarButtonItem = leftButton;
    
    _text = [[UITextField alloc] initWithFrame:CGRectMake(20, 5, 290, 40)];
    _text.borderStyle = UITextBorderStyleRoundedRect;
//    _text.backgroundColor = [UIColor whiteColor];
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    btn.backgroundColor = [UIColor colorWithRed:69/255.0 green:141/255.0 blue:203/255.0 alpha:1];
//    btn.backgroundColor = [UIColor whiteColor];
    [btn setTitle:@"发送" forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(send) forControlEvents:UIControlEventTouchUpInside];
    btn.frame = CGRectMake(320, 5, 50, 40);
    btn.layer.borderWidth = 1;
    btn.layer.cornerRadius = 10;
    
    UIView *iview = [[UIView alloc] initWithFrame:CGRectMake(0, 610, 375, 60 )];
    iview.backgroundColor = [UIColor blackColor];
    [iview addSubview:_text];
    [iview addSubview:btn];
    
    
    // 设置 TableView
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, 375, 674 - 44 * 2) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    _tableView.showsVerticalScrollIndicator=NO;
    [self.view addSubview:_tableView];
    [self.view addSubview:iview];
    [self.view bringSubviewToFront:iview];
    
    // 设置聊天信息数值
    _messageArray = [NSMutableArray arrayWithObjects:@"你拍的真不错！", @"谢谢，已关注你。", @"好专业的照片，非常喜欢这种风格，期待你更好的作品。", @"嗯嗯，好的。",nil];
    _rowheightArray = [NSMutableArray array];
    for (NSString *str in _messageArray){
        NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
        CGSize size = [str boundingRectWithSize:CGSizeMake(375 * 0.6, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        
        int height = size.height + 375 * 0.15;
        _rowheight = [NSNumber numberWithInt:height];
        [_rowheightArray addObject:_rowheight];
    }
    // 键盘回收事件
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillAppear:) name:UIKeyboardWillShowNotification object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillDisAppear:) name:UIKeyboardWillHideNotification object:nil];

    
}

- (void)send {
    
    [_messageArray addObject:_text.text];
    NSDictionary *attri = @{NSFontAttributeName:[UIFont systemFontOfSize:18]};
    // 自适应高度，并计算
    CGSize size = [_text.text boundingRectWithSize:CGSizeMake(375 * 0.6, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
    int height = size.height + 375 * 0.15;
//    int height = size.height;
    _rowheight = [NSNumber numberWithInt:height];
    [_rowheightArray addObject:_rowheight];
    // 插入一条新的cell
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:(_messageArray.count - 1) inSection:0];
//    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationBottom];
//     [self.tableView insertRowsAtIndexPaths:indexPath withRowAnimation:UITableViewRowAnimationBottom];
    // 更新tableView
    [self.tableView reloadData];
    // 滚动界面
    [self.tableView scrollToRowAtIndexPath:indexPath atScrollPosition:UITableViewScrollPositionBottom animated:YES];
    // 清空 textField
    _text.text = @"";
    
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 4;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 100;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString *cellIdentifier = @"cell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    if (!cell){
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellIdentifier];
    } else { // tableView 的服用，如果不删除，会出现bug
        //删除cell的所有子视图
        while ([cell.contentView.subviews lastObject] != nil) {
            [(UIView*)[cell.contentView.subviews lastObject] removeFromSuperview];
        }
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    // 一人一句话
    if(indexPath.row % 2 != 0){
        // 设置头像
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sixin_img2"]];
        imageView.frame = CGRectMake(375 * 0.01, 375 * 0.05, 375 * 0.1, 375 * 0.1);
        [cell.contentView addSubview:imageView];
        
        // 设置聊天气泡
        UIImageView *imageviewbubble = [[UIImageView alloc] init];
        imageviewbubble.backgroundColor = [UIColor colorWithRed:211/225.0 green:211/225.0 blue:211/225.0 alpha:0.5];
        //        UIImage *image = [UIImage imageNamed:@"对话框1"];
        //        UIEdgeInsets edge = UIEdgeInsetsMake(image.size.height * 0.5, image.size.width * 0.8, image.size.height * 0.8, image.size.width * 0.5);
        //        image = [image resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
        //        imageviewbubble.image = image;
        
        // 设置对话框
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.text = _messageArray[indexPath.row];
        label.font = [UIFont systemFontOfSize:18];
        NSDictionary* attri = @{NSFontAttributeName:label.font};
        // 自适应高度
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(375 * 0.6, MAXFLOAT) options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        label.frame = CGRectMake(375 * 0.16, 375 * 0.05, size.width, size.height);
        imageviewbubble.frame = CGRectMake(375 * 0.13, 375 * 0.01, size.width + 375 * 0.10, size.height + 375 * 0.10);
        [cell.contentView addSubview:imageviewbubble];
        [cell.contentView addSubview:label];
        
        
    }
    else{ //第二个人，形同的套路
        UIImageView *imageView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"sixin_img1"]];
        imageView.frame = CGRectMake(375 - 375 * 0.11, 375 * 0.05, 375 * 0.1, 375 * 0.1);
        [cell.contentView addSubview:imageView];
        
        UILabel *label = [[UILabel alloc] init];
        label.numberOfLines = 0;
        label.text = _messageArray[indexPath.row];
        label.font = [UIFont systemFontOfSize:18];
        NSDictionary* attri = @{NSFontAttributeName:label.font};
        CGSize size = [label.text boundingRectWithSize:CGSizeMake(375*0.6, MAXFLOAT)  options:NSStringDrawingUsesLineFragmentOrigin attributes:attri context:nil].size;
        
        label.frame = CGRectMake(375 - 375 * 0.14 - size.width, 375 * 0.05, size.width, size.height);
        
        UIImageView *imageviewbubble = [[UIImageView alloc]init];
        imageviewbubble.backgroundColor = [UIColor colorWithRed:211/225.0 green:211/225.0 blue:211/225.0 alpha:0.5];
        //        UIImage *image = [UIImage imageNamed:@"对话框"];
        imageviewbubble.frame = CGRectMake(375 * 0.8 - size.width, 375 * 0.01, size.width + 375 * 0.08, size.height + 375 * 0.10);
        //        UIEdgeInsets edge = UIEdgeInsetsMake(image.size.height * 0.5, image.size.width*0.5, image.size.height*0.8, image.size.width*0.8);
        //        image = [image resizableImageWithCapInsets:edge resizingMode:UIImageResizingModeStretch];
        //        imageviewbubble.image = image;
        [cell.contentView addSubview:imageviewbubble];
        [cell.contentView addSubview:label];
        
    }
    
    return cell;
}

// 先是简单的键盘回收
- (void)keyboardWillDisAppear:(NSNotification *)notification{
    // 第一个参数是动画持续时间
    // 第二个参数是方法，这里让视图恢复原来的位置就好
    [UIView animateWithDuration:1 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, 0);}];
}

// 键盘出现
- (void)keyboardWillAppear:(NSNotification *)notification{
    // 计算键盘高度
    CGRect keyboardFrame = [notification.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY = keyboardFrame.origin.y;
    // 视图整体上升，这里的64是状态栏高度
    [UIView animateWithDuration:1.0 animations:^{self.view.transform = CGAffineTransformMakeTranslation(0, keyboardY - self.view.frame.size.height );}];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    [self.view endEditing:YES];
}

- (void)press {
    [self.navigationController popViewControllerAnimated:YES];
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
