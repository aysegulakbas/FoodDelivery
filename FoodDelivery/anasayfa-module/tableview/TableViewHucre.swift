//
//  TableViewHucre.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import UIKit

class TableViewHucre: UITableViewCell {

 
    @IBOutlet weak var hucreArkaPlan: UIView!
    
    @IBOutlet weak var yemekImageView: UIImageView!
    @IBOutlet weak var yemekAdiLabel: UILabel!
    
    @IBOutlet weak var yemekFiyatLabel: UILabel! 
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    }


}
