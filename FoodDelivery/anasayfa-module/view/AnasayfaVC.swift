//
//  ViewController.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import UIKit

class AnasayfaVC: UIViewController {

    @IBOutlet weak var yemeklerTableView: UITableView!
    
    var yemeklerListe = [Yemekler]()
    var anasayfaPresenterNesnesi:ViewToPresenterAnasayfaProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        yemeklerTableView.delegate = self
        yemeklerTableView.dataSource = self
        
        AnasayfaRouter.createModule(ref: self)
        anasayfaPresenterNesnesi?.yemekleriYukle()
        
             
        self.navigationItem.title = "CallFood"
        
        let appearence = UINavigationBarAppearance()
        //ArkaPlan Rengi
        appearence.backgroundColor = UIColor(named: "yaziRenk1")
        //Başlık Rengi
        appearence.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk2")!,NSAttributedString.Key.font: UIFont(name: "Macondo-Regular", size: 35)!]
        //Status Bar
        navigationController?.navigationBar.barStyle = .black
        navigationController?.navigationBar.isTranslucent = true
        
        navigationController?.navigationBar.standardAppearance = appearence
        navigationController?.navigationBar.compactAppearance = appearence
        navigationController?.navigationBar.scrollEdgeAppearance = appearence
        
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == x.detaySegue {
            if  let yemek = sender as? Yemekler {
                let gidilecekVC = segue.destination as! YemekDetayVC
                gidilecekVC.yemek =  yemek
            }
        }
    }


}

extension AnasayfaVC : PresenterToViewAnasayfaProtocol {
    func vieweVeriGonder(yemeklerListesi: Array<Yemekler>) {
        self.yemeklerListe = yemeklerListesi
        DispatchQueue.main.async {
            self.yemeklerTableView.reloadData()
        }
    }
}



extension AnasayfaVC : UITableViewDelegate,UITableViewDataSource {
  
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return yemeklerListe.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        

        let cell = tableView.dequeueReusableCell(withIdentifier: "yemeklerHucre", for: indexPath) as! TableViewHucre
        
        //let url = URL(string: x.Urls.yemekResimAlUrl + yemeklerListe[indexPath.row].yemek_resim_adi)
       // cell.yemekImageView.kf.setImage(with: url)
        // cell.yemekImageView.frame.size.height = cell.yemekImageView.frame.width
        
        cell.yemekAdiLabel.text = yemeklerListe[indexPath.row].yemek_adi
        cell.yemekFiyatLabel.text = yemeklerListe[indexPath.row].yemek_fiyat + "₺"
        
        cell.backgroundColor = UIColor(white: 0.95, alpha: 1) // hucre arka plan rengi
        cell.hucreArkaPlan.layer.cornerRadius = 10.0
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let yemek = yemeklerListe[indexPath.row]
        performSegue(withIdentifier: x.detaySegue, sender: yemek)
        tableView.deselectRow(at: indexPath, animated: true)
    }
    

}
