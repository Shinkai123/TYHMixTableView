//
//  TYHBaseTableView.h
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/20.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol TYHBaseTableViewDelegate <NSObject>

@optional
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView;
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath;
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section;
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section;
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath;
@end

@interface TYHBaseTableView : UITableView

@property (nonatomic,strong) NSMutableArray * _Nullable datas;      //TableView数据源

- (instancetype)initWithFrame:(CGRect)frame weakViewCtl:(UIViewController *)viewCtl;


@end

NS_ASSUME_NONNULL_END
