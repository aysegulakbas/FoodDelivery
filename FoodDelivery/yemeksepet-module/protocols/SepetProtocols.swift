//
//  SepetProtocols.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import Foundation

protocol ViewToPresenterSepetProtocol {
    
    var sepetInteractor: PresenterToInteractorSepetProtocol? {get set}
    var sepetView: PresenterToViewSepetProtocol? {get set}
    
    func getYemekSepet(userName: String)
    func silYemekSepet(sepet_yemek_id: Int, userName: String)
    
}

protocol PresenterToInteractorSepetProtocol{
    var sepetPresenter: InteractorToPresenterSepetProtocol? {get set}
    
    func getSepet(userName: String)
    func silSepet(sepet_yemek_id: Int, userName: String)
}

protocol InteractorToPresenterSepetProtocol{
     func presenteraVeriGonder(sepetYemekListesi: Array<SepetYemekler> )
}


protocol PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetYemekListesi: Array<SepetYemekler>)
}


protocol PresenterToRouterSepetProtocol{
    static func createModule(ref: YemekSepetVC)
}


// Burada tasıyıcı protocoller olacak muhtemelen buna tekrar yarın bi bak.

