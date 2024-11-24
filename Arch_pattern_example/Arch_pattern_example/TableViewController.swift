//
//  ViewController.swift
//  Arch_pattern_example
//
//  Created by Alaa Gaber on 24/11/2024.
//

import UIKit

class TableViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let tableView = UITableView()
    private let viewModel  = TaskListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }

    private func setupUI() {
            title = "Tasks"
            view.backgroundColor = .white
            
            // Setup table view
            tableView.dataSource = self
            tableView.delegate = self
            tableView.register(TaskTableViewCell.self, forCellReuseIdentifier: TaskTableViewCell.identifier)
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.topAnchor.constraint(equalTo: view.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberofRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: TaskTableViewCell.identifier, for: indexPath) as? TaskTableViewCell else {  fatalError("Failed to dequeue TaskTableViewCell")
        }
            
            let taskViewModel = viewModel.taskViewModel(at: indexPath.row)
            cell.configure(with: taskViewModel)
            
            return cell
        }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let taskViewModel = viewModel.taskViewModel(at: indexPath.row)
        
        //TODO: in case we use coordinato
//        coordinator.showTaskDetails(with: taskViewModel)
        
        let detailsViewController = TaskDetailsViewController(viewModel: taskViewModel)
        
        navigationController?.pushViewController(detailsViewController, animated: true)
        
        
        
    }
    
}
