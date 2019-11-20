//
//  TYHCustomViewItem.m
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/15.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import "TYHCustomViewItem.h"

@implementation TYHCustomViewItem

- (instancetype)initWithIcon:(NSString *)icon title:(NSString *)title destClass:(Class)destVc
{
    if (self = [super initWithIcon:icon title:title]) {
        self.destVC = destVc;
    }
    return self;
}


@end
