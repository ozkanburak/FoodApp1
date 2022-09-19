//
//  GirisInteractor.swift
//  FoodApp
//
//  Created by Burak Özkan on 15.09.2022.
//

import Foundation
import Firebase

class LoginInteractor : PresenterToInteractorLoginProtocol
{
    func login(email: String, password: String) {
        let auth = Auth.auth()
        
        auth.signIn(withEmail: email, password: password) { [weak self] authResult, error in
            
        }
    }
    
    
}
