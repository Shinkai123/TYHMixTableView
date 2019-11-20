//
//  TYHCellArrowItem.h
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/15.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import "TYHCellItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface TYHCellArrowItem : TYHCellItem

//指向的下一个视图控制器类
@property (nonatomic,assign) Class destVC;

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class __nullable)destVc;

@end

NS_ASSUME_NONNULL_END
