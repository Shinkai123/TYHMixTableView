//
//  TYHCellItem.h
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/15.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

//NS_ASSUME_NONNULL_BEGIN

@interface TYHCellItem : NSObject

@property (nonatomic,assign) NSInteger tag;
//图标
@property (nonatomic, copy) NSString *_Nullable icon;
//标题
@property (nonatomic, copy) NSString *_Nullable title;
//右边标题
@property (nonatomic, copy) NSString *_Nullable subTitle;
//标题说明
@property (nonatomic, copy) NSString *_Nullable detailTitle;
//右边图标
@property (nonatomic, copy) NSString *_Nullable arrowIcon;
//定义block保存将来要执行的代码
@property (nonatomic, copy) void (^ _Nullable switchBtnBlock)(void);
@property (nonatomic,assign) BOOL switchBtnValue;
@property (nonatomic,assign) BOOL switchBtnEnble;   //使能
@property (nonatomic,strong) UIView * _Nullable customArrowView;

//@property (nonatomic,assign) NSInteger cusstomArrowView; //需要传递标识

@property (nonatomic,strong) NSMutableDictionary * _Nullable dataDic;     //需要传递的数据
@property (nonatomic,strong) id _Nullable dataObject;    //需要传递的数据
@property (nonatomic,assign) char * _Nullable pData;    //需要传递的数据（指针,如有申请内存请自主释放）
@property (nonatomic,assign) NSInteger flag; //需要传递标识

- (instancetype _Nonnull )initWithIcon:(NSString *_Nullable)icon title:(NSString *_Nullable)title;

@end

//NS_ASSUME_NONNULL_END
