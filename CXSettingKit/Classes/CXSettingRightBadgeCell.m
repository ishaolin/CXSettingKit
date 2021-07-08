//
//  CXSettingRightBadgeCell.m
//  Pods
//
//  Created by wshaolin on 2019/4/1.
//

#import "CXSettingRightBadgeCell.h"

@implementation CXSettingRightBadgeCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *reuseIdentifier = @"CXSettingRightBadgeCell";
    return [self cellWithTableView:tableView reuseIdentifier:reuseIdentifier];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
        _badgeLabel = [[UILabel alloc] init];
        _badgeLabel.font = CX_PingFangSC_RegularFont(11.0);
        _badgeLabel.textAlignment = NSTextAlignmentCenter;
        _badgeLabel.textColor = [UIColor whiteColor];
        _badgeLabel.backgroundColor = [UIColor redColor];
        [self.contentView addSubview:_badgeLabel];
    }
    
    return self;
}

- (void)setRowModel:(CXSettingRowModel *)rowModel{
    CXSettingRightBadgeRowModel *badgeModel = (CXSettingRightBadgeRowModel *)rowModel;
    _badgeLabel.text = badgeModel.badgeValue;
    _badgeLabel.hidden = CXStringIsEmpty(badgeModel.badgeValue);
    
    [super setRowModel:rowModel];
}

- (void)layoutSubviews{
    
    CGFloat badgeLabel_W = 0;
    CGFloat badgeLabel_H = 16.0;
    if(!_badgeLabel.isHidden){
        badgeLabel_W = [_badgeLabel.text boundingRectWithSize:CGSizeMake(50.0, badgeLabel_H)
                                                      options:NSStringDrawingUsesLineFragmentOrigin
                                                   attributes:@{NSFontAttributeName : _badgeLabel.font}
                                                      context:nil].size.width + 10.0;
        badgeLabel_W = MAX(badgeLabel_W, badgeLabel_H);
    }
    
    CGFloat badgeLabel_X = CGRectGetMinX(self.arrowView.frame) - badgeLabel_W;
    CGFloat badgeLabel_Y = (CGRectGetHeight(self.bounds) - badgeLabel_H) * 0.5;
    _badgeLabel.frame = (CGRect){badgeLabel_X, badgeLabel_Y, badgeLabel_W, badgeLabel_H};
}

@end
