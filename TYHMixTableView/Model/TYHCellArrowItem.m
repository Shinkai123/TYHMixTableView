//
//  TYHCellArrowItem.m
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/15.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import "TYHCellArrowItem.h"

@implementation TYHCellArrowItem

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class __nullable)destVc
{
    if (self = [super initWithIcon:icon title:title]) {
        self.destVC = destVc;
    }
    return self;
}

@end
