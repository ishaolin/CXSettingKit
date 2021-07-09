//
//  CXSettingRightImageCell.m
//  Pods
//
//  Created by wshaolin on 2019/4/1.
//

#import "CXSettingRightImageCell.h"

@interface CXSettingRightImageCell () {
    CGSize _rightImageSize;
}

@end

@implementation CXSettingRightImageCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *reuseIdentifier = @"CXSettingRightImageCell";
    return [self cellWithTableView:tableView reuseIdentifier:reuseIdentifier];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
        _rightImageView = [[UIImageView alloc] init];
        
        [self.contentView addSubview:_rightImageView];
    }
    
    return self;
}

- (void)displayRowModel:(CXSettingRowModel *)rowModel{
    [super displayRowModel:rowModel];
    
    CXSettingRightImageRowModel *imageModel = (CXSettingRightImageRowModel *)rowModel;
    if([imageModel.rightImage isKindOfClass:[UIImage class]]){
        _rightImageView.image = (UIImage *)imageModel.rightImage;
    }else if([imageModel.rightImage isKindOfClass:[NSString class]]){
        [_rightImageView cx_setImageWithURL:(NSString *)imageModel.rightImage];
    }else{
        _rightImageView.image = nil;
    }
    
    _rightImageSize = imageModel.rightImageSize;
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat rightImageView_W = _rightImageSize.width;
    CGFloat rightImageView_H = _rightImageSize.height;
    CGFloat rightImageView_X = CGRectGetMinX(self.arrowView.frame) - rightImageView_W;
    CGFloat rightImageView_Y = (CGRectGetHeight(self.bounds) - rightImageView_H) * 0.5;
    _rightImageView.frame = (CGRect){rightImageView_X, rightImageView_Y, rightImageView_W, rightImageView_H};
    
    [self layoutTitleLabel:rightImageView_X];
}

@end
