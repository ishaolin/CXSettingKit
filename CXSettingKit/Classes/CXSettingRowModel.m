//
//  CXSettingRowModel.m
//  Pods
//
//  Created by wshaolin on 2019/3/29.
//

#import "CXSettingRowModel.h"

@implementation CXSettingRowModel

- (instancetype)initWithTitle:(NSString *)title actionHandler:(CXActionToolBarItemActionHandler)actionHandler{
    if(self = [super initWithTitle:title actionHandler:actionHandler]){
        self.height = 50.0;
        self.arrowHidden = NO;
        self.titleAlignment = NSTextAlignmentLeft;
    }
    
    return self;
}

@end

@implementation CXSettingRightTextRowModel

@end

@implementation CXSettingRightImageRowModel

@end

@implementation CXSettingRightSwitchRowModel

@end

@implementation CXSettingRightBadgeRowModel

@end
