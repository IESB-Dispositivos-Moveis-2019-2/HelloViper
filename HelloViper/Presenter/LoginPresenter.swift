//
//  LoginPresenter.swift
//  HelloViper
//
//  Created by Pedro Henrique on 14/06/21.
//

import Foundation
import RxSwift
import RxCocoa
import RxSwiftExt

protocol LoginPresenterToView: AnyObject {
    
    var authenticatedUser: Observable<User> { get }
    
    func viewDidLoad()
    
}


class LoginPresenter {
    
    weak var view: LoginViewToPresenter?
    
    var interactor: LoginInteractorInput?
    
    let dispose = DisposeBag()
    
    var user = BehaviorRelay<User?>(value: nil)
    
    func bind() {
        if let view = self.view {
            view.credentials
                .debounce(DispatchTimeInterval.seconds(3), scheduler: MainScheduler.instance)
                .bind { [weak self] (username, password) in
//                    let (username, password) = credentials
                    view.setLoading(true)
                    self?.interactor?.loginWith(username: username, and: password)
                }
                .disposed(by: dispose)
        }
    }
    
    
}

extension LoginPresenter: LoginPresenterToView {
    
    var authenticatedUser: Observable<User> {
        return user.asObservable().unwrap()
    }
    
    func viewDidLoad() {
        bind()
    }
    
    
}

extension LoginPresenter: LoginInteractorOutput {
    
    func userDidLogin(user: User) {
        view?.setLoading(false)
        self.user.accept(user)
    }
    
    func errorOccured(error: Error?) {
        view?.setLoading(false)
        debugPrint(error ?? "Deu erro")
    }
    
}
