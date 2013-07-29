//
//  LeftMenuViewController.h
//  FootBallApps
//
//  Created by Angus on 13-7-8.
//  Copyright (c) 2013年 yuninfo. All rights reserved.
//  左边菜单视图

#import <UIKit/UIKit.h>
#import "UIViewController+MMDrawerController.h"

typedef NS_ENUM(NSInteger, MMDrawerSection){
    MMDrawerSectionViewSelection,
    MMDrawerSectionDrawerWidth,
    MMDrawerSectionShadowToggle,
    MMDrawerSectionOpenDrawerGestures,
    MMDrawerSectionCloseDrawerGestures,
    MMDrawerSectionCenterHiddenInteraction,
    MMDrawerSectionStretchDrawer,
};

@interface LeftMenuViewController : UIViewController <UITableViewDataSource,UITableViewDelegate>

@property (nonatomic, strong) UITableView * tableView;


@end
