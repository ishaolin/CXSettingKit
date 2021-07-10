//
//  CXSettingHeaderFooterView.m
//  CXSettingKit
//
//  Created by wshaolin on 2021/7/9.
//

#import "CXSettingHeaderFooterView.h"
#import "CXSettingSectionModel.h"

@interface CXSettingHeaderFooterView () {
    
}

@end

@implementation CXSettingHeaderFooterView

+ (instancetype)viewWithTableView:(UITableView *)tableView dataModel:(CXSettingHeaderFooterModel *)dataModel{
    if(!dataModel || CXStringIsEmpty(dataModel.text)){
        return nil;
    }
    
    CXSettingHeaderFooterView *view = [CXSettingHeaderFooterView viewWithTableView:tableView];
    view.dataModel = dataModel;
    return view;
}

+ (instancetype)viewWithTableView:(UITableView *)tableView{
    static NSString *reuseIdentifier = @"CXSettingHeaderFooterView";
    return [self viewWithTableView:tableView reuseIdentifier:reuseIdentifier];
}

+ (instancetype)viewWithTableView:(UITableView *)tableView reuseIdentifier:(NSString *)reuseIdentifier{
    CXSettingHeaderFooterView *view = [tableView dequeueReusableHeaderFooterViewWithIdentifier:reuseIdentifier];
    if(!view){
        view = [[self alloc] initWithReuseIdentifier:reuseIdentifier];
    }
    
    return view;
}

- (instancetype)initWithReuseIdentifier:(NSString *)reuseIdentifier{
    if(self = [super initWithReuseIdentifier:reuseIdentifier]){
        _contentLabel = [[UILabel alloc] init];
        _contentLabel.textAlignment = NSTextAlignmentLeft;
        
        [self.contentView addSubview:_contentLabel];
    }
    
    return self;
}

- (void)setDataModel:(CXSettingHeaderFooterModel *)dataModel{
    if(_dataModel == dataModel){
        return;
    }
    
    _dataModel = dataModel;
    _contentLabel.text = _dataModel.text;
    _contentLabel.font = _dataModel.font;
    _contentLabel.textColor = _dataModel.textColor;
    _contentLabel.frame = _dataModel.frame;
}

@end
