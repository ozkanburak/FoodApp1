//
//  SepetRouter.swift
//  FoodApp
//
//  Created by Burak Özkan on 17.09.2022.
//

import Foundation

class SepetRouter : PresenterToRouterSepetProtocol
{
    static func createModule(ref: SepetVC) {
        
        let presenter = SepetPresenter()
        ref.sepetPresenterObject = presenter
        ref.sepetPresenterObject?.sepetInteractor = SepetInteractor()
        ref.sepetPresenterObject?.sepetView = ref
        ref.sepetPresenterObject?.sepetInteractor?.sepetPresenter = presenter
        
    }
}
