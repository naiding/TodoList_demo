//
//  AddToDoListViewController.m
//  TodoList
//
//  Created by LEON on 14/12/4.
//  Copyright (c) 2014年 LEON. All rights reserved.
//

#import "AddToDoListViewController.h"

@implementation AddToDoListViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if (sender != self.doneButton) return;
    if (self.textField.text.length >0 ){
        self.toDoItem = [[MGToDoList alloc] init];
        self.toDoItem.itemName = self.textField.text;
        self.toDoItem.creationDate = [NSDate date];
    }
}

@end
