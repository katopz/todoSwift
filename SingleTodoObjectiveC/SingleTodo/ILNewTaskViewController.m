//
//  ILNewTaskViewController.m
//  SingleTodo
//
//  Created by Abraham Kuri on 6/3/14.
//  Copyright (c) 2014 icalialabs. All rights reserved.
//

#import "ILNewTaskViewController.h"
#import "ILTodoTableViewController.h"
#import "ILTask.h"


@interface ILNewTaskViewController ()
@property (weak, nonatomic) IBOutlet UITextField *descriptionTextField;

@end

@implementation ILNewTaskViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)addTaskButtonPressed:(id)sender
{
    ILTask *task = [[ILTask alloc] init];
    task.taskDescription = self.descriptionTextField.text;
    task.done = NO;
    
    [self.todoVC AddTask:task];
    
    [self.navigationController popViewControllerAnimated:YES];
}

@end
