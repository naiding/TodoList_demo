//
//  SaveChangeDelegate.h
//  Todo
//
//  Created by LEON on 14/11/5.
//  Copyright (c) 2014年 LEON. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DetailViewController;

@protocol SaveChangeDelegate <NSObject>

-(void)synchronizeToList:(DetailViewController *)vc andChanged:(MGToDoList *)changedItem andPast:(MGToDoList *)pastItem;

@end
