//
//  AnasayfaProtocols.swift
//  FoodApp
//
//  Created by Burak Özkan on 16.09.2022.
//

import Foundation

protocol ViewToPresenterHomePageProtocol // Presenter
{
    var homepageInteractor : PresenterToInteractorHomaPageProtocol? {get set}
    var homepageView : PresenterToViewHomePageProtocol? {get set}
    
    func showFoods()
    func showFoodCount()
}

protocol PresenterToInteractorHomaPageProtocol //Interactor
{
    var homepagePresenter : InteractorToPresenterHomePageProtocol? {get set}
    
    func showAllFoods()
    func showFoodCount()
}

protocol InteractorToPresenterHomePageProtocol
{
    func sendDataToPresenter(foods : Array<Yemekler>)
    func sendDataTopRresenter(foodCount : Int)
}

protocol PresenterToViewHomePageProtocol
{
    func sendDataToView(foods : Array<Yemekler>)
    func sendDataToView(foodCount : Int)
}

protocol PresenterToRouterHomePageProtocol
{
    static func createModule(ref : AnasayfaVC)
}

