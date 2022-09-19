//
//  DetayRouter.swift
//  FoodApp
//
//  Created by Burak Özkan on 16.09.2022.
//

import Foundation

class FoodDetailRouter : PresenterToRouterFoodDetailProtocol
{
    static func createModule(ref: DetayVC) {
        ref.foodDetailPresenterObject = FoodDetailPresenter()
        ref.foodDetailPresenterObject?.foodDetailInteractor = FoodDetailInteractor()
    }
}
