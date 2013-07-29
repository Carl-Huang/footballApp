//
//  CustomScrollView.h
//  FootBallApps
//
//  Created by Carl on 13-7-27.
//  Copyright (c) 2013年 yuninfo. All rights reserved.
//

#import <UIKit/UIKit.h>
#define SCROLL_VIEW_HEIGHT 200.0f
@interface CustomScrollView : UIView <UIScrollViewDelegate>
{
    UIScrollView * scrollView;
    UIPageControl * pageControl;
}

-(id)initWithArray:(NSArray *)paramArray;

@end
