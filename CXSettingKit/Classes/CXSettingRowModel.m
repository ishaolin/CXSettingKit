//
//  CXSettingRowModel.m
//  Pods
//
//  Created by wshaolin on 2019/3/29.
//

#import "CXSettingRowModel.h"

@implementation CXSettingRowModel

- (void)config{
    [super config];
    
    self.height = 50.0;
    self.arrowHidden = NO;
    self.titleAlignment = NSTextAlignmentLeft;
}

@end

@implementation CXSettingRightTextRowModel

@end

@implementation CXSettingRightImageRowModel

@end

@implementation CXSettingRightSwitchRowModel

- (void)config{
    [super config];
    
    self.arrowHidden = YES;
    self.enabled = NO;
}

@end

@implementation CXSettingRightBadgeRowModel

@end
