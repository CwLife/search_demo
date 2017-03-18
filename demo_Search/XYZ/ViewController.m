//
//  ViewController.m
//  XYZ
//
//  Created by TsCwLife on 16/5/6.
//  Copyright © 2016年 CwLife. All rights reserved.
//

#import "ViewController.h"
#import "OneViewController.h"
#import "TwoViewController.h"
#import "ThreeViewController.h"
#import "FourViewController.h"

@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) NSArray *dataArray;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    self.navigationController.title = @"XY_learn";
    
    
    
    _dataArray = [[NSArray  alloc] init];
    _dataArray = @[@"1. UISearchBar",
                   @"2. 当前页展示结果",
                   @"3. 跳转页展示结果",
                   @"4. searchBar在导航栏上",
                   @"5. ",
                   @"6. ",
                   @"7. "];
    
    
    self.automaticallyAdjustsScrollViewInsets = NO;
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, XYScreenW, XYScreenH - 64) style:UITableViewStylePlain];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _dataArray.count;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    return  90;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *cellID = @"cellId";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (!cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellID];
    }
    
    //
    cell.backgroundColor = [UIColor colorWithRed:arc4random()%3*0.1 green:arc4random()%10*0.1 blue:arc4random()%7*0.1 alpha:1.0f];
    cell.textLabel.text = _dataArray[indexPath.row];
    cell.textLabel.font = [UIFont boldSystemFontOfSize:27];
    
    //
    
    return cell;
}

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    NSString *title = cell.textLabel.text;
    
    switch (indexPath.row) {
        case 0:
        {
            OneViewController *vc = [OneViewController new];
            vc.title = title;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 1:
        {
            TwoViewController *vc = [TwoViewController new];
            vc.title = title;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 2:
        {
            ThreeViewController *vc = [ThreeViewController new];
            vc.title = title;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
        case 3:
        {
            FourViewController *vc = [FourViewController new];
           // vc.title = title;
            [self.navigationController pushViewController:vc animated:YES];
        }
            break;
            
        default:
            break;
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
