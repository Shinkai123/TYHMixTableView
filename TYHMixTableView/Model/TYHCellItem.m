//
//  TYHCellItem.m
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/15.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import "TYHCellItem.h"

@implementation TYHCellItem

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title
{
    if (self = [super init]) {
        self.icon = icon;
        self.title = title;
        self.switchBtnEnble = YES;
    }
    return self;
}

@end
