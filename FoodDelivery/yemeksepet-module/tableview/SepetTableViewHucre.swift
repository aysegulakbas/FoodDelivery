//
//  SepetTableViewHucre.swift
//  FoodDelivery
//
//  Created by aysegul on 27.05.2022.
//

import UIKit

class SepetTableViewHucre: UITableViewCell {

    @IBOutlet weak var sepetView: UIView!
    @IBOutlet weak var sepetAdetLabel: UILabel! //
    
    @IBOutlet weak var sepetYemekAdiLabel: UILabel! //foodName
    
    @IBOutlet weak var sepetFiyatLabel: UILabel! // foodPrice
    
    override func awakeFromNib() {
        super.awakeFromNib()
       
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

    
    }

}
