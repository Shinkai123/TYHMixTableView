//
//  TYHCustomViewItem.h
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/15.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import "TYHCellItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface TYHCustomViewItem : TYHCellItem

@property (nonatomic,assign) Class destVC;

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class)destVc;

@end

NS_ASSUME_NONNULL_END
