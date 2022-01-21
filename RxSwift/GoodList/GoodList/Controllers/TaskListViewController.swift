//
//  TaskListViewController.swift
//  GoodList
//
//  Created by asher.enfj on 2022/01/21.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class TaskListViewController: UIViewController {
    
    @IBOutlet weak var prioritySegmentedControl: UISegmentedControl!
    @IBOutlet weak var tableView: UITableView!
    
    private var tasks = BehaviorRelay<[Task]>(value: []) // RxCocoa 쓰면 사용 가능
    private var filteredTasks = [Task]()
    
    let disposeBag = DisposeBag()
    
}

extension TaskListViewController {
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.prefersLargeTitles = true
        
    }
}


extension TaskListViewController: UITableViewDelegate, UITableViewDataSource {
    func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.filteredTasks.count
    }
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "TaskTableViewCell", for: indexPath)
        cell.textLabel?.text = self.filteredTasks[indexPath.row].title
        return cell
    }
}

extension TaskListViewController {
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        guard let navC = segue.destination as? UINavigationController,
              let addTVC = navC.viewControllers.first as? AddTaskViewController else {
                  fatalError("Controller not found...")
              }
        
        addTVC.taskSubjectObservable
            .subscribe(onNext: { [unowned self] task in
                
                let priority = Priority(rawValue: self.prioritySegmentedControl.selectedSegmentIndex - 1)
                
                var existingTasks = self.tasks.value
                existingTasks.append(task)
                
                self.tasks.accept(existingTasks)
                
                self.filterTasks(by: priority)
                
            }).disposed(by: disposeBag)
    }
}

extension TaskListViewController {
    
    @IBAction func priorityValueChanged(segmentedControl: UISegmentedControl) {
        
        let priority = Priority(rawValue: segmentedControl.selectedSegmentIndex - 1)
        
        filterTasks(by: priority)
        
    }
    
}


extension TaskListViewController {
    
    private func updateTableView() {
        DispatchQueue.main.async {
            self.tableView.reloadData()
        }
    }
    
    private func filterTasks(by prioirty: Priority?) {
        
        if prioirty == nil { // all 인 경우
            self.filteredTasks = self.tasks.value
            self.updateTableView()
        } else {
            
            self.tasks.map { tasks in
                return tasks.filter { $0.priority == prioirty! }
            }.subscribe(onNext: { [weak self] tasks in
                self?.filteredTasks = tasks
                //print(tasks)
                self?.updateTableView()
            }).disposed(by: disposeBag)
            
        }
        
    }
    
}
    
    
    


