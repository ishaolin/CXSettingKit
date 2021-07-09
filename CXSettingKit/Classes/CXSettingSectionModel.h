//
//  CXSettingSectionModel.h
//  Pods
//
//  Created by wshaolin on 2019/3/29.
//

#import "CXSettingRowModel.h"

@interface CXSettingHeaderFooterModel : NSObject

@property (nonatomic, copy, readonly) NSString *text;
@property (nonatomic, assign, readonly) CGFloat height; // header or footer view height
@property (nonatomic, assign, readonly) CGRect frame; // text label frame
@property (nonatomic, strong) UIFont *font;
@property (nonatomic, strong) UIColor *textColor;

- (instancetype)initWithHeight:(CGFloat)height;
- (instancetype)initWithText:(NSString *)text;
- (instancetype)initWithText:(NSString *)text edgeInsets:(UIEdgeInsets)insets;

@end


@interface CXSettingSectionModel : NSObject

@property (nonatomic, strong, readonly) NSArray<CXSettingRowModel *> *rows;
@property (nonatomic, strong, readonly) CXSettingHeaderFooterModel *header;
@property (nonatomic, strong, readonly) CXSettingHeaderFooterModel *footer;

- (instancetype)initWithRows:(NSArray<CXSettingRowModel *> *)rows;
- (instancetype)initWithRows:(NSArray<CXSettingRowModel *> *)rows
                      header:(CXSettingHeaderFooterModel *)header
                      footer:(CXSettingHeaderFooterModel *)footer;

@end
