//
//  TaskViewModel.swift
//  Arch_pattern_example
//
//  Created by Alaa Gaber on 24/11/2024.
//

import Foundation

class TaskViewModel {
    
    private let task: Task
    
    init(task: Task) {
        self.task = task
    }
    
    var title: String {
        task.name
    }
    
    var description: String {
        task.description
    }
    
    var numberofrows: Int {
        task.name.count
    }
}
