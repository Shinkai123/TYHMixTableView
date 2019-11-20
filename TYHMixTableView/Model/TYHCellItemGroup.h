//
//  TYHCellItemGroup.h
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/15.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYHCellItemGroup : NSObject

@property (nonatomic, assign) NSInteger tag;

//头部标题
@property (nonatomic, copy) NSString *headerTitle;
//底部标题
@property (nonatomic, copy) NSString *footerTitle;
//当前分组中的Cell数组（保存的是SettingItem模型）
@property (nonatomic,strong) NSArray *items;

@end

NS_ASSUME_NONNULL_END
