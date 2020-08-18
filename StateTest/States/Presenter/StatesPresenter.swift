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
    weak var vc: StatesViewController?
    fileprivate let interactor: StatesInteractorType
    
    init(interactor: StatesInteractorType) {
        self.interactor = interactor
    }
}

extension StatesPresenter: StatesPresenterType {
    func handleViewDidLoad() {
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
