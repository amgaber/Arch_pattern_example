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
    var onLoadingState: ((Bool) -> Void)?

    //For paging
//    private var currentPage = 1
    
    private var isLoading = false
    var hasMorePages = true

    
    private var nextPageURL: String?
    private var prevPageURL: String?
    
    
    //Using "reset" for refreshing tableviewData , Using "append: Bool" to get the next page data
    func getCharacters(from url: URL, reset: Bool = false, append: Bool = false){
        
        guard !isLoading else { return }
        
        if reset {
            taskList.removeAll()
//            currentPage = 1
            hasMorePages = true
        }
        
        isLoading = true
        onLoadingState?(true)
        
        self.characterService.fetchTasksWithPaging(from: url) {[weak self] res in
            switch res {
                
            case .success(let apiResult):
                self?.isLoading = false
                self?.onLoadingState?(false)
                
                DispatchQueue.main.async {
                    if append {
                        self?.taskList.append(contentsOf: apiResult.results)
                    } else {
                        self?.taskList = apiResult.results
                    }
                    
                    self?.nextPageURL = apiResult.info.next
                    self?.prevPageURL = apiResult.info.prev
                    
                    //Check if there is next page for pagination
                    self?.hasMorePages = (self?.nextPageURL != nil)
                    
                    self?.onTasksUpdated?()
                }
            case .failure(let error):
                self?.isLoading = false
                self?.onLoadingState?(false)
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
    
    
    
    func fetchNextPage() {
        guard let nextPageURL = nextPageURL , let nextURL = URL(string: nextPageURL) else { return }
        getCharacters(from: nextURL, reset: false, append: true)
    }
    
    
    func filterByStatus(_ status: Status) {
        //fetch Task with basic URL without pagination
        guard let filterURL = Endpoint.characters(0, status.rawValue).url else { return }
        getCharacters(from: filterURL , reset: false , append: false)
    }
}
