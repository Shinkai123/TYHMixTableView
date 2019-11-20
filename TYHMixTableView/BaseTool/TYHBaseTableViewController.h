//
//  TYHBaseTableViewController.h
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/15.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

#import "TYHTableViewCell.h"
#import "TYHCellItemGroup.h"
#import "TYHCellItem.h"
#import "TYHBaseViewController.h"
#import "TYHCellArrowItem.h"
#import "TYHSubCellArrowItem.h"
#import "TYHSwitchItem.h"
#import "TYHSubSwitchItem.h"
#import "TYHCustomViewItem.h"
#import "TYHCenterLabelItem.h"

NS_ASSUME_NONNULL_BEGIN

@interface TYHBaseTableViewController : UITableViewController

@property (nonatomic,strong) NSMutableArray * _Nullable datas;      //TableView数据源

@property (nonatomic,strong) NSMutableDictionary * _Nullable dataDic;     //需要传递的数据

@property (nonatomic) id _Nullable dataObject;    //需要传递的数据

@property (nonatomic,assign) char * _Nullable pData;    //需要传递的数据（指针）

@property (nonatomic,assign) NSInteger flag; //需要传递标识

@property (nonatomic,assign) BOOL isShortHeightForHeader;           //是否显示头视图高度显示显示20高度，否则为40，默认NO

@end

NS_ASSUME_NONNULL_END
