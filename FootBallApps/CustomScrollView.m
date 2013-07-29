//
//  CustomScrollView.m
//  FootBallApps
//
//  Created by Carl on 13-7-27.
//  Copyright (c) 2013年 yuninfo. All rights reserved.
//

#import "CustomScrollView.h"

@implementation CustomScrollView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}



-(id)initWithArray:(NSArray *)paramArray
{
    CGRect bounds = CGRectMake(0, 0, 320, SCROLL_VIEW_HEIGHT);
    self = [self initWithFrame:bounds];
    
    if(self != nil)
    {
        //初始化UIScrollView
        scrollView = [[UIScrollView alloc] initWithFrame:bounds];
        scrollView.pagingEnabled = YES;
        scrollView.delegate = self;
        scrollView.showsHorizontalScrollIndicator = NO;
        scrollView.showsVerticalScrollIndicator = NO;
        scrollView.bounces = NO;
        //循环添加新闻图片和标题
        for(int i = 0; i < [paramArray count]; i++)
        {
            UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(i * bounds.size.width, 0, bounds.size.width, SCROLL_VIEW_HEIGHT)];
            imageView.userInteractionEnabled = YES;
            imageView.contentMode = UIViewContentModeScaleAspectFill;
            imageView.image = [UIImage imageNamed:@"news1.png"];
            if(i/2 == 0)
            {
                imageView.image = [UIImage imageNamed:@"news2.png"];
            }
            
            [scrollView addSubview:imageView];
            
            UIView * layerView = [[UIView alloc] initWithFrame:CGRectMake(i * bounds.size.width, SCROLL_VIEW_HEIGHT - 60.0f, bounds.size.width, 60.0f)];
            layerView.backgroundColor = [UIColor colorWithRed:0.0 green:0.0 blue:0.0 alpha:0.6];
            UILabel * label = [[UILabel alloc] initWithFrame:CGRectMake(10.0f, 0, bounds.size.width - 5, 55.0f)];
            label.backgroundColor = [UIColor clearColor];
            label.numberOfLines = 2;
            label.lineBreakMode = NSLineBreakByTruncatingTail;
            label.textColor = [UIColor whiteColor];
            label.text = [NSString stringWithFormat:@"%d For Test For Test  For Test For Test For Test For Test",i];
            [layerView addSubview:label];
            [scrollView addSubview:layerView];
            
        }
        scrollView.contentSize = CGSizeMake(bounds.size.width * [paramArray count], SCROLL_VIEW_HEIGHT);
        [self addSubview:scrollView];
        
        
        
        //初始化UIPageControl
        
        pageControl = [[UIPageControl alloc] initWithFrame:CGRectMake(0, SCROLL_VIEW_HEIGHT - 20.0f, bounds.size.width, 20.0f)];
        pageControl.currentPage = 0;
        pageControl.numberOfPages = [paramArray count];
        pageControl.hidesForSinglePage = YES;
        
        [self addSubview:pageControl];
        
        
    }
    
    
    return self;
}



#pragma mark - UIScrollViewDelegate Methods 
-(void)scrollViewDidEndDecelerating:(UIScrollView *)_scrollView
{
    CGPoint offset = scrollView.contentOffset;
    CGRect bounds = scrollView.frame;
    int pageIndex = offset.x / bounds.size.width;
    pageControl.currentPage = pageIndex;
}

@end
