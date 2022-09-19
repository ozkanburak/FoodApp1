//
//  GirisPresenter.swift
//  FoodApp
//
//  Created by Burak Özkan on 15.09.2022.
//

import Foundation


class LoginPresenter : ViewToPresenterLoginProtocol
{
    var loginInteractor: PresenterToInteractorLoginProtocol?
    
    func loginAll(email: String, password: String) {
        loginInteractor?.login(email: email, password: password)
    }
    
}
