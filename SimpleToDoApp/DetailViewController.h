//
//  DetailViewController.h
//  SimpleToDoApp
//
//  Created by 川崎 隆介 on 2015/01/01.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ToDo;
@interface DetailViewController : UITableViewController

@property (strong, nonatomic) ToDo *detailItem;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *contentLabel;


@end

