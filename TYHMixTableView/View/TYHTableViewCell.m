//
//  TYHTableViewCell.m
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/15.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import "TYHTableViewCell.h"
#import "TYHCellItem.h"
#import "TYHCellArrowItem.h"
#import "TYHSubCellArrowItem.h"
#import "TYHSwitchItem.h"
#import "TYHSubSwitchItem.h"
#import "TYHCustomViewItem.h"
#import "TYHCenterLabelItem.h"
#import "TYHLabelItem.h"

@interface TYHTableViewCell()
@property (nonatomic, strong) UIImageView *arrowIV;
@property (nonatomic, strong) UISwitch *switchBtn;
@property (nonatomic, strong) UILabel *labelView;
@property (nonatomic, strong) UIView *divider;
@property (nonatomic, strong) NSTimer *switchBtnTimer;
@end

@implementation TYHTableViewCell

+ (instancetype)cellWithTableView:(UITableView *)tableView item:(TYHCellItem *)item {
    static NSString *identifier = @"BaseTableViewControllerCellIdentifier";
    
    TYHTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (![cell.item isKindOfClass:[item class]]) {
        if ([item isKindOfClass:[TYHSubSwitchItem class]] ||
            [item isKindOfClass:[TYHSubCellArrowItem class]]) {
            cell = [[TYHTableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        } else {
            cell = [[TYHTableViewCell alloc] initWithStyle:UITableViewCellStyleValue1 reuseIdentifier:identifier];
            [cell.detailTextLabel setAdjustsFontSizeToFitWidth:YES];
        }
    } else {
        for (UIView *subView in cell.contentView.subviews) {
            [subView removeFromSuperview];
        }
    }
    return cell;
}

#pragma mark - 初始化样式
- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {

        self.backgroundColor = TYHColorFromRGB(0xffffff);
        
        UIView *selectView = [[UIView alloc]init];
        selectView.backgroundColor = TYHColorFromRGB(0xe2e7ea);
        [self setSelectedBackgroundView:selectView];
        
        /*清空子视图的背景颜色*/
        self.textLabel.backgroundColor = [UIColor clearColor];
        self.detailTextLabel.backgroundColor = [UIColor clearColor];
        
        [self.textLabel setTextColor:self.textLabel.textColor];
        [self.textLabel setFont:[UIFont systemFontOfSize:17*kScaleNo6P]];

        [self.detailTextLabel setTextColor:TYHColor(130, 130, 130)];
        [self.detailTextLabel setFont:[UIFont systemFontOfSize:12.f*kScaleNo6P]];
        self.detailTextLabel.numberOfLines = 0;
        self.textLabel.numberOfLines = 0;
        
        self.textLabel.textColor = TYHColor(48, 48, 48);
        
        
        /*添加分割线*/
//        if (!IOS_7_0) {
            [self.contentView addSubview:self.divider];
//        }
    }
    return self;
}

- (void)layoutSubviews
{
    [super layoutSubviews];

    if (_divider) {
        CGFloat dividerX = 50;
        CGFloat dividerW = [UIScreen mainScreen].bounds.size.width - dividerX;
        CGFloat dividerH = 1;
        CGFloat dividerY = self.frame.size.height - dividerH;
        self.divider.frame = CGRectMake(dividerX, dividerY, dividerW, dividerH);
    }
    
    CGFloat titleWidth = [self.item.detailTitle sizeWithFont:[UIFont systemFontOfSize:12.f] maxSize:CGSizeMake((315.f/kScreenWidth)*kScreenWidth, self.height)].width;
    if ([self.item isKindOfClass:[TYHCenterLabelItem class]]) {
        self.labelView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
    } else if ([self.item isKindOfClass:[TYHCellArrowItem class]]) {
        CGFloat width = 0;
        if (IPHONE5) {
            width = 20;
        }
        if ([self.item.title isEqualToString:@"alert_type"]) {
            NSLog(@"124");
        }
        if (self.detailTextLabel.frame.size.width == 0) {
            self.labelView.frame = CGRectMake(kScreenWidth - titleWidth -30*kScaleNo6P, 0, titleWidth, self.frame.size.height);
            self.textLabel.width = self.labelView.left - 20.*kScaleNo6P;

        } else {
            self.labelView.frame = CGRectMake(self.detailTextLabel.right-160*kScaleNo6P + width, 0, 160 - width, self.frame.size.height);
            self.textLabel.width = self.labelView.left - 20.*kScaleNo6P;
        }
        self.textLabel.width = self.labelView.left - 20.*kScaleNo6P;
    }  else if ([self.item isKindOfClass:[TYHSubCellArrowItem class]]) {
        if (self.detailTextLabel.frame.size.width != 0 && self.labelView.frame.size.width != 0 && ![self.item.detailTitle isEqualToString:@""] && ![self.item.detailTitle isEqualToString:@""]) {
            self.labelView.frame = CGRectMake(kScreenWidth - titleWidth -30*kScaleNo6P, 0, titleWidth, self.frame.size.height);
            self.textLabel.width = self.labelView.left - 20.*kScaleNo6P;
            self.labelView.height = self.contentView.height;
            self.labelView.textAlignment = NSTextAlignmentRight;
        } else {
            self.labelView.right = self.contentView.width;
            self.labelView.height = self.contentView.height;
            self.labelView.textAlignment = NSTextAlignmentRight;
        }
    }
}

- (void)dealloc
{
    if (self.switchBtnTimer) {
        [self.switchBtnTimer invalidate];
        _switchBtnTimer = nil;
    }
    
    if (_item) {
        _item = nil;
    }
    
    if (_switchBtnTimer) {
        _switchBtnBlock = nil;
    }
    
    if (_switchBtnWithIdBlock) {
        _switchBtnWithIdBlock = nil;
    }
}

//设置分割线是否隐藏
- (void)setHiddenLastDivider:(BOOL)hiddenLastDivider
{
    if (_divider != nil) {
        self.divider.hidden = hiddenLastDivider;
    }
}

#pragma mark - 设置cell的宽度
- (void)setFrame:(CGRect)frame
{
    [super setFrame:frame];
}


#pragma mark - 设置cell数据
- (void)setItem:(TYHCellItem *)item
{
//    self.textLabel.font = [UIFont systemFontOfSize:15];
    _item = item;
    self.textLabel.text = item.title;
//    NSLog(@"字体大小：%ld",self.textLabel.font);
    if (_item.icon && ![_item.icon isEqualToString:@""]) {
        self.imageView.image = [UIImage imageNamed:_item.icon];
    }
    
    if ([_item isKindOfClass:[TYHCustomViewItem class]]) {
        self.accessoryView = self.item.customArrowView;
        [self.contentView addSubview:self.labelView];
        self.detailTextLabel.text = self.item.detailTitle;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else if ([_item isKindOfClass:[TYHCellArrowItem class]]) {
        self.accessoryView = self.arrowIV;
        [self.contentView addSubview:self.labelView];
        self.labelView.text = self.item.detailTitle;
    } else if ([_item isKindOfClass:[TYHSubCellArrowItem class]]) {
        self.accessoryView = self.arrowIV;
        self.detailTextLabel.text = self.item.detailTitle;
        [self.contentView addSubview:self.labelView];
        self.labelView.text = self.item.subTitle;
    } else if ([_item isKindOfClass:[TYHSwitchItem class]]) {
        self.accessoryView.hidden = NO;
        self.accessoryView = self.switchBtn;
        self.switchBtn.on = self.item.switchBtnValue;
        self.switchBtn.enabled = self.item.switchBtnEnble;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else if ([_item isKindOfClass:[TYHSubSwitchItem class]]) {
        self.accessoryView.hidden = NO;
        self.accessoryView = self.switchBtn;
        self.switchBtn.on = self.item.switchBtnValue;
        self.switchBtn.enabled = self.item.switchBtnEnble;
        self.detailTextLabel.text = self.item.detailTitle;
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else if ([_item isKindOfClass:[TYHLabelItem class]]) {
        if (self.item.subTitle) {
            self.labelView.text = self.item.subTitle;
            self.detailTextLabel.text = self.item.detailTitle;
        } else {
            self.labelView.text = self.item.detailTitle;
        }
        
        [self.labelView sizeToFit];
        self.accessoryView = self.labelView;
        
        self.selectionStyle = UITableViewCellSelectionStyleNone;
    } else if ([_item isKindOfClass:[TYHCenterLabelItem class]]) {
        TYHCenterLabelItem *tItem = (TYHCenterLabelItem *)_item;
        self.accessoryView = self.arrowIV;
        self.textLabel.text = nil;
        self.labelView.frame = CGRectMake(0, 0, self.frame.size.width, self.frame.size.height);
        if (tItem.titleColor != 0) {
            self.labelView.textColor = TYHColorFromRGB(tItem.titleColor);
        } else {
            self.labelView.textColor = self.textLabel.textColor;
        }
        if (tItem.backgroungColor != 0) {
            self.labelView.layer.borderWidth = 2;
            self.labelView.layer.borderColor = TYHColorFromRGB(tItem.backgroungColor).CGColor;
            self.labelView.textColor = TYHColorFromRGB(tItem.backgroungColor);
        }
        self.labelView.font = self.textLabel.font;
        self.labelView.textAlignment = NSTextAlignmentCenter;
        self.labelView.text = tItem.title;
        [self.contentView addSubview:self.labelView];
    } else {
        self.accessoryView = nil;
    }
}


- (UIImageView *)arrowIV {
    if (self.item.arrowIcon) {
        if (![self.item.arrowIcon isEqualToString:@""]) {
            UIImage *arrowImg = [UIImage imageNamed:self.item.arrowIcon];
            if (arrowImg) {
                _arrowIV = [[UIImageView alloc] initWithImage:arrowImg];
            } else {
                _arrowIV = nil;
            }
        } else {
            _arrowIV = nil;
        }
    } else {
        _arrowIV = nil;
        self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    return _arrowIV;
}

- (UISwitch *)switchBtn {
    if (_switchBtn == nil) {
        _switchBtn = [[UISwitch alloc] init];
        _switchBtn.left = 0;
        _switchBtn.top = 0;
        _switchBtn.onTintColor = TYHColorFromRGB(0x019d92);
        [_switchBtn addTarget:self action:@selector(switchBtnChange:) forControlEvents:UIControlEventTouchUpInside];
        if ([[UIDevice currentDevice].systemVersion doubleValue] >= 10.0) {
            [_switchBtn addTarget:self action:@selector(switchBtnChange2:) forControlEvents:UIControlEventValueChanged];
        }
    }
    return _switchBtn;
}

- (UILabel *)labelView
{
    if (_labelView == nil) {
        _labelView = [[UILabel alloc] init];
        _labelView.frame = CGRectMake([UIScreen mainScreen].bounds.size.width-200, 0, 200, self.frame.size.height);
        _labelView.backgroundColor = [UIColor clearColor];
        _labelView.textAlignment = NSTextAlignmentRight;
        _labelView.font = [UIFont systemFontOfSize:12];
        _labelView.textColor = TYHColor(130, 130, 130);
        _labelView.numberOfLines = 0;
    }
    return _labelView;
}

- (UIView *)divider
{
    if (_divider == nil) {
        _divider = [[UIView alloc] init];
        _divider.backgroundColor = TYHColorFromRGB(0xe5e5e5);
        _divider.alpha = 0.5;    //设置透明度
    }
    
    return _divider;
}

- (UIView *)customView {
    if (!_customView) {
        _customView = [[UIView alloc] init];
        _customView.backgroundColor = [UIColor whiteColor];
    }
    return _customView;
}

#pragma mark - Switch值更改处理方法
- (void)switchBtnChange:(UISwitch *)switchBtn
{
    [self.switchBtnTimer invalidate];
    if (self.switchBtnBlock) {
        self.switchBtnBlock();
    } else if (self.switchBtnWithIdBlock) {
        if ([switchBtn isKindOfClass:[NSTimer class]]) {
            self.switchBtnWithIdBlock((UISwitch *)((NSTimer *)switchBtn).userInfo);
        } else {
            self.switchBtnWithIdBlock(switchBtn);
        }
    }
}

- (void)switchBtnChange2:(UISwitch *)switchBtn
{
    [self.switchBtnTimer invalidate];
    self.switchBtnTimer = [NSTimer scheduledTimerWithTimeInterval:0.25f target:self selector:@selector(switchBtnChange:) userInfo:switchBtn repeats:NO];
}

@end
