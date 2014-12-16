//
//  SaveChangeDelegate.h
//  TodoList
//
//  Created by LEON on 14/12/4.
//  Copyright (c) 2014年 LEON. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DetailViewController;

@protocol SaveChangeDelegate <NSObject>

-(void)synchronizeToList:(DetailViewController *)vc andChanged:(MGToDoList *)changedItem andPast:(MGToDoList *)pastItem;

@end