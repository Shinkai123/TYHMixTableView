//
//  TYHTableViewCell.h
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/15.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import <UIKit/UIKit.h>
@class TYHCellItem;

NS_ASSUME_NONNULL_BEGIN

@interface TYHTableViewCell : UITableViewCell

@property (nonatomic,strong) TYHCellItem *item;
@property (nonatomic,assign) BOOL hiddenLastDivider;
@property (nonatomic,copy) void(^switchBtnBlock)(void);
@property (nonatomic,copy) void(^switchBtnWithIdBlock)(UISwitch *switchBtn);
@property (nonatomic,strong) UIView *customView;

+ (instancetype)cellWithTableView:(UITableView *)tableView item:(TYHCellItem *)item;

- (void)setHeightOfRowValue:(TYHCellItem *)item;

@end

NS_ASSUME_NONNULL_END
