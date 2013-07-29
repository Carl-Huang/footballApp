//
//  MainViewController.m
//  FootBallApps
//
//  Created by Angus on 13-7-8.
//  Copyright (c) 2013年 yuninfo. All rights reserved.
//

#import "MainViewController.h"

#import "UIViewController+MMDrawerController.h"
#import "MMDrawerBarButtonItem.h"
#import "LeftMenuViewController.h"
#import "NewsCell.h"
#import "CustomScrollView.h"
#import <QuartzCore/QuartzCore.h>
#import "WebViewController.h"

typedef NS_ENUM(NSInteger, MMCenterViewControllerSection){
    MMCenterViewControllerSectionLeftViewState,
    MMCenterViewControllerSectionLeftDrawerAnimation,
    MMCenterViewControllerSectionRightViewState,
    MMCenterViewControllerSectionRightDrawerAnimation,
};

#define TABLE_ROW_HEIGHT 75.0f
#define CellIdentifier @"NewsCell"

@interface MainViewController ()

@end

@implementation MainViewController

 
#pragma mark - ViewController Life Cycle
- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
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


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}




#pragma mark - Instance Methods
//初始化UI
-(void) initUI
{
    //set title
    if(self.title == nil)
    {
        self.title = NSLocalizedString(@"MainSceneTitle", nil);
    }
    
    UIImage * bgImg = [[UIImage imageNamed:@"main_bg1.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:bgImg]];
    
    
    //custom the navigationbar
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    [self.navigationController.view.layer setCornerRadius:10.0f];
    
    [self setMenuItemForLeft];
    [self setBackItemForNextScene];
    

    
    
    //载入自定义cell
    UINib * nib = [UINib nibWithNibName:@"NewsCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:CellIdentifier];
    NewsCell * cell = (NewsCell *)[self.tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    UIImage *dateAboveBg = [[UIImage imageNamed:@"date_above.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [cell.timeLabel setBackgroundColor:[UIColor colorWithPatternImage:dateAboveBg]];
    
    UIImage * dateBelowBg = [[UIImage imageNamed:@"date_below.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [cell.dateLabel setBackgroundColor:[UIColor colorWithPatternImage:dateBelowBg]];
    //设置tableview的头部
    CustomScrollView * scrolView = [[CustomScrollView alloc] initWithArray:[NSArray arrayWithObjects:@"1", @"1",@"1",@"1",@"1",nil]];
    [scrolView sizeToFit];
    
    [self.tableView setTableHeaderView:scrolView];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];

    
    
}



//set the leftBarButtonItem
-(void)setMenuItemForLeft
{
    UIBarButtonItem * menuItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"reveal_menu_icon_portrait.png"] landscapeImagePhone:[UIImage imageNamed:@"reveal_menu_icon_landscape.png"] style:UIBarButtonItemStyleDone target:self action:@selector(clickMenuItemForShow:)];
    
    [self.navigationItem setLeftBarButtonItem:menuItem];
}

-(void)setBackItemForNextScene
{
    UIBarButtonItem * backItem = [[UIBarButtonItem alloc] initWithTitle:NSLocalizedString(@"Back", nil) style:UIBarButtonItemStylePlain target:nil action:nil];
    [self.navigationItem setBackBarButtonItem:backItem];
}



//打开左边menu，responds to the leftBarButtonItem click event
-(void)clickMenuItemForShow:(id)sender
{
    [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
}


#pragma mark - UITableViewDataSource Methods
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 10;
}


-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TABLE_ROW_HEIGHT;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
   
    NewsCell * cell = (NewsCell *)[tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
    
}


#pragma mark - UITableViewDelegate Methods

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //  [self.mm_drawerController toggleDrawerSide:MMDrawerSideLeft animated:YES completion:nil];
    
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    WebViewController * webViewController = [[WebViewController alloc] initWithURLString:@"http://www.baidu.com"];
    webViewController.title = NSLocalizedString(@"HengDaNews", nil);
    [self.navigationController pushViewController:webViewController animated:YES];
    
    
}



@end
