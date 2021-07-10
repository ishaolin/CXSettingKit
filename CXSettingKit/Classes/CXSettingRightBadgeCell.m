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
        _badgeLabel.font = CX_PingFangSC_RegularFont(12.0);
        _badgeLabel.textAlignment = NSTextAlignmentCenter;
        _badgeLabel.textColor = [UIColor whiteColor];
        _badgeLabel.backgroundColor = [UIColor redColor];
        
        [self.contentView addSubview:_badgeLabel];
    }
    
    return self;
}

- (void)displayRowModel:(CXSettingRowModel *)rowModel{
    [super displayRowModel:rowModel];
    
    CXSettingRightBadgeRowModel *badgeModel = (CXSettingRightBadgeRowModel *)rowModel;
    _badgeLabel.text = badgeModel.badgeValue;
    _badgeLabel.hidden = CXStringIsEmpty(badgeModel.badgeValue);
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat badgeLabel_W = 0;
    CGFloat badgeLabel_H = 18.0;
    if(!_badgeLabel.isHidden){
        badgeLabel_W = [CXStringBounding bounding:_badgeLabel.text
                                     rectWithSize:CGSizeMake(50.0, badgeLabel_H)
                                             font:_badgeLabel.font].size.width + 10.0;
        badgeLabel_W = MAX(badgeLabel_W, badgeLabel_H);
    }
    
    CGFloat badgeLabel_X = CGRectGetMinX(self.arrowView.frame) - badgeLabel_W;
    CGFloat badgeLabel_Y = (CGRectGetHeight(self.bounds) - badgeLabel_H) * 0.5;
    _badgeLabel.frame = (CGRect){badgeLabel_X, badgeLabel_Y, badgeLabel_W, badgeLabel_H};
    [_badgeLabel cx_roundedCornerRadii:badgeLabel_H * 0.5];
}

@end
