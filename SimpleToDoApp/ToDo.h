//
//  ToDo.h
//  SimpleToDoApp
//
//  Created by 川崎 隆介 on 2015/01/01.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ToDo : NSObject <NSCoding>
@property(nonatomic,copy) NSString *title;
@property(nonatomic,copy) NSString *content;
- (id)initWithTitle:(NSString *)title content:(NSString *)content;
@end
