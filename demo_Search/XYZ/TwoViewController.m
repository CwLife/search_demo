//
//  TwoViewController.m
//  XYZ
//
//  Created by TsCwLife on 16/5/9.
//  Copyright © 2016年 CwLife. All rights reserved.
//

#import "TwoViewController.h"


@interface TwoViewController ()<UITableViewDataSource,UITableViewDelegate,UISearchResultsUpdating,UISearchControllerDelegate,UISearchBarDelegate>

@property (nonatomic, strong) UITableView *tableView;
@property (strong,nonatomic) NSMutableArray  *dataList;  //原始数据

@property (nonatomic, strong) UISearchController * searchController;
@property (strong,nonatomic) NSMutableArray  *searchList;  //搜索结果

@end

@implementation TwoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.automaticallyAdjustsScrollViewInsets = NO;
    
    _tableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 64, XYScreenW, XYScreenH - 64) style:UITableViewStylePlain];
    _tableView.backgroundColor = [UIColor whiteColor];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    [self.view addSubview:_tableView];
    
    
    //UISearchController
    _searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    _searchController.searchResultsUpdater = self;
    _searchController.delegate = self;
    _searchController.dimsBackgroundDuringPresentation = NO;
    _searchController.hidesNavigationBarDuringPresentation = NO;
    
    _searchController.searchBar.placeholder = @"placeholder";
    _searchController.searchBar.searchBarStyle = UISearchBarStyleProminent;
    //_searchController.searchBar.prompt = @"prompt"; //提示语
    _searchController.searchBar.showsCancelButton = YES;
    //_searchController.searchBar.showsBookmarkButton = YES;
    //_searchController.searchBar.showsSearchResultsButton = YES;
    
    //ScopeBar
    //_searchController.searchBar.showsScopeBar = YES;
    //_searchController.searchBar.scopeButtonTitles = @[@"BookmarkButton" ,@"ScopeButton",@"ResultsListButton",@"CancelButton",@"SearchButton"];
    
    _searchController.searchBar.delegate = self;
    _searchController.searchBar.frame = CGRectMake(0, 0, XYScreenW, 60);
    self.tableView.tableHeaderView = _searchController.searchBar;
    
    //解决：退出时搜索框依然存在的问题
    self.definesPresentationContext = YES;
    
}


// FIXME: ---------
#pragma mark UISearchResultsUpdating
// 每次更新搜索框里的文字，就会调用这个方法
// Called when the search bar's text or scope has changed or when the search bar becomes first responder.
// 根据输入的关键词及时响应：里面可以实现筛选逻辑  也显示可以联想词
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController {
    NSLog(@"%s",__func__);
    
    // 获取搜索框里地字符串
    NSString *searchString = searchController.searchBar.text;
    
    // 谓词
    /**
     1.BEGINSWITH ： 搜索结果的字符串是以搜索框里的字符开头的
     2.ENDSWITH   ： 搜索结果的字符串是以搜索框里的字符结尾的
     3.CONTAINS   ： 搜索结果的字符串包含搜索框里的字符
     
     [c]不区分大小写[d]不区分发音符号即没有重音符号[cd]既不区分大小写，也不区分发音符号。
     
     */
    
    // 创建谓词
    NSPredicate * predicate = [NSPredicate  predicateWithFormat:@"SELF CONTAINS %@",searchString];
    
    if (self.searchList!= nil) {
        [self.searchList removeAllObjects];
    }
    
    //过滤数据
    self.searchList = [[_dataList filteredArrayUsingPredicate:predicate] mutableCopy];
    
    //刷新表格
    [self.tableView reloadData];
}

// TODO: UISearchControllerDelegate
// These methods are called when automatic presentation(展示结果) or dismissal（不展示结果） occurs.
// They will not be called if you present or dismiss the search controller yourself.
- (void)willPresentSearchController:(UISearchController *)searchController {
    NSLog(@"%s",__func__);
}
- (void)didPresentSearchController:(UISearchController *)searchController{
    NSLog(@"%s",__func__);
}
- (void)willDismissSearchController:(UISearchController *)searchController{
    NSLog(@"%s",__func__);
}
- (void)didDismissSearchController:(UISearchController *)searchController{
    NSLog(@"%s",__func__);
}

// Called after the search controller's search bar has agreed to begin editing or when 'active' is set to YES. If you choose not to present the controller yourself or do not implement this method, a default presentation is performed on your behalf.
- (void)presentSearchController:(UISearchController *)searchController {
    NSLog(@"%s",__func__);
}


#pragma mark UISearchBarDelegate

// return NO to not become first responder
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"%s",__func__);
    return YES;
}

// called when text starts editing
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"%s",__func__);
    NSLog(@"searchBar.text = %@",searchBar.text);
    [self.tableView reloadData];
}

// return NO to not resign first responder
- (BOOL)searchBarShouldEndEditing:(UISearchBar *)searchBar {
    NSLog(@"%s",__func__);
    return YES;
}

// called when text ends editing
- (void)searchBarTextDidEndEditing:(UISearchBar *)searchBar {
    NSLog(@"%s",__func__);
    NSLog(@"searchBar.text = %@",searchBar.text);
}

// called before text changes
- (BOOL)searchBar:(UISearchBar *)searchBar shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text {
    NSLog(@"%s",__func__);
    NSLog(@"searchBar.text = %@",searchBar.text);
    return YES;
}

// called when text changes (including clear)
- (void)searchBar:(UISearchBar *)searchBar textDidChange:(NSString *)searchText {
    NSLog(@"%s",__func__);
    NSLog(@"searchBar.text = %@",searchBar.text);
}

// called when keyboard search button pressed 键盘搜索按钮
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar {
    NSLog(@"%s",__func__);
    NSLog(@"searchBar.text = %@",searchBar.text);
    if (!self.searchController.active) {
        [self.tableView reloadData];
    }
    [self.searchController.searchBar resignFirstResponder];
}

// called when bookmark button pressed
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"%s",__func__);
}

// called when cancel button pressed
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"%s",__func__);
    [self.tableView reloadData];
}

// called when search results button pressed
- (void)searchBarResultsListButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"%s",__func__);
}

// selecte ScopeButton
- (void)searchBar:(UISearchBar *)searchBar selectedScopeButtonIndexDidChange:(NSInteger)selectedScope {
    NSLog(@"%s",__func__);
    NSLog(@"selectedScope = %ld",selectedScope);
}



// MARK: 懒加载
- (NSMutableArray *) dataList {
    if (_dataList == nil) {
        _dataList = [NSMutableArray arrayWithCapacity:100];
        for (NSInteger i=0; i<100; i++) {
            [_dataList addObject:[NSString stringWithFormat:@"%ld-FlyElephant",(long)i]];
        }
    }
    return _dataList;
}

- (NSMutableArray *) searchList {
    if (_searchList == nil) {
        _searchList = [NSMutableArray array];
    }
    return _searchList;
}




#pragma mark - UITableViewDataSource
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (self.searchController.active) {
        return [self.searchList count];
    }else{
        return [self.dataList count];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    static NSString *flag=@"cellFlag";
    UITableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:flag];
    if (cell==nil) {
        cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:flag];
    }
    if (self.searchController.active) {
        [cell.textLabel setText:self.searchList[indexPath.row]];
    }
    else{
        [cell.textLabel setText:self.dataList[indexPath.row]];
    }
    return cell;
}

#pragma mark - UITableViewDelegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    self.searchController.searchBar.text = cell.textLabel.text;
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
