//
//  AnasayfaProtocols.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import Foundation

// Ana Protocoller
// View -> Presenter -> Interactor

protocol ViewToPresenterAnasayfaProtocol {
    var anasayfaInteractor : PresenterToInteractorAnasayfaProtocol? {get set}
    var anasayfaView : PresenterToViewAnasayfaProtocol? {get set}
    
    func yemekleriYukle()
    
}

protocol PresenterToInteractorAnasayfaProtocol{
    var anasayfaPresenter : InteractorToPresenterAnasayfaProtocol? {get set}
    
    func tumYemekleriAl() 
    
    
}


//Taşıyıcı Protocoller

protocol InteractorToPresenterAnasayfaProtocol{
    func presenteraVeriGonder(yemeklerListesi: Array<Yemekler>)
}

protocol PresenterToViewAnasayfaProtocol{
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>)}

//Router Protocol

protocol PresenterToRouterAnasayfaProtocol{
    static func createModule(ref: AnasayfaVC)
}
