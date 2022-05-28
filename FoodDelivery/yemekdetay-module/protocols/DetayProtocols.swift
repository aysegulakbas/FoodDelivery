//
//  DetayProtocols.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import Foundation

protocol ViewToPresenterDetayProtocol {
    var yemekDetayInteractor : PresenterToInteractorDetayProtocol? {get set}
    
    func postSepet(yemek: String, yemekResimAd: String, yemekFiyat: Int, yemekSiparisAdet: Int, userName: String)
   
    
    
}

protocol PresenterToInteractorDetayProtocol{
    
    func postSepetEkle(yemek: String, yemekResimAd: String, yemekFiyat: Int, yemekSiparisAdet: Int, userName: String)
}

protocol PresenterToRouterDetayProtocol {
    static func createModule(ref: YemekDetayVC)
}
