//
//  LeftMenuViewController.m
//  FootBallApps
//
//  Created by Angus on 13-7-8.
//  Copyright (c) 2013年 yuninfo. All rights reserved.
// 

#import "LeftMenuViewController.h"
#import "MMSideDrawerTableViewCell.h"
#import "MainViewController.h"
#import "WebViewController.h"

@interface LeftMenuViewController ()
{
    //菜单normal图片数组
    NSArray *menuNormalArray;
    //菜单selected图片数组
    NSArray * menuSelectedArray;
}

@end

@implementation LeftMenuViewController

#pragma mark - UIViewController Life Cycle

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
	// Do any additional setup after loading the view.
    [self initData];
    [self initUI];
    
    
}


- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    NSIndexPath * indexPath = [self.tableView indexPathForSelectedRow];
    MMSideDrawerTableViewCell * cell = (MMSideDrawerTableViewCell *)[self.tableView cellForRowAtIndexPath:indexPath];
    UIImageView * menuImageView = (UIImageView *)[cell.contentView viewWithTag:3];
    menuImageView.image = [UIImage imageNamed:[menuNormalArray objectAtIndex:indexPath.row]];
    [self.tableView deselectRowAtIndexPath:indexPath animated:NO];
    // [self.tableView reloadSections:[NSIndexSet indexSetWithIndexesInRange:NSMakeRange(0, self.tableView.numberOfSections-1)] withRowAnimation:UITableViewRowAnimationNone];
}



- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Instance Methods
//初始化数据源
-(void)initData
{
    menuNormalArray = [NSArray arrayWithObjects:
                 @"word_menu_news_normal",
                 @"word_menu_competition_normal",
                 @"word_menu_club_normal",
                 @"word_menu_vip_normal",
                 @"word_menu_ticket_normal",
                 @"word_menu_business_normal",
                 @"word_menu_market_normal",
                 @"word_menu_blog_normal",
                 nil];
    menuSelectedArray = [NSArray arrayWithObjects:
                         @"word_menu_news_selected",
                         @"word_menu_competition_selected",
                         @"word_menu_club_selected",
                         @"word_menu_vip_selected",
                         @"word_menu_ticket_selected",
                         @"word_menu_business_selected",
                         @"word_menu_market_selected",
                         @"word_menu_blog_selected",
                         nil];
    
}


//初始化UI
-(void)initUI
{
    
    
    //custom navigationbar
    UIImageView * imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, 36.0f, 36.0f)];
    imageView.image = [UIImage imageNamed:@"sliding_menu_title_logo.png"];
    UIBarButtonItem * imageBarItem = [[UIBarButtonItem alloc] initWithCustomView:imageView];;
    
    UILabel * titleLabel = [[UILabel alloc] initWithFrame:CGRectZero];
    titleLabel.text = NSLocalizedString(@"LeftSceneTitle", nil);
    titleLabel.frame = CGRectMake(0, 0, 44, 200);
    titleLabel.font = [UIFont boldSystemFontOfSize:22];
    titleLabel.textColor = [UIColor yellowColor];
    titleLabel.backgroundColor = [UIColor clearColor];
    titleLabel.adjustsFontSizeToFitWidth = YES;
    [titleLabel sizeToFit];
    UIBarButtonItem * titleItem = [[UIBarButtonItem alloc] initWithCustomView:titleLabel];
    [self.navigationItem setLeftBarButtonItems:[NSArray arrayWithObjects:imageBarItem,titleItem,nil]];
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    
    
    UIImage * imageBg = [[UIImage imageNamed:@"slidingmenu_bg.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10.0f, 10.0f, 10.0f, 10.0f)];
//    UIImageView * imageBgView = [[UIImageView alloc] initWithImage:imageBg];
    
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:imageBg]];
    
    
    //custom tableview
    UITableView* atableView = [[UITableView alloc] initWithFrame:self.view.bounds style:UITableViewStylePlain];
    self.tableView = atableView;
    [self.tableView setDelegate:self];
    [self.tableView setBounces:NO];
    [self.tableView setDataSource:self];
    [self.view addSubview:self.tableView];
    [self.tableView setAutoresizingMask:UIViewAutoresizingFlexibleWidth|UIViewAutoresizingFlexibleHeight];
    [self.tableView setBackgroundColor:[UIColor clearColor]];
    [self.mm_drawerController setShowsShadow:YES];
}


-(void)menuButtonClick:(id)sender
{
    
    UIButton * button = (UIButton *)sender;
    MMSideDrawerTableViewCell * cell = (MMSideDrawerTableViewCell * )[[button superview] superview];
    NSIndexPath *indexPath = [self.tableView indexPathForCell:cell];
    [self tableView:self.tableView didSelectRowAtIndexPath:indexPath];
    NSLog(@"Menu button click %d",indexPath.row);
}



#pragma mark - UITableViewDataSource Methods
//恒大新闻:新闻内页;
//赛事信息:足球射手榜;
//俱乐部:简介 历史 主场 比赛服  吉祥物 战绩 大事记 奖杯 转会;
//会员专区:会员卡介绍 积分查询 观赛年票 会员积分 羊城通 手机卡 公告 常见问题;
//手机订票
//商务
//网上商城
//球迷论坛;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *CellIdentifier = @"Cell";
    
    UITableViewCell *cell = (UITableViewCell*)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (cell == nil) {
        
        cell = [[MMSideDrawerTableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:CellIdentifier];

        /*
        UIButton * menuButton = [UIButton buttonWithType:UIButtonTypeCustom];
        [menuButton addTarget:self action:@selector(menuButtonClick:) forControlEvents:UIControlEventTouchUpInside];
        menuButton.frame = CGRectMake(10.0, 5.0, 128.0f, 35.0f);
        menuButton.tag = 3;
        [cell.contentView addSubview:menuButton];
        */
        UIImageView * menuImageView = [[UIImageView alloc] initWithFrame:CGRectMake(10.0, 5.0, 128.0f, 35.0f)];
        menuImageView.tag = 3;
        [cell.contentView addSubview:menuImageView];
        
        
        UIImage * bgImage = [[UIImage imageNamed:@"menu_item_bg_normal.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        UIImageView * bgView = [[UIImageView alloc] initWithImage:bgImage];
        [cell setBackgroundView:bgView];
        
        
        UIImage * selectedImage = [[UIImage imageNamed:@"menu_item_bg_selected.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
        UIImageView * selectedView = [[UIImageView alloc] initWithImage:selectedImage];
        [cell setSelectedBackgroundView:selectedView];
        
        
    }
    
    UIImageView * menuImageView = (UIImageView *)[cell.contentView viewWithTag:3];
    menuImageView.image = [UIImage imageNamed:[menuNormalArray objectAtIndex:indexPath.row]];
    /*
    UIButton * button = (UIButton *)[cell.contentView viewWithTag:3];
    [button setImage:[UIImage imageNamed:[menuNormalArray objectAtIndex:indexPath.row]] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:[menuSelectedArray objectAtIndex:indexPath.row]] forState:UIControlStateHighlighted];
     */
    return cell;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 45.0f;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return [menuNormalArray count];
    
}

-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}



#pragma mark - UITableViewDelegate Methods
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    
    
    
    NSLog(@" did Select %d",indexPath.row);
        UINavigationController * nav = nil;
    MMSideDrawerTableViewCell * cell = (MMSideDrawerTableViewCell *)[tableView cellForRowAtIndexPath:indexPath];
    
    UIImageView * menuImageView = (UIImageView *)[cell.contentView viewWithTag:3];
    menuImageView.image = [UIImage imageNamed:[menuSelectedArray objectAtIndex:indexPath.row]];
    
    if(indexPath.row == 7){
        
        WebViewController* web = [[WebViewController alloc]initWithURLString:@"http://www.baidu.com"];
        web.title = NSLocalizedString(@"FansForum", nil);
        
         nav = [[UINavigationController alloc] initWithRootViewController:web];
    }else if(indexPath.row == 6){
        WebViewController* web = [[WebViewController alloc] initWithURLString:@"http://www.google.com"];
        web.title = NSLocalizedString(@"OnlineMall", nil);
        nav = [[UINavigationController alloc]initWithRootViewController:web];
    }else if(indexPath.row == 5){
        WebViewController* web = [[WebViewController alloc]initWithURLString:@"http://www.163.com"];
         web.title = NSLocalizedString(@"Business", nil);
        nav = [[UINavigationController alloc] initWithRootViewController:web];
    }
    else
    {
        MainViewController* center = [[MainViewController alloc]initWithStyle:UITableViewStylePlain];

        nav = [[UINavigationController alloc] initWithRootViewController:center];
    }
    
    
    
    [self.mm_drawerController setCenterViewController:nav withFullCloseAnimation:NO
         completion:nil];
    

}




@end
