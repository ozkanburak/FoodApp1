//
//  AnasayfaRouter.swift
//  FoodApp
//
//  Created by Burak Özkan on 16.09.2022.
//

import Foundation

class HomeRouter : PresenterToRouterHomePageProtocol
{
    static func createModule(ref: AnasayfaVC) {
        
        let pressenter = HomePresenter()
        ref.homepagePresenterOnject = pressenter
        ref.homepagePresenterOnject?.homepageInteractor = HomeInteractor()
        ref.homepagePresenterOnject?.homepageView = ref
        ref.homepagePresenterOnject?.homepageInteractor?.homepagePresenter = pressenter
    }
}
