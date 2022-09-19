//
//  SepetTableViewCell.swift
//  FoodApp
//
//  Created by Burak Özkan on 17.09.2022.
//

import UIKit

class SepetTableViewCell: UITableViewCell {

   
    @IBOutlet weak var foodPriceLabel: UILabel!
    @IBOutlet weak var foodCount: UILabel!
    @IBOutlet weak var foodNameLabel: UILabel!
    @IBOutlet weak var foodImageView: UIImageView!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    
    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        
    }

}
