//
//  AnasayfaRouter.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import Foundation

class AnasayfaRouter: PresenterToRouterAnasayfaProtocol {
  
    static func createModule(ref: AnasayfaVC) {
        let presenter = AnasayfaPresenter()
        
        //View
        ref.anasayfaPresenterNesnesi = presenter
        //PResenter
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor = AnasayfaInteractor()
        ref.anasayfaPresenterNesnesi?.anasayfaView = ref
        ref.anasayfaPresenterNesnesi?.anasayfaInteractor?.anasayfaPresenter = presenter
        
    }
    
}
