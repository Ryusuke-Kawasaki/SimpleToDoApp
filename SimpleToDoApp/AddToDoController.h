//
//  AddToDoController.h
//  SimpleToDoApp
//
//  Created by 川崎 隆介 on 2015/01/02.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ToDo;
@interface AddToDoController : UITableViewController <UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITextField *titleTextField;
@property (weak, nonatomic) IBOutlet UITextField *contentTextField;
@property (nonatomic) ToDo *toDo;
@end
