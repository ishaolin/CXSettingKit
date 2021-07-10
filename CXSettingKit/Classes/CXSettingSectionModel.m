//
//  CXSettingSectionModel.m
//  Pods
//
//  Created by wshaolin on 2019/3/29.
//

#import "CXSettingSectionModel.h"

@interface CXSettingHeaderFooterModel () {
    UIEdgeInsets _edgeInsets;
}

- (void)calculate:(CGFloat)width;

@end

@implementation CXSettingHeaderFooterModel

- (instancetype)initWithText:(NSString *)text{
    return [self initWithText:text edgeInsets:UIEdgeInsetsMake(7.0, 15.0, 7.0, 15.0)];
}

- (instancetype)initWithText:(NSString *)text edgeInsets:(UIEdgeInsets)insets{
    if(self = [super init]){
        _text = text;
        _edgeInsets = insets;
        _font = CX_PingFangSC_RegularFont(13.0);
        _textColor = CXHexIColor(0x888888);
    }
    
    return self;
}

- (instancetype)initWithHeight:(CGFloat)height{
    if(self = [super init]){
        _height = height;
    }
    
    return self;
}

- (void)calculate:(CGFloat)width{
    if(CXStringIsEmpty(_text)){
        return;
    }
    
    CGFloat frame_X = _edgeInsets.left;
    CGFloat frame_Y = _edgeInsets.top;
    CGFloat frame_W = width - frame_X - _edgeInsets.right;
    CGFloat frame_H = [CXStringBounding bounding:_text rectWithSize:CGSizeZero font:_font].size.height;
    _frame = (CGRect){frame_X, frame_Y, frame_W, frame_H};
    
    _height = CGRectGetMaxY(_frame) + _edgeInsets.bottom;
}

@end

@implementation CXSettingSectionModel

- (instancetype)initWithRows:(NSArray<CXSettingRowModel *> *)rows{
    return [self initWithRows:rows header:nil footer:nil];
}

- (instancetype)initWithRows:(NSArray<CXSettingRowModel *> *)rows
                      header:(CXSettingHeaderFooterModel *)header
                      footer:(CXSettingHeaderFooterModel *)footer{
    if(self = [super init]){
        _rows = [rows copy];
        _header = header;
        _footer = footer;
    }
    
    return self;
}

- (void)calculate:(CGFloat)width{
    if(_header){
        [_header calculate:width];
    }
    
    if(_footer){
        [_footer calculate:width];
    }
}

@end
