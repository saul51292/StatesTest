//
//  StatesWireframe.swift
//  StateTest
//
//  Created by Saul Hamadani on 8/18/20.
//  Copyright © 2020 Saul Hamadani. All rights reserved.
//

import Foundation
import UIKit

class StatesWireframe {
    init() {
        
    }
    
    func start() -> UIViewController {
        let interactor = StatesInteractor()
        let presenter = StatesPresenter(interactor: interactor)
        let viewController = StatesViewController(presenter: presenter)
        presenter.vc = viewController
        return viewController
    }
}
