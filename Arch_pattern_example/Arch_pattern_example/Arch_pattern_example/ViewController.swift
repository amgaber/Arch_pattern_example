////
////  ViewController.swift
////  Yassir_test
////
////  Created by Alaa Gaber on 22/11/2024.
////
//
import UIKit

class ViewController: UIViewController, UITableViewDataSource, UITableViewDelegate {

    private let tableView = UITableView()
    private let viewModel  = TaskListViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        setupUI()
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


//class ViewController: UIViewController ,UITableViewDataSource,UITableViewDelegate{
//    
//    
//    @IBOutlet var tableView: UITableView!
////    @IBOutlet weak var activityIndicator: UIActivityIndicatorView!
//
////    var itemviewmodel = ItemViewModel()
//    var viewModel = ListViewModel()
//    
//    override func viewDidLoad() {
//        super.viewDidLoad()
//        tableView.dataSource = self
//        tableView.delegate = self
//        
//        viewModel.fetchData { result in
//            
//            switch result {
//            case .success:
//                DispatchQueue.main.async {
//                    self.tableView.reloadData()
////                    self.activityIndicator.stopAnimating()
//                }
//            case .failure(let error):
//                DispatchQueue.main.async {
//                    print(error.localizedDescription)
////                    self.activityIndicator.stopAnimating()
//                }
//            }
//        }
//        
//        
//        
//        
//        
////        let vc = UIHostingController(rootView: TestView(itemViewModel: itemviewmodel))
////        addChild(vc)
////        view.addSubview(vc.view)
////        vc.didMove(toParent: self)
////        vc.view.frame = view.bounds
//    }
//    
//    
//    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
//        viewModel.items.count
//    }
//    
//    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
////        let cell = tableView.dequeueReusableCell(withIdentifier:
////         "PostCell", for: indexPath)
////        let post = viewModel.items[indexPath.row]
////        cell.textLabel?.text = post.name
////        cell.detailTextLabel?.text = post.gender.rawValue
//        return UITableViewCell()
//    }
//}
//
