//
//  YemekSepetVC.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import UIKit

class YemekSepetVC: UIViewController {

    @IBOutlet weak var FİYATLabel: UILabel!
    @IBOutlet weak var TOPLAMLabel: UILabel!
    @IBOutlet weak var sonucAdet: UILabel!
    
    @IBOutlet weak var sonucYemekAdi: UILabel!
    @IBOutlet weak var sonucFiyat: UILabel!
    @IBOutlet weak var sepetYemeklerTableView: UITableView!
    var sepetPresenterNesnesi : ViewToPresenterSepetProtocol?
    var yemekListe = [SepetYemekler]()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        sepetYemeklerTableView.delegate = self
        sepetYemeklerTableView.dataSource = self
        sepetYemeklerTableView.rowHeight = 120
        sepetYemeklerTableView.separatorStyle = .none
        
        SepetRouter.createModule(ref: self)
        sepetPresenterNesnesi?.getYemekSepet(userName: "Aysegul")

       
    }



}


extension YemekSepetVC: PresenterToViewSepetProtocol {
    func vieweVeriGonder(sepetYemekListesi: Array<SepetYemekler>) {
        self.yemekListe = sepetYemekListesi
        DispatchQueue.main.async {
            self.sepetYemeklerTableView.reloadData()
        }
    }
}

extension YemekSepetVC: UITableViewDataSource, UITableViewDelegate {
    
    

    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemekListe.count
        
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell =  tableView.dequeueReusableCell(withIdentifier: x.sepetId, for: indexPath) as! SepetTableViewHucre
        
    
        cell.sepetYemekAdiLabel.text = yemekListe[indexPath.row].yemek_adi
        cell.sepetFiyatLabel.text = yemekListe[indexPath.row].yemek_fiyat
        cell.sepetAdetLabel.text = yemekListe[indexPath.row].yemek_siparis_adet
        
        
        return cell
        
      
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        
        print()
        
        let silAction = UIContextualAction(style: .destructive, title: "Sil"){ (action,view,void) in
            self.sepetPresenterNesnesi?.silYemekSepet(sepet_yemek_id: Int(self.yemekListe[indexPath.row].sepet_yemek_id!)!, userName: "Aysegul")
        
        }
        
        return UISwipeActionsConfiguration(actions: [silAction])
    }
    
    
}
