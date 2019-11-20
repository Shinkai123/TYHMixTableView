//
//  TYHBaseTableViewController.m
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/15.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import "TYHBaseTableViewController.h"
#import "TYHBaseViewController.h"


@interface TYHBaseTableViewController ()

@end

@implementation TYHBaseTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if (@available(iOS 11.0, *)) {
        self.tableView.estimatedRowHeight = 0;
        self.tableView.estimatedSectionHeaderHeight = 0;
        self.tableView.estimatedSectionFooterHeight = 0;
    }
}

- (NSMutableArray *)setupDates {
    self.datas = [NSMutableArray array];
    return self.datas;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    TYHCellItemGroup *group = [self.datas objectAtIndex:section];
    return group.items.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TYHCellItemGroup *group = [self.datas objectAtIndex:indexPath.section];
    TYHCellItem *item = [group.items objectAtIndex:indexPath.row];
    
    TYHTableViewCell *cell = [TYHTableViewCell cellWithTableView:tableView item:item];
    
    cell.switchBtnBlock = item.switchBtnBlock;
    cell.item = item;
    cell.tag = item.tag;
    
    if (indexPath.row == group.items.count - 1) {
        cell.hiddenLastDivider = NO;
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];//取消选择效果
    
    if (indexPath.section < self.datas.count) {
        TYHCellItemGroup *group = self.datas[indexPath.section];
        if (indexPath.row < group.items.count) {
            TYHCellItem *item = group.items[indexPath.row];
            if ([item isKindOfClass:[TYHCellArrowItem class]] ||
                [item isKindOfClass:[TYHSubCellArrowItem class]]) {
                TYHCellArrowItem *arrowItem = (TYHCellArrowItem *)item;
                if (arrowItem.destVC) {
                    TYHBaseViewController *vc = [[arrowItem.destVC alloc] init];
                    vc.title = arrowItem.title;
                    if (item.dataDic) {
                        vc.dataDic = item.dataDic;
                    } else if (self.dataDic && [vc respondsToSelector:@selector(dataDic)]) {
                        vc.dataDic = self.dataDic;
                    }
                    if (item.dataObject && [vc respondsToSelector:@selector(dataObject)]) {
                        vc.dataObject = item.dataObject;
                    }
                    if (item.pData && [vc respondsToSelector:@selector(pData)]) {
                        vc.pData = item.pData;
                    }
                    if (item.flag && [vc respondsToSelector:@selector(flag)]) {
                        vc.flag = item.flag;
                    }
                    [self.navigationController pushViewController:vc animated:YES];
                }
                
            }
        } else {
            NSLog(@"%s:%s-->Row Error(%ld-%lu)", __FILE__, __FUNCTION__, (long)indexPath.row, (unsigned long)group.items.count);
        }
    } else {
        NSLog(@"%s:%s-->Section Error(%ld-%lu)", __FILE__, __FUNCTION__, (long)indexPath.section, (unsigned long)self.datas.count);
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 54.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return self.isShortHeightForHeader?20.0f:40.0f;
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == self.datas.count - 1) {
        return 20;
    }
    return 0.1f;
}

#pragma mark - 设置CELL组的标题
//设置组头部标题
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section;
{
    TYHCellItemGroup *group = self.datas[section];
    return group.headerTitle;
}

//设置组底部标题
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section
{
    TYHCellItemGroup *group = self.datas[section];
    return group.footerTitle;
}


@end
