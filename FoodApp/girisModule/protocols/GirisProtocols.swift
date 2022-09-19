//
//  GirisProtocols.swift
//  FoodApp
//
//  Created by Burak Özkan on 15.09.2022.
//

import Foundation

//Ana protokol
protocol ViewToPresenterLoginProtocol
{
    var loginInteractor : PresenterToInteractorLoginProtocol? {get set}
    func loginAll(email : String, password : String )
}

protocol PresenterToInteractorLoginProtocol
{
    func login(email : String, password : String )
}

protocol PresenterToRouter
{
    static func createModule(ref:GirisVC)
}
