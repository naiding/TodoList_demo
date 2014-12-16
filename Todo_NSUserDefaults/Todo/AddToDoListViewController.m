//
//  AddToDoListViewController.m
//  Todo
//
//  Created by LEON on 14/10/30.
//  Copyright (c) 2014年 LEON. All rights reserved.
//

#import "AddToDoListViewController.h"

@interface AddToDoListViewController ()

@property (weak, nonatomic) IBOutlet UITextField *textField;
@property (weak, nonatomic) IBOutlet UIButton *doneButton;

@end

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
        self.toDoItem.completed = @"NO";
        self.toDoItem.creationDate = [NSDate date];
    }
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
