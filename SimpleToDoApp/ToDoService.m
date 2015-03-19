//
//  ToDoService.m
//  SimpleToDoApp
//
//  Created by 川崎 隆介 on 2015/01/01.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

#import "ToDoService.h"
#import "ToDo.h"
@implementation ToDoService

- (void)initializeDafaultDataList{
    _toDoList = [[NSMutableArray alloc] init];

    NSUserDefaults* userDefaults = [NSUserDefaults standardUserDefaults];
    //デバッグ用(ToDoを初期状態に戻したい時のみ有効にする)
    //[userDefaults removeObjectForKey:@"todolist"];
    NSArray* list = [userDefaults objectForKey:@"todolist"];
    if (list != nil) {
        for (NSData *data in list) {
            ToDo *todo = [NSKeyedUnarchiver unarchiveObjectWithData:data];
            [_toDoList addObject:todo];
        }
    }else{
        NSString *title = @"テスト勉強";
        NSString *content = @"明日の２１時までに教科書の３２ぺーじまでを終わらせること";
        ToDo *todo = [[ToDo alloc] initWithTitle:title content:content];
        [self addToDoList:todo];
        
        title = @"台所掃除";
        content = @"キッチン周りと換気扇の掃除を今日中に終わらせること";
        todo = [[ToDo alloc] initWithTitle:title content:content];
        [self addToDoList:todo];        
    }
}


- (id)init{
    self = [super init];
    if (self) {
        [self initializeDafaultDataList];
    }
    return self;
}

- (NSUInteger)countOfList{
    return self.toDoList.count;
}

- (ToDo *)objectInListAtIndex:(NSUInteger)index{
    return self.toDoList[index];
}

- (void)addToDoList:(ToDo *) toDo{
    [self.toDoList addObject:toDo];
    [self saveUserDeflauts];
}

- (void)removeToDoList:(ToDo *)toDo{
    [self.toDoList removeObject:toDo];
    [self saveUserDeflauts];
}

- (void)setToDoList:(NSMutableArray *)toDoList{
    if (_toDoList != toDoList) {
        _toDoList = [toDoList mutableCopy];
    }
}

- (void)saveUserDeflauts{
    NSMutableArray *saveList = [[NSMutableArray alloc] initWithCapacity:0];
    for (ToDo *todo in self.toDoList) {
        NSData *data = [NSKeyedArchiver archivedDataWithRootObject:todo];
        [saveList addObject:data];
    }
    
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:saveList forKey:@"todolist"];
    [userDefaults synchronize];
}

@end
