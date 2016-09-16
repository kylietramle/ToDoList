//
//  ViewController.swift
//  ToDoList
//
//  Created by Kylie Tram Le on 9/8/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate, AddToDoItemControllerDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var toDoList: NSMutableArray = ["Go get groceries", "Walk the dog", "Watch a movie", "Do my homework"]
    
    var completedToDoList: [Int:String] = [:]
    
    override func viewDidLoad() { // called the first time view is loaded
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
    }
    
    override func viewWillAppear(animated: Bool) { // called everytime view is loaded
        resetAccessoryType() // undo checkmark if screen is switched
    }
    

    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return toDoList.count ?? 0
    }
    
   
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("ToDoCell", forIndexPath: indexPath)
        cell.textLabel?.text = toDoList[indexPath.row] as! String
        
        return cell
    }
    
    // what is this for again?
    func numberOfSectionsInTableView(tableView: UITableView) -> Int {
        return 1
    }
    
    func addToDoItemToList(text:String) {
        toDoList[toDoList.count] = text // add new entry as the last item in dictionary
        
        tableView.reloadData()
    }
    
    func tableView(tableView: UITableView, didSelectRowAtIndexPath indexPath: NSIndexPath) { // row that was selected
        tableView.deselectRowAtIndexPath(indexPath, animated: true) // no highlight on select
        
        if let cell = tableView.cellForRowAtIndexPath(indexPath) {
            if cell.accessoryType == .None { // add checkmark
                cell.accessoryType = .Checkmark
                completedToDoList[completedToDoList.count] = toDoList[indexPath.row] as! String
                toDoList.removeObjectAtIndex(indexPath.row)
                
            } else {
                cell.accessoryType = .None
            }
        }
    }
    
    func resetAccessoryType() {
        for row in 0..<toDoList.count {
            // no index path, but have row
            if let cell = tableView.cellForRowAtIndexPath(NSIndexPath(forRow: row, inSection: 0)) {
                cell.accessoryType = .None
            }
        }
    }
    
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        if(segue.identifier == "AddToDoItemSegue") {
            let navigationController = segue.destinationViewController as! UINavigationController // the next controller over
            let addToDoItemViewController = navigationController.topViewController as! AddToDoItemController // get the next controller
        
            addToDoItemViewController.delegate = self
        } else if(segue.identifier == "CompletedToDoItemsSegue") {
            let completedToDoItemsController = segue.destinationViewController as! CompletedToDoItemsController
            completedToDoItemsController.completedToDoList = completedToDoList as! [Int:String]
        }
    }
}

