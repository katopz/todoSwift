//
//  ILNewTaskViewController.swift
//  SingleTodo
//
//  Created by Abraham Kuri on 6/3/14.
//  Copyright (c) 2014 Icalia Labs. All rights reserved.
//

import UIKit

class ILNewTaskViewController: UIViewController {

    @IBOutlet var taskDescriptionTextField : UITextField?
    var todoVC: ILTodoTableViewController = ILTodoTableViewController()

    
    required init(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
    }
    
    override init() {
        super.init(nibName: "ILNewTaskViewController", bundle: nil)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }


    @IBAction func addTaskButtonPressed(sender : AnyObject) {
        var task: ILTask = ILTask(description: self.taskDescriptionTextField!.text)
        task.done = false
        
        self.todoVC.addTask(task)
        
        self.navigationController!.popViewControllerAnimated(true)
    }
    /*
    // #pragma mark - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue?, sender: AnyObject?) {
        // Get the new view controller using [segue destinationViewController].
        // Pass the selected object to the new view controller.
    }
    */

}
