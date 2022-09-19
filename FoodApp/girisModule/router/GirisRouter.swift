//
//  GirisRouter.swift
//  FoodApp
//
//  Created by Burak Özkan on 15.09.2022.
//

import Foundation

class LoginRouter : PresenterToRouter
{
    static func createModule(ref: GirisVC) {
        ref.girisPresenterObject = LoginPresenter()
        ref.girisPresenterObject?.loginInteractor = LoginInteractor()
    }
    
}

