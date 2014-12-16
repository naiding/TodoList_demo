//
//  DetailViewController.h
//  TodoList
//
//  Created by LEON on 14/12/4.
//  Copyright (c) 2014年 LEON. All rights reserved.
//
#import <UIKit/UIKit.h>
#import "MGToDoList.h"
#import "SaveChangeDelegate.h"

@class  ViewController;

@interface DetailViewController : UIViewController

@property MGToDoList *toDoItem;
@property (assign,nonatomic) id<SaveChangeDelegate> delegate;

@end
