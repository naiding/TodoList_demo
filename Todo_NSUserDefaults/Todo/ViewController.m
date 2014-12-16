//
//  ViewController.m
//  Todo
//
//  Created by LEON on 14/10/30.
//  Copyright (c) 2014年 LEON. All rights reserved.
//

#import "ViewController.h"

@interface ViewController () <SaveChangeDelegate,UISearchDisplayDelegate,UITableViewDataSource, UITableViewDelegate>

@property NSMutableArray *filteredNoteArray;
@property UISearchBar *bar;
@property UISearchDisplayController *searchDispCtrl;

@property (weak, nonatomic) IBOutlet UITableView *ToDoTable;

@end

@implementation ViewController

@synthesize filteredNoteArray,bar,searchDispCtrl,ToDoTable,ToDoList;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.ToDoList = [[NSMutableArray alloc] init];
    [self loadInitialData];
    
    self.filteredNoteArray = [[NSMutableArray alloc] init];
    
    bar = [[UISearchBar alloc]initWithFrame:CGRectMake(0, 0, self.ToDoTable.bounds.size.width, 44)];
    searchDispCtrl = [[UISearchDisplayController alloc]initWithSearchBar:bar contentsController:self];
    searchDispCtrl.delegate = self;
    searchDispCtrl.searchResultsDataSource = self;
    searchDispCtrl.searchResultsDelegate = self;
    self.ToDoTable.tableHeaderView = bar;
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void) loadInitialData
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    NSData* data  = [userDefaults objectForKey:@"ToDoArray"];
    self.ToDoList = [NSKeyedUnarchiver unarchiveObjectWithData:data];
    if (!self.ToDoList) {
        self.ToDoList = [NSMutableArray array];
    }
}

-(void) saveData
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    
    [userDefaults setObject:[NSKeyedArchiver archivedDataWithRootObject:self.ToDoList] forKey:@"ToDoArray"];
    [userDefaults synchronize];
}

 - (IBAction)unwindToList:(UIStoryboardSegue *)segue
{
    AddToDoListViewController *source = [segue sourceViewController];
    MGToDoList *item = source.toDoItem;
    if (item != nil) {
        [self.ToDoList addObject:item];
        [self.ToDoTable reloadData];
        [self saveData];
    }
}

- (IBAction)doneToList:(UIStoryboardSegue *)segue
{
    
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *) tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        return [filteredNoteArray count];
    }
    else return [self.ToDoList count];
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [self.ToDoTable dequeueReusableCellWithIdentifier:@"myCell"];
    
    NSString *note  = [[NSString alloc]init];
    NSString *strDate;
    MGToDoList *tmp = [[MGToDoList alloc] init];
    
    NSDateFormatter *dateFormatter = [[NSDateFormatter alloc] init];
    [dateFormatter setDateFormat:@"yyyy-MM-dd HH:mm"];
    
    if (tableView == self.searchDisplayController.searchResultsTableView) {
        tmp = [filteredNoteArray objectAtIndex:indexPath.row];
    }
    else if(tableView == self.ToDoTable){
        tmp = [self.ToDoList objectAtIndex:indexPath.row];
    };
    //tmp = [self.ToDoList objectAtIndex:indexPath.row];
    note = tmp.itemName;
    strDate = [dateFormatter stringFromDate:tmp.creationDate];
    cell.detailTextLabel.text = strDate;
    
    NSUInteger charnum = [note length];
    if (charnum < 32) {
        cell.textLabel.text = note;
    }
    else{
        cell.textLabel.text = [[note substringToIndex:18] stringByAppendingString:@"..."];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    
    DetailViewController *detailView = [[DetailViewController alloc]initWithNibName:nil bundle:nil];
    [self.navigationController pushViewController:detailView animated:YES];
    detailView.delegate = self;
    detailView.toDoItem = [self.ToDoList objectAtIndex:indexPath.row];
}


- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewCellEditingStyleDelete;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        [self.ToDoList removeObjectAtIndex:indexPath.row];
        [self.ToDoTable reloadData];
        [self saveData];
    }
}

#pragma mark savechangeDelegate
-(void)synchronizeToList:(DetailViewController *)vc andChanged:(MGToDoList *)changedItem andPast:(MGToDoList *)pastItem;
{
    [self.ToDoList addObject:changedItem];
    [self.ToDoList removeObject:pastItem];
    [self saveData];
    [self.ToDoTable reloadData];
}

#pragma mark uisearchdisplaydelegate
- (BOOL)searchDisplayController:(UISearchDisplayController *)controller shouldReloadTableForSearchString:(NSString *)searchString{
    [filteredNoteArray removeAllObjects];
    
    for( id temp in self.ToDoList) {
        if ([[temp itemName] containsString:searchString]) {
            [filteredNoteArray addObject:temp];
        }
    }
    
    return YES;
}

@end
