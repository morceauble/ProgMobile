//
//  Todo.swift
//  TodoList
//
//  Created by Sam Meech-Ward on 2020-05-14.
//  Copyright © 2020 meech-ward. All rights reserved.
//

import Foundation

struct Todo {
  let title: String
  let isComplete: Bool
    let description: String
  
    init(title: String, isComplete: Bool = false,description:String) {
    self.title = title
    self.isComplete = isComplete
        self.description = description
  }
  
  func completeToggled() -> Todo {
    return Todo(title: title, isComplete: !isComplete,description: description)
  }
}
