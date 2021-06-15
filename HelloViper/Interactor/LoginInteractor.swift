//
//  LoginInteractor.swift
//  HelloViper
//
//  Created by Pedro Henrique on 14/06/21.
//

import Foundation
import RxSwift

protocol LoginInteractorOutput: AnyObject { //Presenter
    func userDidLogin(user: User)
    func errorOccured(error: Error?)
}


protocol LoginInteractorInput: AnyObject { //Ponteiro strong do Presenter
    func loginWith(username: String, and password: String)
}

class LoginInteractor {
    
    weak var output: LoginInteractorOutput?
    let dispose = DisposeBag()

    
}

extension LoginInteractor: LoginInteractorInput {
    
    func loginWith(username: String, and password: String) {
        if (username == "admin" && password == "123456") {
            LoginClient.getUser(by: 3)
                .subscribe { [weak self = self] event in
                    if let user = event.element {
                        self?.output?.userDidLogin(user: user)
                    }
                    if let error = event.error {
                        self?.output?.errorOccured(error: error)
                    }
                }
                .disposed(by: dispose)
        }
    }
}
