//
//  SepetProtocols.swift
//  FoodApp
//
//  Created by Burak Özkan on 17.09.2022.
//

import Foundation

protocol ViewToPresenterSepetProtocol
{
    var sepetInteractor : PresenterToInteractorSepetProtocol? {get set}
    var sepetView : PresenterToViewSepetProtocol? {get set}
    
    func showAllSepet()
    func deleteAllSepet(sepet: FoodsDetail, kullanici_adi: String)
    func allDeleteItems(sepets : Array<FoodsDetail>)
    func showCount()
    
    
}

protocol PresenterToInteractorSepetProtocol
{
    var sepetPresenter : InteractorToPresenterSepetProtocol? {get set}
    
    func showSepet()
    func deleteSepet(sepet: FoodsDetail, kullanici_adi: String)
    func allDeleteItems(sepets : Array<FoodsDetail>)
    func showCount()
}

protocol InteractorToPresenterSepetProtocol
{
    func sendDataToPresenter(sepetList : Array<FoodsDetail>)
    func sendDataToPresenter(foodCount : Int)
}

protocol PresenterToViewSepetProtocol
{
    func sendDataToView(sepetList : Array<FoodsDetail>)
    func sendDataToView(foodCount : Int)
}

protocol PresenterToRouterSepetProtocol
{
    static func createModule(ref : SepetVC)
}
