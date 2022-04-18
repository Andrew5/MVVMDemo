//
//  CustomTableViewCell.m
//  testSingature
//
//  Created by jabraknight on 2022/4/18.
//  Copyright © 2022 zk. All rights reserved.
//

#import "CustomTableViewCell.h"
#import "Masonry.h"

@interface CustomTableViewCell()

@property(nonatomic,  strong) UILabel *titleLabel;
@property(nonatomic,  strong) UILabel *titleSubdetailLabel;
@property (nonatomic, strong) UILabel *line;

@end

@implementation CustomTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        [self createUI];
    }
    return self;
}

- (void)createUI {
    
    [self.contentView addSubview:self.titleLabel];
    [self.contentView addSubview:self.titleSubdetailLabel];
    [self.contentView addSubview:self.line];

    [self makeConstraints];
}

- (void)setTitlestr:(NSString *)titlestr{
    self.titleLabel.text = titlestr;
}

- (void)setTitlestrstr:(NSString *)titlestrstr{
    self.titleSubdetailLabel.text = titlestrstr;
    if (titlestrstr.length <= 0){
        [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
        }];
    }
}

- (void)makeConstraints {
    [self.titleLabel setContentCompressionResistancePriority:UILayoutPriorityRequired forAxis:UILayoutConstraintAxisHorizontal];
    // mas_makeConstraints 只负责新增约束 Autolayout不能同时存在两条针对于同一对象的约束 否则会报错
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(20);
        make.left.mas_equalTo(15);
        make.height.mas_lessThanOrEqualTo(@13);
        make.width.mas_lessThanOrEqualTo(@50);
    }];
    
    [self.titleSubdetailLabel setContentCompressionResistancePriority:UILayoutPriorityDefaultLow forAxis:UILayoutConstraintAxisHorizontal];
    [self.titleSubdetailLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.equalTo(self.titleLabel.mas_top);
        make.left.equalTo(self.titleLabel.mas_right).offset(30).priority(1000);
        make.right.equalTo(self.contentView.mas_right).offset(-15).priority(250);
        make.height.mas_greaterThanOrEqualTo(@13).priority(250);
        make.bottom.equalTo(self.contentView.mas_bottom).offset(-20);
    }];
    
    [self.line mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.mas_offset(15);
        make.right.mas_offset(-15);
        make.height.mas_offset(1);
        make.bottom.equalTo(self.contentView.mas_bottom);
    }];
    
}

#pragma mark - Lazy

- (UILabel *)titleLabel {
    if (!_titleLabel) {
        _titleLabel = UILabel.alloc.init;
        _titleLabel.font = [UIFont systemFontOfSize:14];
        _titleLabel.numberOfLines = 1;
    }
    return _titleLabel;
}

- (UILabel *)titleSubdetailLabel {
    if (!_titleSubdetailLabel) {
        _titleSubdetailLabel = UILabel.alloc.init;
        _titleSubdetailLabel.numberOfLines = 0;
        _titleSubdetailLabel.font = [UIFont systemFontOfSize:14];
    }
    return _titleSubdetailLabel;
}

- (UIView *)line {
    if (!_line) {
        _line = UILabel.alloc.init;
        _line.backgroundColor = UIColor.lightGrayColor;
    }
    return _line;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
