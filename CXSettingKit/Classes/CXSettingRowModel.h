//
//  CXSettingRowModel.h
//  Pods
//
//  Created by wshaolin on 2019/3/29.
//

#import <CXUIKit/CXUIKit.h>

@interface CXSettingRowModel : CXActionToolBarItemNode

@property (nonatomic, assign) NSTextAlignment titleAlignment;
@property (nonatomic, assign) CGFloat height;
@property (nonatomic, copy) NSString *rowKey;
@property (nonatomic, assign, getter = isArrowHidden) BOOL arrowHidden;

@end

@interface CXSettingRightTextRowModel : CXSettingRowModel

@property (nonatomic, copy) NSString *rightText;
@property (nonatomic, strong) UIFont *rightTextFont;
@property (nonatomic, strong) UIColor *rightTextColor;

@end

@interface CXSettingRightImageRowModel : CXSettingRowModel

@property (nonatomic, strong) id rightImage; // UIImage or image URL.
@property (nonatomic, assign) CGSize rightImageSize;

@end

@class CXSettingRightSwitchRowModel;

typedef void(^CXSettingRightSwitchActionHandler)(CXSettingRightSwitchRowModel *switchRowModel,
                                                 BOOL isOn,
                                                 id context);

@interface CXSettingRightSwitchRowModel : CXSettingRowModel

@property (nonatomic, assign, getter = isOn) BOOL on;
@property (nonatomic, copy) CXSettingRightSwitchActionHandler switchActionHandler;

@end

@interface CXSettingRightBadgeRowModel : CXSettingRowModel

@property (nonatomic, copy) NSString *badgeValue;

@end
