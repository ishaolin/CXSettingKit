//
//  CXSettingSectionModel.h
//  Pods
//
//  Created by wshaolin on 2019/3/29.
//

#import "CXSettingRowModel.h"

@interface CXSettingSectionModel : NSObject

- (instancetype)initWithRows:(NSArray<CXSettingRowModel *> *)rows
                footerHeight:(CGFloat)footerHeight
               footerContent:(NSString *)footerContent;

@property (nonatomic, strong, readonly) NSArray<CXSettingRowModel *> *rows;
@property (nonatomic, assign, readonly) CGFloat footerHeight;
@property (nonatomic, copy, readonly) NSString *footerContent;

@end
