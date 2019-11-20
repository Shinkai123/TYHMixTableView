//
//  NSString+TYHCategory.h
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/19.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface NSString (TYHCategory)

/*返回字符串所占用的尺寸*/
- (CGSize)sizeWithFont:(UIFont *)font maxSize:(CGSize)maxSize;

@end

NS_ASSUME_NONNULL_END
