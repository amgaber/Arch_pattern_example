//
//  TaskListViewModel.swift
//  Arch_pattern_example
//
//  Created by Alaa Gaber on 24/11/2024.
//

import Foundation
class TaskListViewModel{
    
    let taskList: [Task] = [
        Task(name: "Alaa", description: "create MVVM"),
        Task(name: "Buy Groceries", description: "Milk, Bread, Eggs"),
        Task(name: "Workout", description: "Run 5km in the morning"),
        Task(name: "Read a Book", description: "Read 'Atomic Habits'")
    ]
    
    func  numberofRows() -> Int{
        taskList.count
    }
    
    //Get a TaskViewModel for a specific row
    func taskViewModel(at index: Int) -> TaskViewModel{
        TaskViewModel(task: taskList[index])
    }
    
}
