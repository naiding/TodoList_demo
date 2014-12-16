//
//  MGToDoList.m
//  Todo
//
//  Created by LEON on 14/10/30.
//  Copyright (c) 2014年 LEON. All rights reserved.
//

#import "MGToDoList.h"

@implementation MGToDoList

@synthesize itemName;
@synthesize completed;
@synthesize creationDate;

- (id) initWithCoder: (NSCoder *)coder
{
    if (self = [super init])
    {
        self.itemName = [coder decodeObjectForKey:@"itemName"];
        self.completed = [coder decodeObjectForKey:@"completed"];
        self.creationDate = [coder decodeObjectForKey:@"creationDate"];
    }
    return self;
}
- (void) encodeWithCoder: (NSCoder *)coder
{
    [coder encodeObject:self.itemName forKey:@"itemName"];
    [coder encodeObject:self.completed forKey:@"completed"];
    [coder encodeObject:self.creationDate forKey:@"creationDate"];
    
}


@end
