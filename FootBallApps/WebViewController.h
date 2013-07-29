//
//  WebViewController.h
//  FootBallApps
//
//  Created by Angus on 13-7-10.
//  Copyright (c) 2013年 yuninfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "UIViewController+MMDrawerController.h"

@interface WebViewController : UIViewController

@property(strong,nonatomic) UIWebView* webView;
@property(retain,nonatomic) NSString* urlString;
-(id)initWithURLString:(NSString*)urlString;
@end
