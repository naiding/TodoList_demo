//
//  MGToDoList.h
//  Todo
//
//  Created by LEON on 14/10/30.
//  Copyright (c) 2014年 LEON. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MGToDoList : NSObject <NSCoding>

@property NSString *itemName;
@property NSDate *creationDate;

@end