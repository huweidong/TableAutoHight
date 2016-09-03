//
//  MainViewController.m
//  TableAutoHight
//
//  Created by echo on 16/9/3.
//  Copyright © 2016年 echo. All rights reserved.
//

#import "MainViewController.h"
#import "MainCell.h"

static NSString *reuseID=@"MainCell";

@interface MainViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (copy, nonatomic) NSString *titleStr;
@property (copy, nonatomic) NSString *contentStr;

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tableView.delegate=self;
    self.tableView.dataSource=self;
    self.titleStr=@"为防范人工智能背叛人类 谷歌微软等巨头决心联手合作";
    self.contentStr=@"根据《纽约时报》的报道，这 5 家公司近期举行了一场会谈，在人工智能对劳动市场、交通和战争等方面的道德伦理标准展开了讨论。他们还打算成立一个相关的行业协会，这个协会的目的是确保人工智能有利于人类而不是伤害人类，但参会者还没有确定具体的协会名称。";
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark -- UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 10;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    MainCell *cell = [tableView dequeueReusableCellWithIdentifier:reuseID];
    if (cell == nil) {
        //创建和获取可重用单元格 代码和IB结合方式 IB中Table View Cell 的属性Identifier需设置
        cell = [[[NSBundle mainBundle] loadNibNamed:reuseID owner:self options:nil] lastObject];
    }
    cell.titleStr = self.titleStr;
    cell.contentStr=self.contentStr;
    [cell loadData];
    
    return cell;
}


#pragma mark -- UITableViewDelegate
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    // 创建可重复使用的Cell
    static MainCell *sizingCell = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        sizingCell = [self.tableView dequeueReusableCellWithIdentifier:reuseID];
        if (!sizingCell) {
            sizingCell = [[[NSBundle mainBundle] loadNibNamed:reuseID owner:self options:nil] lastObject];
        }
    });
    
    //设置cell自控件内容
    sizingCell.titleStr = self.titleStr;
    sizingCell.contentStr=self.contentStr;
    [sizingCell loadData];
    
    //先让约束实现
    sizingCell.bounds = CGRectMake(0.0f, 0.0f, CGRectGetWidth(tableView.frame), CGRectGetHeight(sizingCell.bounds));
    [sizingCell setNeedsLayout];
    [sizingCell layoutIfNeeded];
    //获取
    CGSize size = [sizingCell.contentView systemLayoutSizeFittingSize:UILayoutFittingCompressedSize];
    return size.height + 1.0f;
    
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
