//
//  NewsTableViewController.swift
//  NewsAppMVVM
//
//  Created by asher.enfj on 2022/01/24.
//

import Foundation
import UIKit
import RxSwift
import RxCocoa

class NewsTableViewController: UITableViewController {
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        self.navigationController?.navigationBar.prefersLargeTitles = true
    }
}


