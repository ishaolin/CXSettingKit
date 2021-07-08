//
//  CXSettingSectionModel.m
//  Pods
//
//  Created by wshaolin on 2019/3/29.
//

#import "CXSettingSectionModel.h"

@implementation CXSettingSectionModel

- (instancetype)initWithRows:(NSArray<CXSettingRowModel *> *)rows
                footerHeight:(CGFloat)footerHeight
               footerContent:(NSString *)footerContent{
    if(self = [super init]){
        _rows = rows;
        _footerHeight = footerHeight;
        _footerContent = footerContent;
    }
    
    return self;
}

@end
