//
//  ILTodoTableViewController.swift
//  SingleTodo
//
//  Created by Abraham Kuri on 6/3/14.
//  Copyright (c) 2014 Icalia Labs. All rights reserved.
//

import UIKit

class ILTodoTableViewController: UITableViewController, UITableViewDataSource, UITableViewDelegate {
    
    var tasks: NSMutableArray = NSMutableArray()
    
    
    func loadTasks() {
        var task1 = ILTask(description: "Go buy some milk")
        var task2 = ILTask(description: "Learn some Swift")
        
        self.tasks.addObject(task1)
        self.tasks.addObject(task2)
    
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.loadTasks()
        
        self.tableView.delegate = self
        self.tableView.dataSource = self
        
        var navigationButton: UIBarButtonItem = UIBarButtonItem(title: "Add", style: UIBarButtonItemStyle.Plain, target: self, action: Selector("showNewTaskViewController"))
        
        self.navigationItem.rightBarButtonItem = navigationButton
        
        self.tableView.reloadData()
        
        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false
        
        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
    }
    
    func showNewTaskViewController() {
//        SettingsViewController *viewController = [[SettingsViewController alloc]initWithNibName:@"SettingsViewController" bundle:[NSBundle mainBundle]];

        var newTaskVC: ILNewTaskViewController = ILNewTaskViewController()
//        var newTaskVC: ILNewTaskViewController = ILNewTaskViewController()
        
        newTaskVC.todoVC = self
                
        self.navigationController!.pushViewController(newTaskVC, animated: true)
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    // #pragma mark - Table view data source
    
    override func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        // Return the number of sections.
        return 1
    }
    
    override func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // Return the number of rows in the section.
        return self.tasks.count
    }
    
    
    override func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cellIdentifier = "taskCell"
        
        let cell: UITableViewCell = UITableViewCell(style: UITableViewCellStyle.Default, reuseIdentifier: cellIdentifier)
        
        var task: ILTask = self.tasks[indexPath.row] as ILTask
        
        cell.textLabel.text = task.description
        
        if task.done {
            cell.accessoryType = UITableViewCellAccessoryType.Checkmark
        } else {
            cell.accessoryType = UITableViewCellAccessoryType.None
        }
        
    
    return cell as UITableViewCell
    }
    
    override func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) {
    
        self.tableView.deselectRowAtIndexPath(indexPath, animated: false)
        
        var task: ILTask = self.tasks[indexPath.row] as ILTask
        
        task.done = !task.done
        
        tableView.reloadRowsAtIndexPaths([indexPath], withRowAnimation: UITableViewRowAnimation.None)
    }
    
    func addTask(task: ILTask) {
        self.tasks.addObject(task)
        self.tableView.reloadData()
    }

    
}
