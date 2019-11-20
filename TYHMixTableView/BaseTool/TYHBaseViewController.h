//
//  TYHBaseViewController.h
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/15.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface TYHBaseViewController : UIViewController

@property (nonatomic,strong) NSMutableDictionary  * _Nullable dataDic;     //需要传递的数据

@property (nonatomic) id _Nullable dataObject;    //需要传递的数据
@property (nonatomic,assign) char * _Nullable pData;    //需要传递的数据（指针）
@property (nonatomic,assign) NSInteger flag; //需要传递标识

@end

NS_ASSUME_NONNULL_END
