//
//  AppDelegate.h
//  FootBallApps
//
//  Created by Angus on 13-7-8.
//  Copyright (c) 2013年 yuninfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface AppDelegate : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

//AppDelegate 用于保存临时数据的Dic
@property (retain, nonatomic) NSMutableDictionary* cacheDictionary;



@end
