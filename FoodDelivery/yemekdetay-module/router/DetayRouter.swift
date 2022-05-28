//
//  DetayRouter.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import Foundation

class DetayRouter: PresenterToRouterDetayProtocol {
   
    
    static func createModule(ref: YemekDetayVC) {
        ref.anasayfaPresenterNesnesi = DetayPesenter()
        
        ref.anasayfaPresenterNesnesi?.yemekDetayInteractor = DetayInteractor()
    }
    
    
    
}
