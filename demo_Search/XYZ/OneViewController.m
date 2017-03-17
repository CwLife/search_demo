//
//  OneViewController.m
//  XYZ
//
//  Created by TsCwLife on 16/5/9.
//  Copyright © 2016年 CwLife. All rights reserved.
//

#import "OneViewController.h"

@interface OneViewController ()<UISearchBarDelegate>

@property (nonatomic,strong) UISearchBar *searchBar;

@end

@implementation OneViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    
    //一般不会单独使用searchBar，都是结合UISearchController使用
    _searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(30, 100, 350, 60)];
    _searchBar.delegate = self;
    _searchBar.placeholder = @"placeholder";
    _searchBar.prompt = @"prompt";
    //_searchBar.text = @"直接搜";
    
    _searchBar.searchBarStyle = UISearchBarStyleDefault;
    //各个按钮的图标
    [_searchBar setImage:[UIImage imageNamed:@"test.jpg"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
    //各个按钮的位置
    [_searchBar setPositionAdjustment:UIOffsetMake(0, 0) forSearchBarIcon:UISearchBarIconSearch];
    
    _searchBar.showsBookmarkButton = YES;
    _searchBar.showsCancelButton = YES;
    _searchBar.showsSearchResultsButton = YES; //与BookmarkButton重叠
    _searchBar.showsScopeBar = YES;
    _searchBar.scopeButtonTitles = @[@"scope01",@"scope02",@"scope03"];
    
    [self.view addSubview:_searchBar];
}

// FIXME: UISearchBarDelegate

// return NO to not become first responder
- (BOOL)searchBarShouldBeginEditing:(UISearchBar *)searchBar{
    NSLog(@"%s",__func__);
    return YES;
}

// called when text starts editing
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar {
    NSLog(@"%s",__func__);
    NSLog(@"searchBar.text = %@",searchBar.text);
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
    
    //可以在这里实现跳转新控制器
    //通过searchBar.text 参数来请求搜索结果
}

// called when bookmark button pressed
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"%s",__func__);
}

// called when cancel button pressed
- (void)searchBarCancelButtonClicked:(UISearchBar *)searchBar{
    NSLog(@"%s",__func__);
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
