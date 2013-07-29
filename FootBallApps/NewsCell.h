//
//  NewsCell.h
//  FootBallApps
//
//  Created by Carl on 13-7-27.
//  Copyright (c) 2013年 yuninfo. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface NewsCell : UITableViewCell
@property (nonatomic,weak) IBOutlet UILabel * timeLabel;
@property (nonatomic,weak) IBOutlet UILabel * dateLabel;
@property (nonatomic,weak) IBOutlet UILabel * titleLabel;
@property (nonatomic,weak) IBOutlet UILabel * descriptionLabel;
@end
