//
//  CompletedToDoItemsController.swift
//  ToDoList
//
//  Created by Kylie Tram Le on 9/15/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.
//

import UIKit

class CompletedToDoItemsController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    @IBOutlet weak var tableView: UITableView!
    
    var completedToDoList: [Int:String] = [:]
    
    override func viewDidLoad() {
        super.viewDidLoad()

        tableView.delegate = self
        tableView.dataSource = self
    }
    
    func tableView(tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return completedToDoList.count ?? 0
    }
    
    
    func tableView(tableView: UITableView, cellForRowAtIndexPath indexPath: NSIndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCellWithIdentifier("CompletedToDoItemCell", forIndexPath: indexPath)
        cell.textLabel?.font = UIFont(name: "Noteworthy", size: 24)
        cell.textLabel?.text = completedToDoList[indexPath.row]
        
        return cell
    }



}
