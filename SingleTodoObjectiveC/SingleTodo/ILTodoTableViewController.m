//
//  ILTodoTableViewController.m
//  SingleTodo
//
//  Created by Abraham Kuri on 6/3/14.
//  Copyright (c) 2014 icalialabs. All rights reserved.
//

#import "ILTodoTableViewController.h"
#import "ILTask.h"
#import "ILNewTaskViewController.h"

@interface ILTodoTableViewController () <UITableViewDataSource, UITableViewDelegate>

@property (strong, nonatomic) NSMutableArray *tasks;
@property (strong, nonatomic) IBOutlet UITableView *tasksTable;

@end

@implementation ILTodoTableViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.tasks = [[NSMutableArray alloc] initWithArray:@[]];
    
    self.tasksTable.delegate = self;
    self.tasksTable.dataSource = self;
    
    UIBarButtonItem *anotherButton = [[UIBarButtonItem alloc] initWithTitle:@"Add" style:UIBarButtonItemStylePlain target:self action:@selector(showNewTaskViewController)];
    
    self.navigationItem.rightBarButtonItem = anotherButton;
    
    [self loadTasks];

}

- (void)showNewTaskViewController
{
    ILNewTaskViewController *newTaskVC = [[ILNewTaskViewController alloc] init];
    newTaskVC.todoVC = self;
    
    [self.navigationController pushViewController:newTaskVC animated:YES];
}

- (void) loadTasks
{
    ILTask *task1 = [[ILTask alloc] init];
    task1.taskDescription = @"Go buy some milk";
    
    ILTask *task2 = [[ILTask alloc] init];
    task2.taskDescription = @"Listen to some Taylor Swift";
    
    [self.tasks addObject:task1];
    [self.tasks addObject:task2];
    
    [self.tasksTable reloadData];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section.
    return self.tasks.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"taskCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellIdentifier];
    }
    
    ILTask *task = self.tasks[indexPath.row];
    cell.textLabel.text = task.taskDescription;
    if (task.isDone) {
        cell.accessoryType = UITableViewCellAccessoryCheckmark;
    } else {
        cell.accessoryType = UITableViewCellAccessoryNone;
    }
    
    return cell;
}


#pragma mark - Table view delegate
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.tasksTable deselectRowAtIndexPath:indexPath animated:NO];
    ILTask *task = [self.tasks objectAtIndex:indexPath.row];
    task.done = !task.isDone;
    [tableView reloadRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationNone];
}

- (void)AddTask:(ILTask *)task
{
    [self.tasks addObject:task];
    [self.tasksTable reloadData];
}

@end
