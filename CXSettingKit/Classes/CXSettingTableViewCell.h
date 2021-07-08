//
//  CXSettingTableViewCell.h
//  Pods
//
//  Created by wshaolin on 2019/3/29.
//

#import <CXFoundation/CXFoundation.h>
#import "CXSettingKitDefines.h"
#import "CXSettingRowModel.h"

@interface CXSettingTableViewCell : CXTableViewCell

@property (nonatomic, strong, readonly) UIImageView *iconView;
@property (nonatomic, strong, readonly) UILabel *titleLabel;
@property (nonatomic, strong, readonly) UIImageView *arrowView;
@property (nonatomic, strong, readonly) UIView *lineView;

@property (nonatomic, strong) CXSettingRowModel *rowModel;

+ (instancetype)cellWithTableView:(UITableView *)tableView rowModel:(CXSettingRowModel *)rowModel;

- (void)layoutTitleLabel:(CGFloat)rightMaxX;

@end
