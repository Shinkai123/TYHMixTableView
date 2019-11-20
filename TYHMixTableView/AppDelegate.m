//
//  AppDelegate.m
//  TYHMixTableView
//
//  Created by YaoHua Tan on 2019/11/15.
//  Copyright © 2019 YaoHua Tan. All rights reserved.
//

#import "AppDelegate.h"
#import "ViewController.h"
#import "TYHTableViewController1.h"

CGFloat kScale = 1.0f;      ///适配比例
CGFloat kScaleNo6P = 1.0f;  //适配比例（6以上分辨率不缩放）
CGFloat kScaleIsPadNoScale = 1.0f;  //iPad上显示比例为1.0，iPhone为kScaleNo6P

@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    if (IS_IPHONE && IPHONE6plus) {
        kScale *= kScale6To6P;
        kScaleIsPadNoScale = kScaleNo6P;
    } else if (IS_IPHONE && IPHONE5) {
        kScale *= kScale6To5;
        kScaleNo6P *= kScale6To5;
        kScaleIsPadNoScale = kScaleNo6P;
    } else if (IS_IPHONE && IPHONE4S) {
        kScale *= kScale6To4s;
        kScaleNo6P *= kScale6To4s;
        kScaleIsPadNoScale = kScaleNo6P;
    } else if (IS_IPAD && IPAD_2) {
        kScale *= kScale6ToiPad2/2.0 + 0.5;
        kScaleNo6P *= kScale;
    } else if (IS_IPAD && IPAD_MINI4) {
        kScale *= kScale6ToiPadMini4/2.0 + 0.5;
        kScaleNo6P *= kScale;
    } else if (IS_IPAD && IPAD_PRO) {
        kScale *= kScale6ToiPadPro/2.0 + 0.5;
        kScaleNo6P *= kScale;
    }
    
    
    if (@available(iOS 13.0, *)) {
        
    } else {
        TYHTableViewController1 *vc = [[TYHTableViewController1 alloc] init];
        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:vc];
        self.window = ([[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]]);
        [self.window makeKeyAndVisible];
        self.window.rootViewController = nav;
    }
    
    return YES;
}


#pragma mark - UISceneSession lifecycle


- (UISceneConfiguration *)application:(UIApplication *)application configurationForConnectingSceneSession:(UISceneSession *)connectingSceneSession options:(UISceneConnectionOptions *)options  API_AVAILABLE(ios(13.0)){
    // Called when a new scene session is being created.
    // Use this method to select a configuration to create the new scene with.
    return [[UISceneConfiguration alloc] initWithName:@"Default Configuration" sessionRole:connectingSceneSession.role];
}


- (void)application:(UIApplication *)application didDiscardSceneSessions:(NSSet<UISceneSession *> *)sceneSessions  API_AVAILABLE(ios(13.0)){
    // Called when the user discards a scene session.
    // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
    // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
}


@end
