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
        _titleLabel.font = CX_PingFangSC_RegularFont(16.0);
        _titleLabel.textColor = CXHexIColor(0x141414);
        
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
    if(_rowModel == rowModel){
        return;
    }
    
    _rowModel = rowModel;
    [self displayRowModel:rowModel];
    [self setNeedsLayout];
}

- (void)displayRowModel:(CXSettingRowModel *)rowModel{
    if([rowModel.image isKindOfClass:[UIImage class]]){
        _iconView.image = (UIImage *)rowModel.image;
        _iconView.hidden = NO;
    }else if([rowModel.image isKindOfClass:[NSString class]]){
        _iconView.hidden = NO;
        NSURL *url = [NSURL cx_validURL:rowModel.image];
        if(url){
            [_iconView cx_setImageWithURL:url];
        }else{
            _iconView.image = nil;
        }
    }else{
        _iconView.hidden = YES;
    }
    
    _titleLabel.textAlignment = rowModel.titleAlignment;
    _titleLabel.text = rowModel.title;
    _arrowView.hidden = rowModel.isArrowHidden;
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

- (void)layoutTitleLabel:(CGFloat)frameMaxX{
    CGFloat titleLabel_X = CGRectGetMaxX(_iconView.frame);
    if(!_iconView.isHidden){
        titleLabel_X += 5.0;
    }
    
    CGFloat titleLabel_W = frameMaxX - titleLabel_X;
    CGFloat titleLabel_H = CGRectGetHeight(self.bounds);
    CGFloat titleLabel_Y = 0;
    _titleLabel.frame = (CGRect){titleLabel_X, titleLabel_Y, titleLabel_W, titleLabel_H};
}

@end
