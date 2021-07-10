//
//  CXSettingRightTextCell.m
//  Pods
//
//  Created by wshaolin on 2019/4/1.
//

#import "CXSettingRightTextCell.h"

@implementation CXSettingRightTextCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *reuseIdentifier = @"CXSettingRightTextCell";
    return [self cellWithTableView:tableView reuseIdentifier:reuseIdentifier];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
        _rightTextLabel = [[UILabel alloc] init];
        _rightTextLabel.font = CX_PingFangSC_RegularFont(16.0);
        _rightTextLabel.textAlignment = NSTextAlignmentRight;
        _rightTextLabel.textColor = CXHexIColor(0x9099A1);
        
        [self.contentView addSubview:_rightTextLabel];
    }
    
    return self;
}

- (void)displayRowModel:(CXSettingRowModel *)rowModel{
    [super displayRowModel:rowModel];
    
    CXSettingRightTextRowModel *textModel = (CXSettingRightTextRowModel *)rowModel;
    _rightTextLabel.text = textModel.rightText;
    if(textModel.rightTextFont){
        _rightTextLabel.font = textModel.rightTextFont;
    }
    
    if(textModel.rightTextColor){
        _rightTextLabel.textColor = textModel.rightTextColor;
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat titleLabel_W = [self.titleLabel sizeThatFits:CGSizeZero].width;
    
    CGFloat rightTextLabel_X = CGRectGetMinX(self.titleLabel.frame) + titleLabel_W + 20.0;
    CGFloat rightTextLabel_W = CGRectGetMinX(self.arrowView.frame) - rightTextLabel_X;
    CGFloat rightTextLabel_H =CGRectGetHeight(self.bounds);
    CGFloat rightTextLabel_Y = 0;
    _rightTextLabel.frame = (CGRect){rightTextLabel_X, rightTextLabel_Y, rightTextLabel_W, rightTextLabel_H};
    
    [self layoutTitleLabel:rightTextLabel_X];
}

@end
