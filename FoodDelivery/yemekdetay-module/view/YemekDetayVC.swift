//
//  YemekDetayVC.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import UIKit

class YemekDetayVC: UIViewController {

    
   
    
    @IBOutlet weak var yemekDFiyatLabel: UILabel!
    
    @IBOutlet weak var yemekDAdetLabel: UILabel!
    
    @IBOutlet weak var yemekDResimAdiLabel: UIImageView!
    
    @IBOutlet weak var yemekDYemekAdiLabel: UILabel!
    
    @IBOutlet weak var miktarStepper: UIStepper!
    
    @IBOutlet weak var yemekDSepetimButton: UIButton!
    
    var yemek:Yemekler?
    var anasayfaPresenterNesnesi: ViewToPresenterDetayProtocol?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        yemekDAdetLabel.text = yemek?.yemek_adi
        
        //let url = URL(string: x.Urls.yemekResimAlUrl + yemek!.yemek_resim_adi)
       //yemekDResimAdiLabel.kf.setImage(with: url)
        yemekDFiyatLabel.text = yemek!.yemek_fiyat + "₺"
        yemekDSepetimButton.layer.cornerRadius = 10.0
        miktarStepper.minimumValue = 1
        
        DetayRouter.createModule(ref: self)
        
        
        
            
            
        }
        
    @IBAction func stepperAction(_ sender: UIStepper) {
        yemekDAdetLabel.text = Int(sender.value).description
        yemekDFiyatLabel.text = String(Int(yemek!.yemek_fiyat)! * Int(sender.value)) + " ₺"
    }
    
    @IBAction func detaySepetimButton(_ sender: UIButton) {
        
        anasayfaPresenterNesnesi?.postSepet(yemek: yemek!.yemek_adi, yemekResimAd: yemek!.yemek_resim_adi, yemekFiyat: Int(yemek!.yemek_fiyat)!, yemekSiparisAdet: Int(yemekDAdetLabel.text!)!, userName: "Aysegul")
        
        
    }
}


   

   

