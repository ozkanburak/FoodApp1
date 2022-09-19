//
//  AnasayfaPresenter.swift
//  FoodApp
//
//  Created by Burak Özkan on 16.09.2022.
//

import Foundation
import Alamofire
import Firebase

class HomePresenter : ViewToPresenterHomePageProtocol
{
    var homepageInteractor: PresenterToInteractorHomaPageProtocol?
    
    var homepageView: PresenterToViewHomePageProtocol?
    
    func showFoods() {
        homepageInteractor?.showAllFoods()
    }
    
    func showFoodCount() {
        homepageInteractor?.showFoodCount()
    }
    
    
}
extension HomePresenter : InteractorToPresenterHomePageProtocol
{
    func sendDataToPresenter(foods: Array<Yemekler>) {
        homepageView?.sendDataToView(foods: foods)
    }
    
    func sendDataTopRresenter(foodCount: Int) {
        homepageView?.sendDataToView(foodCount: foodCount)
    }
    
}
