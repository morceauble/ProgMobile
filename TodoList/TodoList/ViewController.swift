//
//  ViewController.swift
//  TodoList
//
//  Created by Sam Meech-Ward on 2020-05-14.
//  Copyright © 2020 meech-ward. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
  
  var todos = [
    Todo(title: "Acheter carotte",description: "et vendre un 0"),
    Todo(title: "Fondre oignon",description: "et hacher steak"),
    Todo(title: "Jeter poireaux",description: "tmtc"),
  ]

  @IBOutlet weak var tableView: UITableView!
  override func viewDidLoad() {
    super.viewDidLoad()
    // Do any additional setup after loading the view.
  }

  @IBAction func startEditing(_ sender: Any) {
    tableView.isEditing = !tableView.isEditing
  }
  
    @IBAction func addTache(_ unwindSegue: UIStoryboardSegue) {
        let vc = unwindSegue.source as! TodoViewController
        if(vc.textfield.text != "" && vc.descriptionfield.text != ""){
            todos.append(Todo(title: vc.textfield.text!, description: vc.descriptionfield.text!));
            
            tableView.reloadData()
        // Use data from the view controller which initiated the unwind segue
    }
    }
    
    @IBSegueAction func todoViewcontroller(_ coder: NSCoder) -> TodoViewController? {
        
        let vc = TodoViewController(coder: coder)
            
            if let indexpath = tableView.indexPathForSelectedRow {
              let todo = todos[indexpath.row]
              vc?.todo = todo
            }
            
            vc?.delegate = self
            vc?.presentationController?.delegate = self
            
            return vc
    }
    
  
}

extension ViewController: UITableViewDelegate {
  
  func tableView(_ tableView: UITableView, leadingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
    
    let action = UIContextualAction(style: .normal, title: "Complete") { action, view, complete in
      
      let todo = self.todos[indexPath.row].completeToggled()
      self.todos[indexPath.row] = todo
      
      let cell = tableView.cellForRow(at: indexPath) as! CheckTableViewCell
      cell.set(checked: todo.isComplete)
      
      complete(true)
      
      print("complete")
    }
    
    return UISwipeActionsConfiguration(actions: [action])
  }
  
  func tableView(_ tableView: UITableView, editingStyleForRowAt indexPath: IndexPath) -> UITableViewCell.EditingStyle {
    return .delete
  }
  
}




extension ViewController: UITableViewDataSource {

  
  func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
    return todos.count
  }
  
  func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
    
    let cell = tableView.dequeueReusableCell(withIdentifier: "checked cell", for: indexPath) as! CheckTableViewCell
    
    cell.delegate = self
    
    let todo = todos[indexPath.row]
    
    cell.set(title: todo.title, checked: todo.isComplete)
    
    return cell
  }
  
  func tableView(_ tableView: UITableView, commit editingStyle: UITableViewCell.EditingStyle, forRowAt indexPath: IndexPath) {
    if editingStyle == .delete {
      todos.remove(at: indexPath.row)
      tableView.deleteRows(at: [indexPath], with: .automatic)
    }
  }
  
  func tableView(_ tableView: UITableView, moveRowAt sourceIndexPath: IndexPath, to destinationIndexPath: IndexPath) {
    let todo = todos.remove(at: sourceIndexPath.row)
    todos.insert(todo, at: destinationIndexPath.row)
  }
  
}

extension ViewController: CheckTableViewCellDelegate {
  
  func checkTableViewCell(_ cell: CheckTableViewCell, didChagneCheckedState checked: Bool) {
    guard let indexPath = tableView.indexPath(for: cell) else {
      return
    }
    let todo = todos[indexPath.row]
    let newTodo = Todo(title: todo.title, isComplete: checked,description: todo.description)
    
    todos[indexPath.row] = newTodo
  }
  
}

extension ViewController: TodoViewControllerDelegate {
  
  func todoViewController(_ vc: TodoViewController, didSaveTodo todo: Todo) {
    
    
    
    dismiss(animated: true) {
      if let indexPath = self.tableView.indexPathForSelectedRow {
        // pour modifier la tache
        self.todos[indexPath.row] = todo
        self.tableView.reloadRows(at: [indexPath], with: .none)
      }
        
        
      }
    }
  
  }


extension ViewController: UIAdaptivePresentationControllerDelegate {
  
  func presentationControllerDidDismiss(_ presentationController: UIPresentationController) {
    if let indexPath = tableView.indexPathForSelectedRow {
      tableView.deselectRow(at: indexPath, animated: true)
    }
  }
  
}