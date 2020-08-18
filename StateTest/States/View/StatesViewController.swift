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
    fileprivate let darkModeButton = UIButton(type: .system)
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
        self.view.backgroundColor = .white
        
        //configure dark mode button
        self.darkModeButton.layer.cornerRadius = 10.0
        self.darkModeButton.layer.masksToBounds = true
        
        //configure tableView
        self.tableView.register(StateCell.self, forCellReuseIdentifier: "StateCell")
        
        //add subviews
        self.darkModeButton.translatesAutoresizingMaskIntoConstraints = false
        self.tableView.translatesAutoresizingMaskIntoConstraints = false
        self.view.addSubview(self.darkModeButton)
        self.view.addSubview(self.tableView)
        
        //create constraints
        let views = ["button" : self.darkModeButton,
                     "tableView" : self.tableView]
        let buttonCostraintsH = NSLayoutConstraint.constraints(withVisualFormat: "H:|-16-[button]-16-|", options: [], metrics: nil, views: views)
        let buttonCostraintsV = NSLayoutConstraint.constraints(withVisualFormat: "V:|-32-[button]", options: [], metrics: nil, views: views)
        let tableViewCostraintsH = NSLayoutConstraint.constraints(withVisualFormat: "H:|[tableView]|", options: [], metrics: nil, views: views)
        let tableViewCostraintsV = NSLayoutConstraint.constraints(withVisualFormat: "V:[button]-16-[tableView]|", options: [], metrics: nil, views: views)
        
        //add constraints
        self.view.addConstraints(buttonCostraintsH + buttonCostraintsV)
        self.view.addConstraints(tableViewCostraintsH + tableViewCostraintsV)
        
        //hand off to presenter
        self.presenter.handleViewDidLoad()
    }
}


extension StatesViewController { //animations
    
}

extension StatesViewController { //appearance
    func configure(mode: AppearanceMode) {
        switch mode {
        case .dark:
            self.view.backgroundColor = .black
            self.tableView.backgroundColor = .black
            self.darkModeButton.backgroundColor = .white
            self.darkModeButton.setTitleColor(.black, for: .normal)
            self.darkModeButton.setTitle("Enable Light Mode", for: .normal)
            
        case .light:
            self.view.backgroundColor = .white
            self.tableView.backgroundColor = .white
            self.darkModeButton.backgroundColor = .black
            self.darkModeButton.setTitleColor(.white, for: .normal)
            self.darkModeButton.setTitle("Enable Dark Mode", for: .normal)
        }
        
        self.tableView.reloadData()
    }
}

extension StatesViewController { //delegation
    func set(darkModeTarget: Any?, action: Selector) {
        self.darkModeButton.addTarget(darkModeTarget,
                                      action: action,
                                      for: .touchUpInside)
    }
    
    func set(tableViewDelegate: UITableViewDelegate) {
        self.tableView.delegate = tableViewDelegate
    }
    
    func set(tableViewDataSource: UITableViewDataSource) {
        self.tableView.dataSource = tableViewDataSource
    }
}


enum AppearanceMode {
    case dark
    case light
}
