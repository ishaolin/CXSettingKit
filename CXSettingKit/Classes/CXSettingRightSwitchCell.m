//
//  CXSettingRightSwitchCell.m
//  Pods
//
//  Created by wshaolin on 2019/4/1.
//

#import "CXSettingRightSwitchCell.h"

@implementation CXSettingRightSwitchCell

+ (instancetype)cellWithTableView:(UITableView *)tableView{
    static NSString *reuseIdentifier = @"CXSettingRightSwitchCell";
    return [self cellWithTableView:tableView reuseIdentifier:reuseIdentifier];
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
        _switchView = [[UISwitch alloc] init];
        [_switchView addTarget:self action:@selector(handleActionForSwitchView:) forControlEvents:UIControlEventValueChanged];
        [self.contentView addSubview:_switchView];
    }
    
    return self;
}

- (void)displayRowModel:(CXSettingRowModel *)rowModel{
    [super displayRowModel:rowModel];
    
    CXSettingRightSwitchRowModel *switchModel = (CXSettingRightSwitchRowModel *)rowModel;
    [_switchView setOn:switchModel.isOn animated:NO];
}

- (void)handleActionForSwitchView:(UISwitch *)switchView{
    BOOL on = switchView.isOn;
    CXSettingRightSwitchRowModel *switchModel = (CXSettingRightSwitchRowModel *)self.rowModel;
    if(switchModel.confirmBlock){
        UIViewController *viewController = [self cx_viewController];
        switchModel.confirmBlock(switchModel, on, viewController, ^(BOOL confirmed) {
            if(confirmed){
                switchModel.on = on;
                [switchModel invokeActionForContext:viewController];
            }else{
                [_switchView setOn:!on animated:NO];
            }
        });
    }else{
        switchModel.on = on;
        [switchModel invokeActionForContext:[self cx_viewController]];
    }
}

- (void)layoutSubviews{
    [super layoutSubviews];
    
    CGFloat switchView_W = CGRectGetWidth(_switchView.bounds);
    CGFloat switchView_H = CGRectGetHeight(_switchView.bounds);
    CGFloat switchView_X = CGRectGetMinX(self.arrowView.frame) - switchView_W;
    CGFloat switchView_Y = (CGRectGetHeight(self.bounds) - switchView_H) * 0.5;
    _switchView.frame = (CGRect){switchView_X, switchView_Y, switchView_W, switchView_H};
}

@end
