//
//  StatesPresenter.swift
//  StateTest
//
//  Created by Saul Hamadani on 8/18/20.
//  Copyright © 2020 Saul Hamadani. All rights reserved.
//

import Foundation
import UIKit

class StatesPresenter: NSObject {
    //dependencies
    weak var vc: StatesViewController?
    fileprivate let interactor: StatesInteractorType
    
    //private state
    fileprivate var mode: AppearanceMode = .light
    
    init(interactor: StatesInteractorType) {
        self.interactor = interactor
    }
}

private extension StatesPresenter {
    @objc func handleDarkMode() {
        let newMode: AppearanceMode = {
            switch self.mode {
            case .light:        return .dark
            case .dark:         return .light
            }
        }()
        self.mode = newMode
        self.vc?.configure(mode: newMode)
        UserDefaults.standard.set(newMode == .dark, forKey: "isDarkMode")
    }
}

extension StatesPresenter: StatesPresenterType {
    func handleViewDidLoad() {
        let isDarkMode = UserDefaults.standard.bool(forKey: "isDarkMode")
        self.mode = isDarkMode ? .dark : .light
        self.vc?.configure(mode: isDarkMode ? .dark : .light)
        
        self.vc?.set(darkModeTarget: self,
                     action: #selector(StatesPresenter.handleDarkMode))
        self.vc?.set(tableViewDataSource: self)
        self.vc?.set(tableViewDelegate: self)
    }
}

extension StatesPresenter: UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.interactor.states.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "StateCell") else { return UITableViewCell() }
        cell.textLabel?.text = self.interactor.states[indexPath.row].name
        switch self.mode {
        case .dark:
            cell.backgroundColor = .black
            cell.textLabel?.textColor = .white
        case .light:
            cell.backgroundColor = .white
            cell.textLabel?.textColor = .black
        }
        return cell
    }
}

extension StatesPresenter: UITableViewDelegate {
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: true)
        let abbreviation = self.interactor.states[indexPath.row].abbreviation
        let name = self.interactor.states[indexPath.row].name
        let alertController = UIAlertController(title: "What's the abbreviation for \(name)?", message: "It's \(abbreviation)!", preferredStyle: .alert)
        let okAction = UIAlertAction(title: "OK", style: .default, handler: nil)
        alertController.addAction(okAction)
        self.vc?.present(alertController, animated: true, completion: nil)
    }
}
