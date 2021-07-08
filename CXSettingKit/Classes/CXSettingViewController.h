//
//  CXSettingViewController.h
//  Pods
//
//  Created by wshaolin on 2019/3/29.
//

#import <CXUIKit/CXUIKit.h>
#import "CXSettingSectionModel.h"

typedef void(^CXSettingViewControllerDataBlock)(NSArray<CXSettingSectionModel *> *items);

@interface CXSettingViewController : CXBaseViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong, readonly) CXTableView *tableView;
@property (nonatomic, strong, readonly) NSArray<CXSettingSectionModel *> *settingItems;

- (void)reloadData; // 重新获取数据源

- (void)loadDataWithCompletion:(CXSettingViewControllerDataBlock)completion;

- (void)tableViewReloadData; // 刷新列表的显示

@end
