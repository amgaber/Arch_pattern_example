//
//  TaskListViewModel.swift
//  Arch_pattern_example
//
//  Created by Alaa Gaber on 24/11/2024.
//

import UIKit
class TaskListViewModel{
   
    private var taskList: [Item] = []
    
    private let characterService = CharactersFetchService()
    
    var onTasksUpdated:(() -> Void)?
    

    func getCharacters(){
        
        self.characterService.fetchTasks { res in
            switch res {
            case .success(let items):
                DispatchQueue.main.async {
                    self.taskList.append(contentsOf: items)

                    self.onTasksUpdated?()
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    print(error.localizedDescription)
                }
            }
        }
    }

    func  numberofRows() -> Int{
        taskList.count
    }
    
    //Get a TaskViewModel for a specific row
    func taskViewModel(at index: Int) -> TaskViewModel{
        TaskViewModel(item: taskList[index])
    }
}
