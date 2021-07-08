//
//  CXSettingViewController.m
//  Pods
//
//  Created by wshaolin on 2019/3/29.
//

#import "CXSettingViewController.h"
#import "CXSettingTableViewCell.h"

@implementation CXSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    CGFloat tableView_X = 0;
    CGFloat tableView_Y = CGRectGetMaxY(self.navigationBar.frame);
    CGFloat tableView_W = CGRectGetWidth(self.view.bounds);
    CGFloat tableView_H = CGRectGetHeight(self.view.bounds) - tableView_Y;
    _tableView = [[CXTableView alloc] initWithFrame:CGRectMake(tableView_X, tableView_Y, tableView_W, tableView_H) style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.contentInset = [UIScreen mainScreen].cx_scrollViewSafeAreaInset;
    [self.view addSubview:_tableView];
    
    [self reloadData];
}

- (void)reloadData{
    [self loadDataWithCompletion:^(NSArray<CXSettingSectionModel *> *items) {
        if(items){
            self->_settingItems = items;
            [self tableViewReloadData];
        }
    }];
}

- (void)loadDataWithCompletion:(CXSettingViewControllerDataBlock)completion{
    !completion ?: completion(nil);
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.settingItems.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    CXSettingSectionModel *sectionModel = self.settingItems[section];
    return sectionModel.rows.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CXSettingSectionModel *sectionModel = self.settingItems[indexPath.section];
    CXSettingRowModel *rowModel = sectionModel.rows[indexPath.row];
    CXSettingTableViewCell *cell = [CXSettingTableViewCell cellWithTableView:tableView rowModel:rowModel];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CXSettingSectionModel *sectionModel = self.settingItems[indexPath.section];
    CXSettingRowModel *rowModel = sectionModel.rows[indexPath.row];
    return rowModel.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CXSettingSectionModel *sectionModel = self.settingItems[section];
    return sectionModel.footerHeight;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    return nil;
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    return nil;
}

- (BOOL)tableView:(UITableView *)tableView shouldHighlightRowAtIndexPath:(NSIndexPath *)indexPath{
    CXSettingSectionModel *sectionModel = self.settingItems[indexPath.section];
    CXSettingRowModel *rowModel = sectionModel.rows[indexPath.row];
    return rowModel.isEnabled;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    CXSettingSectionModel *sectionModel = self.settingItems[indexPath.section];
    CXSettingRowModel *rowModel = sectionModel.rows[indexPath.row];
    [rowModel invokeActionForContext:self];
}

- (void)tableViewReloadData{
    [self.tableView reloadData];
}

@end
