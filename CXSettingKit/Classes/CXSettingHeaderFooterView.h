//
//  CXSettingHeaderFooterView.h
//  CXSettingKit
//
//  Created by Michael Lynn on 2021/7/9.
//

#import <UIKit/UIKit.h>

@class CXSettingHeaderFooterModel;

@interface CXSettingHeaderFooterView : UITableViewHeaderFooterView

@property (nonatomic, strong, readonly) UILabel *contentLabel;

@property (nonatomic, strong) CXSettingHeaderFooterModel *dataModel;

+ (instancetype)viewWithTableView:(UITableView *)tableView
                        dataModel:(CXSettingHeaderFooterModel *)dataModel;

@end
