//
//  NoticeListViewController.m
//  FootBallApps
//
//  Created by Carl on 13-7-28.
//  Copyright (c) 2013年 yuninfo. All rights reserved.
//

#import "NoticeListViewController.h"
#import "NewsCell.h"
#import <QuartzCore/QuartzCore.h>
#define TABLE_ROW_HEIGHT 75.0f
#define NoticeCellIdentifier @"NoticeCell"
@interface NoticeListViewController ()

@end

@implementation NoticeListViewController

#pragma mark - UIVeiwController Life Cycle

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
    

    // Uncomment the following line to preserve selection between presentations.
    self.clearsSelectionOnViewWillAppear = NO;
    
    [self initUI];
 
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Instance Methods
#pragma mark - Instance Methods
//初始化UI
-(void) initUI
{
    //set title
    if(self.title == nil)
    {
        self.title = NSLocalizedString(@"NoticeList", nil);
    }
    
    UIImage * bgImg = [[UIImage imageNamed:@"main_bg1.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10.0, 10.0, 10.0, 10.0)];
    [self.view setBackgroundColor:[UIColor colorWithPatternImage:bgImg]];
    
    
    //custom the navigationbar
    self.navigationController.navigationBar.tintColor = [UIColor redColor];
    [self.navigationController.view.layer setCornerRadius:10.0f];
    

    
    
    //载入自定义cell
    UINib * nib = [UINib nibWithNibName:@"NewsCell" bundle:nil];
    [self.tableView registerNib:nib forCellReuseIdentifier:NoticeCellIdentifier];
    NewsCell * cell = (NewsCell *)[self.tableView dequeueReusableCellWithIdentifier:NoticeCellIdentifier];
    UIImage *dateAboveBg = [[UIImage imageNamed:@"date_above.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10)];
    [cell.timeLabel setBackgroundColor:[UIColor colorWithPatternImage:dateAboveBg]];
    
    UIImage * dateBelowBg = [[UIImage imageNamed:@"date_below.png"] resizableImageWithCapInsets:UIEdgeInsetsMake(5, 5, 5, 5)];
    [cell.dateLabel setBackgroundColor:[UIColor colorWithPatternImage:dateBelowBg]];
    [self.tableView setSeparatorStyle:UITableViewCellSeparatorStyleSingleLineEtched];
    
    
    
}



#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    // Return the number of sections.
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    // Return the number of rows in the section.
    return 10;
}

-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return TABLE_ROW_HEIGHT;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NewsCell * cell = (NewsCell *)[tableView dequeueReusableCellWithIdentifier:NoticeCellIdentifier];
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    return cell;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    }   
    else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath
{
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

#pragma mark - Table view delegate

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Navigation logic may go here. Create and push another view controller.
    /*
     <#DetailViewController#> *detailViewController = [[<#DetailViewController#> alloc] initWithNibName:@"<#Nib name#>" bundle:nil];
     // ...
     // Pass the selected object to the new view controller.
     [self.navigationController pushViewController:detailViewController animated:YES];
     */
}

@end
