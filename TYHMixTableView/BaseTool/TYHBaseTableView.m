//
//  TYHBaseTableView.m
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/20.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import "TYHBaseTableView.h"
#import "TYHBaseViewController.h"
#import "TYHTableViewCell.h"
#import "TYHCellItemGroup.h"
#import "TYHCellItem.h"
#import "TYHBaseViewController.h"
#import "TYHCellArrowItem.h"
#import "TYHSubCellArrowItem.h"
#import "TYHTableViewCell.h"
#import "TYHCenterLabelItem.h"

@interface TYHBaseTableView () <UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,weak) UIViewController *viewCtrl;
@property (nonatomic,weak) id<TYHBaseTableViewDelegate> delegate2;
@property (nonatomic,assign) CGFloat heightOfRow;

@end

@implementation TYHBaseTableView

- (instancetype)initWithFrame:(CGRect)frame weakViewCtl:(UIViewController *)viewCtl
{
    self = [super initWithFrame:frame style:UITableViewStyleGrouped];
    if (self) {
        self.viewCtrl = viewCtl;
        self.delegate2 = (id)viewCtl;
        self.dataSource = self;
        self.delegate = self;
        self.heightOfRow = 54.f*kScaleNo6P;
        if (@available(iOS 11.0, *)) {
            self.estimatedRowHeight = 0;
            self.estimatedSectionHeaderHeight = 0;
            self.estimatedSectionFooterHeight = 0;
        }
    }
    
    return self;
}

- (void)dealloc
{
    [self.datas removeAllObjects];
    self.datas = nil;
}

#pragma mark - UITableViewDataSource

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    if (_delegate2 && [self.delegate2 respondsToSelector:@selector(numberOfSectionsInTableView:)]) {
        return [self.delegate2 numberOfSectionsInTableView:tableView];
    }
    
    return self.datas.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    if (_delegate2 && [self.delegate2 respondsToSelector:@selector(tableView:numberOfRowsInSection:)]) {
        return [self.delegate2 tableView:tableView numberOfRowsInSection:section];
    }
        
    TYHCellItemGroup *g = self.datas[section];
    return g.items.count;
}

- (void)setHeightOfRowValue:(TYHCellItemGroup *)group item:(TYHCellItem *)item {
    CGFloat titleHeight = [item.title sizeWithFont:[UIFont systemFontOfSize:17*kScaleNo6P] maxSize:CGSizeMake(250.f*kScaleNo6P, 100)].height;
    CGFloat detailTitleHeight = 0;
    if (item.detailTitle && item.detailTitle.length>0) {
        detailTitleHeight = [item.detailTitle sizeWithFont:[UIFont systemFontOfSize:12*kScaleNo6P] maxSize:CGSizeMake((233.f/kScreenWidth)*kScreenWidth, 100)].height;
    }
    if (titleHeight+detailTitleHeight+10 > 54.0f*kScaleNo6P) {
        self.heightOfRow = titleHeight+detailTitleHeight+10;
    }else {
        self.heightOfRow = 54.0f*kScaleNo6P;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    if (_delegate2 && [self.delegate2 respondsToSelector:@selector(tableView:cellForRowAtIndexPath:)]) {
        return [self.delegate2 tableView:tableView cellForRowAtIndexPath:indexPath];
    } else {
        TYHCellItemGroup *group = self.datas[indexPath.section];
        TYHCellItem *item = group.items[indexPath.row];
        
        TYHTableViewCell *cell = [TYHTableViewCell cellWithTableView:tableView item:item];
        cell.switchBtnBlock = item.switchBtnBlock;
        cell.item = item;
        cell.tag = item.tag;
        if (indexPath.row == (group.items.count-1)) {
            cell.hiddenLastDivider = NO;
        }
        
        [self setHeightOfRowValue:group item:item];
        
        UIImageView *lineImgView = [[UIImageView alloc] init];
       
        lineImgView.frame = CGRectMake(20, self.heightOfRow-1, kScreenWidth-20, 1);
        if (indexPath.row == [tableView numberOfRowsInSection:indexPath.section]-1) {
            lineImgView.frame = CGRectMake(0, self.heightOfRow-1, kScreenWidth, 1);
        }
        lineImgView.backgroundColor = TYHColorFromRGB(0xe5e5e5);
        [cell.contentView addSubview:lineImgView];
        
        if (indexPath.row == 0) {
            UIImageView *topLineImgView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, kScreenWidth, 0.5)];
            topLineImgView.backgroundColor = TYHColorFromRGB(0xe5e5e5);
            [cell.contentView addSubview:topLineImgView];
        }
        
        return cell;
    }
}

#pragma mark - UITableViewDelegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self deselectRowAtIndexPath:indexPath animated:YES];   //立即取消选中
    
    TYHCellItemGroup *group = self.datas[indexPath.section];
    TYHCellItem *item = group.items[indexPath.row];
    
    if ([item isKindOfClass:[TYHCellArrowItem class]] || [item isKindOfClass:[TYHSubCellArrowItem class]]) {
        TYHCellArrowItem *arrowItem = (TYHCellArrowItem *)item;
        if (arrowItem.destVC) {
            TYHBaseViewController *vc = [[arrowItem.destVC alloc] init];
            vc.title = arrowItem.title;
            if (item.dataDic) {
                vc.dataDic = item.dataDic;
            }
            
            [self.viewCtrl.navigationController pushViewController:vc animated:YES];
        }
    } else if ([item isKindOfClass:[TYHCenterLabelItem class]]) {
        TYHCenterLabelItem *arrowItem = (TYHCenterLabelItem *)item;
        if (arrowItem.destVC) {
            TYHBaseViewController *vc = [[arrowItem.destVC alloc] init];
            vc.title = arrowItem.title;
            if (item.dataDic) {
                vc.dataDic = item.dataDic;
            }
            
            [self.viewCtrl.navigationController pushViewController:vc animated:YES];
        }
    }
    
    if (_delegate2 && [self.delegate2 respondsToSelector:@selector(tableView:didSelectRowAtIndexPath:)]) {
        [self.delegate2 tableView:tableView didSelectRowAtIndexPath:indexPath];
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (_delegate2 && [self.delegate2 respondsToSelector:@selector(tableView:heightForRowAtIndexPath:)]) {
        return [self.delegate2 tableView:tableView heightForRowAtIndexPath:indexPath];
    } else {
        TYHCellItemGroup *group = self.datas[indexPath.section];
        TYHCellItem *item = group.items[indexPath.row];
        [self setHeightOfRowValue:group item:item];
        return self.heightOfRow;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    if (_delegate2 && [self.delegate2 respondsToSelector:@selector(tableView:heightForHeaderInSection:)]) {
        return [self.delegate2 tableView:tableView heightForHeaderInSection:section];
    } else {
        return 40.0f;
    }
}

- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section
{
    if (section == self.datas.count - 1) {
        if (_delegate2 && [self.delegate2 respondsToSelector:@selector(tableView:heightForFooterInSection:)]) {
            return [self.delegate2 tableView:tableView heightForFooterInSection:section];
        } else {
            return 20.0f;
        }
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
