//
//  WebViewController.m
//  FootBallApps
//
//  Created by Angus on 13-7-10.
//  Copyright (c) 2013年 yuninfo. All rights reserved.
//

#import "WebViewController.h"

@interface WebViewController ()<UIWebViewDelegate>

@end

@implementation WebViewController


#pragma mark UIViewController Life Cycle
- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}


- (void)viewDidLoad
{
    
    [super viewDidLoad];
    

    [self initUI];

    
    

}



-(void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    self.navigationItem.rightBarButtonItem.customView.hidden = YES;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark  Instance methods
-(id)initWithURLString:(NSString*)urlString
{
    self = [super init];
    if(self){
        self.urlString = urlString;
    }
    return self;
}

//初始化UI
-(void)initUI
{
    //custom navigationbar
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    

    self.webView = [[UIWebView alloc]initWithFrame:CGRectMake(0, 0, [UIScreen mainScreen].bounds.size.width, [UIScreen mainScreen].bounds.size.height)];
    self.webView.delegate = self;
    [self.view addSubview:self.webView];
    
    NSURLRequest* request = [[NSURLRequest alloc]initWithURL:[NSURL URLWithString:self.urlString]];
    [self.webView loadRequest:request];
    
    [self setIndicatorItemForRight];
    
}

-(void)setIndicatorItemForRight
{
    UIActivityIndicatorView * indicatorView = [[UIActivityIndicatorView alloc] initWithActivityIndicatorStyle:UIActivityIndicatorViewStyleGray];
    indicatorView.hidesWhenStopped = YES;
    indicatorView.frame = CGRectMake(0, 0, 30, 30);
    [indicatorView startAnimating];
    UIBarButtonItem * activityItem = [[UIBarButtonItem alloc] initWithCustomView:indicatorView];
    [self.navigationItem setRightBarButtonItem:activityItem];
}



#pragma mark - UIWebViewDelegate Methods
-(void)webViewDidStartLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = YES;
    self.navigationItem.rightBarButtonItem.customView.hidden = NO;
}

-(void)webViewDidFinishLoad:(UIWebView *)webView
{
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    self.navigationItem.rightBarButtonItem.customView.hidden = YES;
}

-(void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error
{
    NSLog(@"UIWebView did fail load with erro : %@",error);
    [UIApplication sharedApplication].networkActivityIndicatorVisible = NO;
    self.navigationItem.rightBarButtonItem.customView.hidden = YES;
    
}


@end
