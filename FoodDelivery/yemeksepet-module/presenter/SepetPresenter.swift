//
//  SepetPresenter.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import Foundation

class SepetPresenter : ViewToPresenterSepetProtocol {
    func getYemekSepet(userName: String) {
        sepetInteractor?.getSepet(userName: userName)
    }
    
    func silYemekSepet(sepet_yemek_id: Int, userName: String) {
        sepetInteractor?.silSepet(sepet_yemek_id: sepet_yemek_id, userName: userName)
    }
    
    var sepetView: PresenterToViewSepetProtocol?
    var sepetInteractor: PresenterToInteractorSepetProtocol?
    
    
    
    
}

extension SepetPresenter: InteractorToPresenterSepetProtocol {
    func presenteraVeriGonder(sepetYemekListesi: Array<SepetYemekler>) {
        sepetView?.vieweVeriGonder(sepetYemekListesi: sepetYemekListesi)
    }
    
    
}
