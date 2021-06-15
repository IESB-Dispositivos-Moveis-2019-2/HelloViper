//
//  LoginClient.swift
//  HelloViper
//
//  Created by Pedro Henrique on 14/06/21.
//

import Foundation
import RxSwift
import RxAlamofire

struct LoginClient {
    
    static let kBaseURL = "https://jsonplaceholder.typicode.com"
    
    static func getUser(by id: Int) -> Observable<User> {
        return RxAlamofire.requestDecodable(.get, "\(kBaseURL)/users/\(id)")
            .map { (response, user: User) in
                return user
            }
        
    }
    
    
}
