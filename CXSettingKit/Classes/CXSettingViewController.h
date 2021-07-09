//
//  CXSettingViewController.h
//  Pods
//
//  Created by wshaolin on 2019/3/29.
//

#import <CXUIKit/CXUIKit.h>
#import "CXSettingSectionModel.h"

@class CXSettingTableViewCell;

typedef void(^CXSettingViewControllerDataBlock)(NSArray<CXSettingSectionModel *> *items);

@interface CXSettingViewController : CXBaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong, readonly) CXTableView *tableView;
@property (nonatomic, strong, readonly) NSArray<CXSettingSectionModel *> *settingItems;

- (void)reloadData; // 重新获取数据源

- (void)loadDataWithCompletion:(CXSettingViewControllerDataBlock)completion; // 子类实现，提供数据

- (CXSettingTableViewCell *)tableView:(UITableView *)tableView cellForRowModel:(CXSettingRowModel *)rowModel;

- (void)refreshDisplay; // 刷新列表显示
- (void)refreshDisplayForRowModel:(CXSettingRowModel *)rowModel; // 刷新rowModel对应的cell

@end
