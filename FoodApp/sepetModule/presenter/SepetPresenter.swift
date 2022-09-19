//
//  SepetPresenter.swift
//  FoodApp
//
//  Created by Burak Özkan on 17.09.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol
{
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
    var sepetView: PresenterToViewSepetProtocol?
    
    func showAllSepet() {
        sepetInteractor?.showSepet()
    }
    func deleteAllSepet(sepet: FoodsDetail, kullanici_adi: String) {
        sepetInteractor?.deleteSepet(sepet: sepet, kullanici_adi: kullanici_adi)
    }
    func allDeleteItems(sepets: Array<FoodsDetail>) {
        sepetInteractor?.allDeleteItems(sepets: sepets)
    }
    func showCount() {
        sepetInteractor?.showCount()
    }
    
    
}

extension SepetPresenter : InteractorToPresenterSepetProtocol
{
    func sendDataToPresenter(foodCount: Int) {
        sepetView?.sendDataToView(foodCount: foodCount)
    }
    
 
    
    func sendDataToPresenter(sepetList: Array<FoodsDetail>) {
        sepetView?.sendDataToView(sepetList: sepetList)
    }
    
    
}
