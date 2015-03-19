//
//  MasterViewController.h
//  SimpleToDoApp
//
//  Created by 川崎 隆介 on 2015/01/01.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ToDoService;
@interface MasterViewController : UITableViewController
@property(nonatomic) ToDoService *toDoService;
-(IBAction)done:(UIStoryboardSegue *)segue;
-(IBAction)cancel:(UIStoryboardSegue *)segue;
@end

