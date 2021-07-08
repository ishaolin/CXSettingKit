//
//  CXSettingTableViewCell.m
//  Pods
//
//  Created by wshaolin on 2019/3/29.
//

#import "CXSettingTableViewCell.h"
#import "CXSettingRightTextCell.h"
#import "CXSettingRightImageCell.h"
#import "CXSettingRightSwitchCell.h"
#import "CXSettingRightBadgeCell.h"

@implementation CXSettingTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView rowModel:(CXSettingRowModel *)rowModel{
    CXSettingTableViewCell *cell = nil;
    if([rowModel isKindOfClass:[CXSettingRightTextRowModel class]]){
        cell = [CXSettingRightTextCell cellWithTableView:tableView];
    }else if([rowModel isKindOfClass:[CXSettingRightImageRowModel class]]){
        cell = [CXSettingRightImageCell cellWithTableView:tableView];
    }else if([rowModel isKindOfClass:[CXSettingRightSwitchRowModel class]]){
        cell = [CXSettingRightSwitchCell cellWithTableView:tableView];
    }else if([rowModel isKindOfClass:[CXSettingRightBadgeRowModel class]]){
        cell = [CXSettingRightBadgeCell cellWithTableView:tableView];
    }else{
        cell = [CXSettingTableViewCell cellWithTableView:tableView];
    }
    
    cell.rowModel = rowModel;
    return cell;
}

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *reuseIdentifier = @"CXSettingTableViewCell";
    return [self cellWithTableView:tableView reuseIdentifier:reuseIdentifier];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
        _iconView = [[UIImageView alloc] init];
        
        _titleLabel = [[UILabel alloc] init];
        _titleLabel.font = CX_PingFangSC_RegularFont(14.0);
        _titleLabel.textColor = CXHexIColor(0x353C43);
        
        _arrowView = [[UIImageView alloc] init];
        _arrowView.image = CX_SETTING_IMAGE(@"setting_right_arrow");
        
        _lineView = [[UIView alloc] init];
        _lineView.backgroundColor = CXHexIColor(0xF0F0F0);
        
        [self.contentView addSubview:_iconView];
        [self.contentView addSubview:_titleLabel];
        [self.contentView addSubview:_arrowView];
        [self.contentView addSubview:_lineView];
    }
    
    return self;
}

- (void)setRowModel:(CXSettingRowModel *)rowModel{
    _rowModel = rowModel;
    
    if(rowModel.image){
        _iconView.image = rowModel.image;
        _iconView.hidden = NO;
    }else if([CXStringUtil isHTTPURL:rowModel.imageURL]){
        [_iconView cx_setImageWithURL:rowModel.imageURL];
        _iconView.hidden = NO;
    }else{
        _iconView.hidden = YES;
    }
    
    _titleLabel.textAlignment = rowModel.titleAlignment;
    _titleLabel.text = rowModel.title;
    _arrowView.hidden = rowModel.isArrowHidden;
    
    [self setNeedsLayout];
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat iconView_X = 15.0;
    CGFloat iconView_W = 32.0;
    if(_iconView.isHidden){
        iconView_W = 0;
    }
    CGFloat iconView_H = iconView_W;
    CGFloat iconView_Y = (CGRectGetHeight(self.bounds) - iconView_H) * 0.5;
    _iconView.frame = (CGRect){iconView_X, iconView_Y, iconView_W, iconView_H};
    
    CGFloat arrowView_W = 15.0;
    CGFloat arrowView_H = arrowView_W;
    CGFloat arrowView_Y = (CGRectGetHeight(self.bounds) - arrowView_H) * 0.5;
    CGFloat arrowView_X = CGRectGetWidth(self.bounds) - iconView_X - (_arrowView.isHidden ? 0 : arrowView_W);
    _arrowView.frame = (CGRect){arrowView_X, arrowView_Y, arrowView_W, arrowView_H};
    
    CGFloat lineView_X = iconView_X;
    CGFloat lineView_W = CGRectGetWidth(self.bounds) - lineView_X;
    CGFloat lineView_H = 0.5;
    CGFloat lineView_Y = CGRectGetHeight(self.bounds) - lineView_H;
    _lineView.frame = (CGRect){lineView_X, lineView_Y, lineView_W, lineView_H};
    
    [self layoutTitleLabel:arrowView_X];
}

- (void)layoutTitleLabel:(CGFloat)rightMaxX{
    CGFloat titleLabel_X = (_iconView.isHidden ? 0 : 5.0) + CGRectGetMaxX(_iconView.frame);
    CGFloat titleLabel_W = rightMaxX - titleLabel_X;
    CGFloat titleLabel_H = CGRectGetHeight(self.bounds);
    CGFloat titleLabel_Y = 0;
    _titleLabel.frame = (CGRect){titleLabel_X, titleLabel_Y, titleLabel_W, titleLabel_H};
}

@end
