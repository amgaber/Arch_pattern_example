//
//  ViewController.swift
//  Arch_pattern_example
//
//  Created by Alaa Gaber on 22/11/2024.
//

import UIKit
import SwiftUI

class ViewController: UIViewController {

    private let tableView = UITableView()
    private var viewModel  = TaskListViewModel()

    private var filterView = FilterButtonsView()
    
    private lazy var tableViewDataSource: TableDataSource = .init(viewModel: viewModel)
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
        setupUI()
        setUpNavigationBarForSorting()
        
        // Bind ViewModel updates
        viewModel.onTasksUpdated = { [weak self] in
            DispatchQueue.main.async {
                self?.setUpProgressView(false)
                self?.setupUI()

            }
            self?.tableView.reloadData()
        }
        
        viewModel.onLoadingState = { [weak self] isLoading in
            DispatchQueue.main.async {
                self?.setUpProgressView(isLoading)

            }
        }
        
        tableViewDataSource.onPushDelegation = { [weak self] task in
//            let vc = TaskDetailsViewController(task: task)
            self?.navigationController?.pushViewController(task, animated: true)
        }
        
        //fetch Task with basic URL without pagination
        guard let baseURL = Endpoint.characters(0, "").url else { return }
        viewModel.getCharacters(from: baseURL , reset: false , append: false)
        
    }

    private func setUpNavigationBarForSorting() {
        navigationItem.rightBarButtonItem = UIBarButtonItem(barButtonSystemItem: .refresh, target: self, action: #selector(refreshTapped))
    }
    
    @objc private func refreshTapped(){
        //fetch Task reset = true for refresh list
        guard let baseURL = Endpoint.characters(0, "").url else { return }
        viewModel.getCharacters(from: baseURL , reset: true , append: false)
        
        tableView.reloadData()
    }
    
//    //event fired by Filter swiftui buttons
//    func dispatch(_ action: Status) {
//        print("Action: \(action)")
//        viewModel.filterByStatus(action)
//    }
        
    private func setupUI() {
            title = "Characters"
            view.backgroundColor = .white
            
            // Setup table view
            tableView.dataSource = tableViewDataSource
            tableView.delegate = tableViewDataSource
            view.addSubview(tableView)
            tableView.translatesAutoresizingMaskIntoConstraints = false
            
            NSLayoutConstraint.activate([
                tableView.leadingAnchor.constraint(equalTo: view.leadingAnchor),
                tableView.trailingAnchor.constraint(equalTo: view.trailingAnchor),
                tableView.topAnchor.constraint(equalTo: view.safeAreaLayoutGuide.topAnchor),
                tableView.bottomAnchor.constraint(equalTo: view.bottomAnchor)
            ])
        }
    
        func setUpProgressView(_ isloading: Bool) {
            let progress = TableViewHelper.progresView()
            progress.didMove(toParent: self)
            progress.view.frame = view.bounds
            
            var overlay : UIView? // This should be a class variable
            overlay = UIView(frame: view.frame)
            overlay!.backgroundColor = .black
            overlay!.alpha = 0.8
            overlay?.addSubview(progress.view)
            view.addSubview(overlay!)
            if isloading {
                view.addSubview(overlay!)
            }else {
                overlay?.removeFromSuperview()
            }
        }
}

class TableDataSource: NSObject, UITableViewDataSource, UITableViewDelegate {
    let viewModel: TaskListViewModel
    var onPushDelegation:((TaskDetailsViewController) -> Void)?

    init( viewModel: TaskListViewModel) {
        self.viewModel = viewModel
        
    }

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        viewModel.numberofRows()
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  TableViewHelper.cellForIndexPath(indexPath, withIdentifier: CellView.identifier, andViewModel: viewModel, in: tableView)
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        
        let taskViewModel = viewModel.taskViewModel(at: indexPath.row)
        
        //TODO: in case we use coordinato
//        coordinator.showTaskDetails(with: taskViewModel)
        
        let detailsViewController = TaskDetailsViewController(viewModel: taskViewModel)
        onPushDelegation?(detailsViewController)
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        UITableView.automaticDimension
    }
    
    //put filter buttons in tableview header section
    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
       
        let filter = UIHostingController(rootView: FilterButtonsView(dispatch: self.dispatch))
        let headerView = UIView(frame: CGRect(x: 0, y: 0, width: tableView.frame.width, height: 100))
        filter.view.frame = headerView.bounds

        headerView.addSubview(filter.view)
        headerView.translatesAutoresizingMaskIntoConstraints = false
        return headerView
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        100
    }
    
    //show next page on scrollTo the end of table -it shows only 20 items for each page.
    func scrollViewDidScroll(_ scrollView: UIScrollView) {
        let offset = scrollView.contentOffset.y
        let height = scrollView.frame.height
        let contentHeight = scrollView.contentSize.height
        
        if offset >= contentHeight - height {
            if viewModel.hasMorePages {
                viewModel.fetchNextPage()
            }
        }
    }
  
    
    //event fired by Filter swiftui buttons
    func dispatch(_ action: Status) {
        print("Action: \(action)")
        viewModel.filterByStatus(action)
    }
    
}
