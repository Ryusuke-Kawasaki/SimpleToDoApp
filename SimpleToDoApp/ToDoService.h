//
//  ToDoService.h
//  SimpleToDoApp
//
//  Created by 川崎 隆介 on 2015/01/01.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

#import <Foundation/Foundation.h>
@class ToDo;

@interface ToDoService : NSObject
@property(nonatomic) NSMutableArray *toDoList;
- (NSUInteger)countOfList;
- (ToDo *)objectInListAtIndex:(NSUInteger)index;
- (void)addToDoList:(ToDo *) toDo;
- (void)removeToDoList:(ToDo *)toDo;
@end
