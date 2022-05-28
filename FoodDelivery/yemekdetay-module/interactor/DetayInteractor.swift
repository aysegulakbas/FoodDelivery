//
//  DetayInteractor.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import Foundation

class DetayInteractor : PresenterToInteractorDetayProtocol {
    func postSepetEkle(yemek: String, yemekResimAd: String, yemekFiyat: Int, yemekSiparisAdet: Int, userName: String) {
        
        var request = URLRequest(url: URL(string: x.Urls.postSepetEkleUrl)!)
        request.httpMethod = "POST"
        
        let postString = "yemek_adi=\(yemek)&yemek_resim_adi=\(yemekResimAd)&yemek_fiyat=\(yemekFiyat)&yemek_siparis_adet=\(yemekSiparisAdet)&kullanici_adi=\(userName)"
        request.httpBody = postString.data(using: .utf8)
                
        URLSession.shared.dataTask(with: request){ data,response,error in
            if error != nil || data == nil {
                print("Error")
                return
            }
                    
            do{
                let cevap = try JSONDecoder().decode(SepeteYemekEklemeCevap.self, from: data!)
                print(cevap.message ?? "No message")
             }catch{print(error.localizedDescription)}
        }.resume()

    }
    
    
  
}
