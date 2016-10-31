//
//  AddToDoItemController.swift
//  ToDoList
//
//  Created by Kylie Tram Le on 9/9/16.
//  Copyright © 2016 Kylie Tram Le. All rights reserved.
//

import UIKit

protocol AddToDoItemControllerDelegate: class {
    func addItemToList(text:String)
}

class AddToDoItemController: UIViewController {

    @IBOutlet weak var toDoItemField: UITextField!
    
    weak var delegate: AddToDoItemControllerDelegate?
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }

    @IBAction func cancelButtonPressed(sender: AnyObject) {
        self.dismissViewControllerAnimated(true, completion: nil)
    }

    @IBAction func saveButtonPressed(sender: AnyObject) {
        if toDoItemField.text!.isEmpty || toDoItemField.text!.characters.first == " " {
            self.dismissViewControllerAnimated(true, completion: nil)
        } else {
            delegate?.addItemToList(toDoItemField.text!)
            self.dismissViewControllerAnimated(true, completion: nil)
        }
    }
}
