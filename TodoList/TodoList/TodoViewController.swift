//
//  TodoViewController.swift
//  TodoList
//
//  Created by Sam Meech-Ward on 2020-05-14.
//  Copyright © 2020 meech-ward. All rights reserved.
//

import UIKit

protocol TodoViewControllerDelegate: AnyObject {
  func todoViewController(_ vc: TodoViewController, didSaveTodo todo: Todo)
}

class TodoViewController: UIViewController {
  

    
    @IBOutlet weak var descriptionfield: UITextField!
    @IBOutlet weak var textfield: UITextField!
    var todo: Todo?
  
  weak var delegate: TodoViewControllerDelegate?

  override func viewDidLoad() {
    super.viewDidLoad()

    textfield.text = todo?.title
    descriptionfield.text = todo?.description
  }
  
    @IBAction func save(_ sender: Any) {
       
            let todo = Todo(title: textfield.text!,description: descriptionfield.text!)
            delegate?.todoViewController(self, didSaveTodo: todo)
    }
}
