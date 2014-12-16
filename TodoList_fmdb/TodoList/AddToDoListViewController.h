//
//  AddToDoListViewController.h
//  TodoList
//
//  Created by LEON on 14/12/4.
//  Copyright (c) 2014年 LEON. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MGToDoList.h"

@interface AddToDoListViewController : UIViewController

@property MGToDoList *toDoItem;
@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end
