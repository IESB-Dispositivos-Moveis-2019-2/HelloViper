//
//  LoginRouter.swift
//  HelloViper
//
//  Created by Pedro Henrique on 14/06/21.
//

import UIKit

class LoginRouter {
    
    let view = LoginViewController(nibName: "LoginViewController", bundle: Bundle.main)
    let interactor = LoginInteractor()
    let presenter = LoginPresenter()
    
    init() {
        view.presenter = presenter
        presenter.view = view
        presenter.interactor = interactor
        interactor.output = presenter
    }
    
    func present(on window: UIWindow) {
        window.rootViewController = view
    }
    
}
