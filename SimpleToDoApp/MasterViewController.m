//
//  MasterViewController.m
//  SimpleToDoApp
//
//  Created by 川崎 隆介 on 2015/01/01.
//  Copyright (c) 2015年 川崎 隆介. All rights reserved.
//

#import "MasterViewController.h"
#import "DetailViewController.h"
#import "ToDoService.h"
#import "ToDo.h"
#import "AddToDoController.h"

@interface MasterViewController ()

@property NSMutableArray *objects;
@end

@implementation MasterViewController

-(IBAction)done:(UIStoryboardSegue *)segue{
    if ([[segue identifier] isEqualToString:@"DoneInput"]) {
        AddToDoController *addController = [segue sourceViewController];
        if (addController.toDo) {
            [self.toDoService addToDoList:addController.toDo];
        }
        [[self tableView] reloadData];
    }
    
    [self dismissViewControllerAnimated:YES completion:NULL];
}

-(IBAction)cancel:(UIStoryboardSegue *)segue{
    [self dismissViewControllerAnimated:YES completion:NULL];    
}


- (void)awakeFromNib {
    [super awakeFromNib];
    _toDoService = [[ToDoService alloc] init];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    self.navigationItem.leftBarButtonItem = self.editButtonItem;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)insertNewObject:(id)sender {
    if (!self.objects) {
        self.objects = [[NSMutableArray alloc] init];
    }
    [self.objects insertObject:[NSDate date] atIndex:0];
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:0 inSection:0];
    [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
}

#pragma mark - Segues

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    if ([[segue identifier] isEqualToString:@"showDetail"]) {
        NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
        //NSDate *object = self.objects[indexPath.row];
        ToDo *todo = [self.toDoService objectInListAtIndex:indexPath.row];
        [[segue destinationViewController] setDetailItem:todo];
    }
}

#pragma mark - Table View

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return [self.toDoService countOfList];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];

    ToDo *todo = [self.toDoService objectInListAtIndex:indexPath.row];
    cell.textLabel.text = todo.title;
    cell.detailTextLabel.text = todo.content;
    
    return cell;
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        ToDo *todo = [self.toDoService objectInListAtIndex:indexPath.row];
        [self.toDoService removeToDoList:todo];
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view.
    }
}

@end
