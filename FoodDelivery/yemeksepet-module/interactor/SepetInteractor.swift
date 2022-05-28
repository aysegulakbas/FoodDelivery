//
//  SepetInteractor.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import Foundation


class SepetInteractor : PresenterToInteractorSepetProtocol {
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    func getSepet(userName: String) {
        var request = URLRequest(url: URL(string: x.Urls.getSepetAlUrl)!)
        request.httpMethod = "POST"
        
        let postString = "kullanici_adi=\(userName)"
        request.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: request){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
                    
            do{
                let cevap = try JSONDecoder().decode(SepetYemeklerCevap.self, from: data!)
                
                if let sepetYemekListesi = cevap.sepet_yemekler {
                    self.sepetPresenter?.presenteraVeriGonder(sepetYemekListesi: sepetYemekListesi )
                }
                else {
                    self.sepetPresenter?.presenteraVeriGonder(sepetYemekListesi: [])
                }
             }catch{print(error.localizedDescription)}
        }.resume()
    }
    
    func silSepet(sepet_yemek_id: Int, userName: String) {
        var request = URLRequest(url: URL(string: x.Urls.silSepettenUrl)!)
        request.httpMethod = "POST"
        
        let postString = "sepet_yemek_id=\(sepet_yemek_id)&kullanici_adi=\(userName)"
        request.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: request){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
                    
            do{
                let cevap = try JSONDecoder().decode(SepettenYemekSilmeCevap.self, from: data!)
                
                print(cevap)
                self.getSepet(userName: userName)
                
             }catch{print(error.localizedDescription)}
        }.resume()
    }
    
    
}
