//
//  DetailViewController.m
//  Todo
//
//  Created by LEON on 14/11/4.
//  Copyright (c) 2014年 LEON. All rights reserved.
//

#import "DetailViewController.h"

@interface DetailViewController ()
@property UITextView *mytextView;
@end


@implementation DetailViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.mytextView = [[UITextView alloc] initWithFrame:self.view.frame];
    self.mytextView.text = self.toDoItem.itemName;
    self.mytextView.font = [UIFont fontWithName:@"Helvetica" size:18.0];
    [self.view addSubview:self.mytextView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)viewWillDisappear:(BOOL)animated
{
    [super viewWillDisappear:animated];
    
    if ([self.toDoItem.itemName isEqualToString: self.mytextView.text]) {
        ;
    }
    else
    {
        MGToDoList *changed = [[MGToDoList alloc] init];
        changed.itemName = self.mytextView.text;
        changed.creationDate = [NSDate date];
        
        [self.delegate synchronizeToList:self andChanged:changed andPast:self.toDoItem];
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
