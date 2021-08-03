//
//  CXSettingViewController.m
//  Pods
//
//  Created by wshaolin on 2019/3/29.
//

#import "CXSettingViewController.h"
#import "CXSettingTableViewCell.h"
#import "CXSettingHeaderFooterView.h"

@interface CXSettingSectionModel ()

- (void)calculate:(CGFloat)width;

@end

@implementation CXSettingViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.title = @"设置";
    
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
            [items enumerateObjectsUsingBlock:^(CXSettingSectionModel * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
                [obj calculate:CGRectGetWidth(self.tableView.bounds)];
            }];
            
            self->_settingItems = items;
            [self refreshDisplay];
        }
    }];
}

- (void)loadDataWithCompletion:(CXSettingViewControllerDataBlock)completion{
    
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
    return [self tableView:tableView cellForRowModel:rowModel];
}

- (CXSettingTableViewCell *)tableView:(UITableView *)tableView cellForRowModel:(CXSettingRowModel *)rowModel{
    return [CXSettingTableViewCell cellWithTableView:tableView rowModel:rowModel];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CXSettingSectionModel *sectionModel = self.settingItems[indexPath.section];
    CXSettingRowModel *rowModel = sectionModel.rows[indexPath.row];
    return rowModel.height;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section{
    CXSettingSectionModel *sectionModel = self.settingItems[section];
    return sectionModel.footer ? sectionModel.footer.height : 10.0;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    CXSettingSectionModel *sectionModel = self.settingItems[section];
    return sectionModel.header ? sectionModel.header.height : CGFLOAT_MIN;
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CXSettingSectionModel *sectionModel = self.settingItems[section];
    return [CXSettingHeaderFooterView viewWithTableView:tableView dataModel:sectionModel.header];
}

- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section{
    CXSettingSectionModel *sectionModel = self.settingItems[section];
    return [CXSettingHeaderFooterView viewWithTableView:tableView dataModel:sectionModel.footer];
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

- (void)refreshDisplay{
    [self.tableView reloadData];
}

- (void)refreshDisplayForRowModel:(CXSettingRowModel *)model{
    __block NSUInteger section = 0;
    __block NSUInteger row = NSNotFound;
    [self.settingItems enumerateObjectsUsingBlock:^(CXSettingSectionModel * _Nonnull sectionModel, NSUInteger sectionIndex, BOOL * _Nonnull sectionStop) {
        [sectionModel.rows enumerateObjectsUsingBlock:^(CXSettingRowModel * _Nonnull rowModel, NSUInteger rowIndex, BOOL * _Nonnull rowStop) {
            if(model == rowModel){
                section = sectionIndex;
                row = rowIndex;
                
                *rowStop = YES;
                *sectionStop = YES;
            }
        }];
    }];
    
    if(row != NSNotFound){
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:row inSection:section];
        [self.tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
    }
}

@end
