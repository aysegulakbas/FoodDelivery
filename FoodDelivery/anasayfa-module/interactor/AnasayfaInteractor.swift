//
//  AnasayfaInteractor.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import Foundation

class AnasayfaInteractor: PresenterToInteractorAnasayfaProtocol {
    var anasayfaPresenter: InteractorToPresenterAnasayfaProtocol?
    var anasayfaView: PresenterToViewAnasayfaProtocol?
    
    func tumYemekleriAl(){
   
        let url = URL(string: x.Urls.tumYemekleriAlUrl)!
                
    URLSession.shared.dataTask(with: url){ data,response,error in
        if error != nil || data == nil {
                print("Hata")
                return
            }
                    
        do{
            let cevap = try JSONDecoder().decode(YemeklerCevap.self, from: data!)
            if let liste = cevap.yemekler {
                self.anasayfaPresenter?.presenteraVeriGonder(yemeklerListesi: liste)
            }
             }catch{
            print(error.localizedDescription)
                 
             }
        
    }.resume()
     
       
    
}
    
}
