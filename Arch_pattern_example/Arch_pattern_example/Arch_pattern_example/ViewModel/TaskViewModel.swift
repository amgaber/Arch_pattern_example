//
//  TaskViewModel.swift
//  Arch_pattern_example
//
//  Created by Alaa Gaber on 24/11/2024.
//

import Foundation

class TaskViewModel {
    
    private let item: Item
    
    init(item: Item) {
        self.item = item
    }
    
    var name: String {
        item.name
    }
    
    var imageString: String {
        item.image
    }
   
    var species: Species {
        item.species
    }
    
    var numberofRows: Int {
        item.name.count
    }
}
