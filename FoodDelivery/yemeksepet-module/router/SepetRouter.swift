//
//  SepetRouter.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import Foundation

class SepetRouter : PresenterToRouterSepetProtocol {
    static func createModule(ref: YemekSepetVC) {
        let presenter = SepetPresenter()
        
        ref.sepetPresenterNesnesi = presenter
        ref.sepetPresenterNesnesi?.sepetInteractor = SepetInteractor()
        ref.sepetPresenterNesnesi?.sepetView = ref
        
        ref.sepetPresenterNesnesi?.sepetInteractor?.sepetPresenter = presenter 
    }
    
    
    
}
