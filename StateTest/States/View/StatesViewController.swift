//
//  ViewController.swift
//  StateTest
//
//  Created by Saul Hamadani on 8/18/20.
//  Copyright © 2020 Saul Hamadani. All rights reserved.
//

import UIKit

class StatesViewController: UIViewController {
    //dependencies
    fileprivate let presenter: StatesPresenterType
    
    //subviews
    fileprivate let tableView = UITableView()
    
    init(presenter: StatesPresenterType) {
        self.presenter = presenter
        super.init(nibName: nil, bundle: nil)
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //configure tableView
        self.tableView.register(StateCell.self, forCellReuseIdentifier: "StateCell")
        
        //add subviews
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.tableView)
        
        //create constraints
        let views = ["tableView" : self.tableView]
        let tableViewCostraintsH = NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: [], metrics: nil, views: views)
        let tableViewCostraintsV = NSLayoutConstraint.constraints(withVisualFormat: "V:|[tableView]|", options: [], metrics: nil, views: views)
        
        //add constraints
        self.view.addConstraints(tableViewCostraintsH + tableViewCostraintsV)
        
        //hand off to presenter
        self.presenter.handleViewDidLoad()
    }
}


extension StatesViewController { //animations
    
}

extension StatesViewController { //appearance
    
}

extension StatesViewController { //delegation
    func set(tableViewDelegate: UITableViewDelegate) {
        self.tableView.delegate = tableViewDelegate
    }
    
    func set(tableViewDataSource: UITableViewDataSource) {
        self.tableView.dataSource = tableViewDataSource
    }
}
