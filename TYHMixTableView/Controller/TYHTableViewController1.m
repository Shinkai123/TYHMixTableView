//
//  TYHTableViewController1.m
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/20.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import "TYHTableViewController1.h"
#import "TYHNextPageViewController.h"
#import "TYHNextPageTableViewController.h"


@interface TYHTableViewController1 ()

@end

@implementation TYHTableViewController1

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.title = @"多样式tableView";
    [self setupDate];
}

- (NSArray *) setupDate {
    TYHCellItem *item10 = [[TYHCellArrowItem alloc] initWithIcon:@"" title:@"我是Item10" destClass:[TYHNextPageTableViewController class]];
    item10.detailTitle = @"我在第二区第一行";
    item10.subTitle = @"哈喽";
    TYHCellItem *item11 = [[TYHCellArrowItem alloc] initWithIcon:@"user_icon" title:@"我是Item10" destClass:nil];
    item11.arrowIcon = @"";
    item11.subTitle = @"哈喽";
    item11.detailTitle = @"我在第二区第一行";
    TYHCellItemGroup *group1 = [[TYHCellItemGroup alloc] init];
    group1.items = @[item10, item11];
    group1.headerTitle = @"第一区";
    self.datas = [NSMutableArray array];
     [self.datas addObject:group1];
    
    TYHCellItem *item20 = [[TYHSubCellArrowItem alloc] initWithIcon:@"" title:@"我是Item20" destClass:[TYHNextPageViewController class]];
    item20.detailTitle = @"我在第二区第一行";
    item20.subTitle = @"哈喽";
    TYHCellItem *item21 = [[TYHSubCellArrowItem alloc] initWithIcon:@"user_icon" title:@"我是item21" destClass:nil];
    item21.arrowIcon = @"";
    item21.detailTitle = @"我在第二区第二行";
    item21.subTitle = @"哈喽";
    TYHCellItemGroup *group2 = [[TYHCellItemGroup alloc] init];
    group2.items = @[item20, item21];
    group2.headerTitle = @"第二区";
    [self.datas addObject:group2];
    
    TYHCellItem *item30 = [[TYHSwitchItem alloc] initWithIcon:@"" title:@"我是item30"];
    item30.detailTitle = @"我在第三区第一行";
    item30.switchBtnBlock = ^{
        [self showAlertView:@"我出来了" message:@"哈喽" firstBtnName:@"好的" handler:^(UIAlertAction * _Nullable action) {
        } secondBtnName:nil handler:nil];
    };
    TYHCellItem *item31 = [[TYHSubSwitchItem alloc] initWithIcon:@"user_icon" title:@"我是item31"];
    item31.detailTitle = @"我在第三区第二行";
    item31.switchBtnBlock = ^{
        [self showAlertView:@"我出来了" message:@"哈喽" firstBtnName:@"好的" handler:^(UIAlertAction * _Nullable action) {
        } secondBtnName:nil handler:nil];
    };
    TYHCellItemGroup *group3 = [[TYHCellItemGroup alloc] init];
    group3.items = @[item30, item31];
    group3.headerTitle = @"第三区";
    [self.datas addObject:group3];
    
    TYHCellItem *item40 = [[TYHCustomViewItem alloc] initWithIcon:@"" title:@"我是item40"];
    item40.detailTitle = @"我是第四区第一行";
    UIImageView *imageV = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"user_icon"]];
    item40.customArrowView = imageV;
    TYHCellItemGroup *group4 = [[TYHCellItemGroup alloc] init];
    group4.items = @[item40];
    group4.headerTitle = @"第四区";
    [self.datas addObject:group4];
    
    TYHCenterLabelItem *item50 = [[TYHCenterLabelItem alloc] initWithIcon:@"" title:@"我是item50" destClass:nil];
    item50.arrowIcon = @"";
    item50.titleColor = 0xf02359;
    TYHCellItemGroup *group5 = [[TYHCellItemGroup alloc] init];
    group5.items = @[item50];
    [self.datas addObject:group5];
    return self.datas;
}

- (void)showAlertView:(NSString *_Nullable)title message:(NSString *_Nullable)msg firstBtnName:(NSString *_Nonnull)firstBtnName handler:(void (^ __nullable)(UIAlertAction * _Nullable action))firstHandler secondBtnName:(NSString *_Nullable)secondBtnName handler:(void (^ __nullable)(UIAlertAction * _Nullable action))secondHandler {
    dispatch_async(dispatch_get_main_queue(), ^{
        if (firstBtnName || secondBtnName) {
            UIAlertController *alertController = [UIAlertController alertControllerWithTitle:title message:msg preferredStyle:UIAlertControllerStyleAlert];
            
            if (firstBtnName) {
                UIAlertAction *firstBtnAction = [UIAlertAction actionWithTitle:firstBtnName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    if (firstHandler) {
                        firstHandler(action);
                    }
                    [alertController dismissViewControllerAnimated:YES completion:nil];
                }];
                [alertController addAction:firstBtnAction];
            }
            
            if (secondBtnName) {
                UIAlertAction *secondBtnAction = [UIAlertAction actionWithTitle:secondBtnName style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    if (secondHandler) {
                        secondHandler(action);
                    }
                    [alertController dismissViewControllerAnimated:YES completion:nil];
                }];
                [alertController addAction:secondBtnAction];
            }
            
            [self presentViewController:alertController animated:YES completion:nil];
        }
    });
}

#pragma mark - Table view data source


@end
