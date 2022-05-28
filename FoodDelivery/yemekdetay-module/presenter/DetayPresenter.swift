//
//  DetayPresenter.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import Foundation

class DetayPesenter : ViewToPresenterDetayProtocol {
    
    var yemekDetayInteractor: PresenterToInteractorDetayProtocol?
    
    func postSepet(yemek: String, yemekResimAd: String, yemekFiyat: Int, yemekSiparisAdet: Int, userName: String) {
        yemekDetayInteractor?.postSepetEkle(yemek: yemek, yemekResimAd: yemekResimAd, yemekFiyat: yemekFiyat, yemekSiparisAdet: yemekSiparisAdet, userName: userName)
    }
    
    

    
}
