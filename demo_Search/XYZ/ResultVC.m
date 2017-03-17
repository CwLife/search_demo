//
//  ResultVC.m
//  XYZ
//
//  Created by TsCwLife on 16/9/28.
//  Copyright © 2016年 CwLife. All rights reserved.
//

#import "ResultVC.h"

@interface ResultVC ()

@end

@implementation ResultVC

-(void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    NSLog(@"%s",__FUNCTION__);
}

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"搜索结果";
    self.view.backgroundColor = [UIColor yellowColor];
}

-(void)setResults:(NSArray *)results {
    NSLog(@"%s",__FUNCTION__);
    _results = results;
    [self.tableView reloadData];
}

#pragma mark - Table view data source

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.results.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *flag=@"cellFlag";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:flag];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:flag];
    }
    [cell.textLabel setText:self.results[indexPath.row]];
    return cell;
}


@end
