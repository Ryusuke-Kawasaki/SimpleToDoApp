//
//  ToDo.m
//  SimpleToDoApp
//
//  Created by 川崎 隆介 on 2015/01/01.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

#import "ToDo.h"

@implementation ToDo

- (id)initWithCoder:(NSCoder *)aDecoder{
    self = [super init];
    if (self) {
        _title = [aDecoder decodeObjectForKey:@"title"];
        _content = [aDecoder decodeObjectForKey:@"content"];
    }
    return self;
}

- (void)encodeWithCoder:(NSCoder *)aCoder{
    [aCoder encodeObject:_title forKey:@"title"];
    [aCoder encodeObject:_content forKey:@"content"];
}

- (id)initWithTitle:(NSString *)title content:(NSString *)content{
    self = [super init];
    if (self) {
        _title = title;
        _content = content;
    }
    return self;
}
@end
