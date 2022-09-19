//
//  KayitRouter.swift
//  FoodApp
//
//  Created by Burak Özkan on 16.09.2022.
//

import Foundation

class RegisterRouter : PresenterToRouterRegisterProtocol
{
    static func createModule(ref: KayitVC) {
        ref.kayitPresneterObject = RegisterPresenter()
        ref.kayitPresneterObject?.registerInteractor = RegisterInteractor()
    }
}
