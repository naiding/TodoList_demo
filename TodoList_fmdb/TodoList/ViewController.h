//
//  ViewController.h
//  TodoList
//
//  Created by LEON on 14/12/4.
//  Copyright (c) 2014年 LEON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGToDoList.h"
#import "DetailViewController.h"
#import "AddToDoListViewController.h"

@interface ViewController : UIViewController

@property (nonatomic, strong) NSMutableArray *ToDoList;
@property (weak, nonatomic) IBOutlet UITableView *ToDoTable;

@end

