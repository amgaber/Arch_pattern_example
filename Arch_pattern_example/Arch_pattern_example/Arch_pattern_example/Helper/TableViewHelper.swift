//
//  TableViewHelper.swift
//  Arch_pattern_example
//
//  Created by Alaa Gaber on 23/11/2024.
//

import Foundation
import UIKit
import SwiftUI

struct TableViewHelper{
    static func cellForIndexPath(_ indexPath: IndexPath, withIdentifier identifier: String, andViewModel viewModel: TaskListViewModel , in tableView: UITableView) -> UITableViewCell{
        
        tableView.register(UITableViewCell.self, forCellReuseIdentifier: identifier)
        let cell = tableView.dequeueReusableCell(withIdentifier: identifier, for: indexPath)
        cell.isEditing = true
        cell.contentConfiguration = UIHostingConfiguration {
            CellView(name: viewModel.taskViewModel(at: indexPath.row).name, imageURL: viewModel.taskViewModel(at: indexPath.row).imageString, species: viewModel.taskViewModel(at: indexPath.row).species)
        }
        
        return cell
    }
    
    static func detailView(with  viewModel: TaskViewModel) -> UIViewController {
        return UIHostingController(rootView:
                                    DetailView(
                                        name: viewModel.name,
                                        imageURL: viewModel.imageString,
                                        species: viewModel.species,
                                        status: viewModel.status.rawValue,
                                        location: viewModel.location.name,
                                        gender: viewModel.gender.rawValue))
    }
    
    static func progresView() -> UIViewController {
        return UIHostingController(rootView: ProgressSwiftUIView())
    }
}
