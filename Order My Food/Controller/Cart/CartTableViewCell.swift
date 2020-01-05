//
//  CartTableViewCell.swift
//  Order My Food
//
//  Created by Fahim Rahman on 4/1/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit

class CartTableViewCell: UITableViewCell {
    
    @IBOutlet weak var foodImageOnCart: UIImageView!
    
    @IBOutlet weak var foodNameOnCart: UILabel!
    
    @IBOutlet weak var foodPriceOnCart: UILabel!
    
    @IBOutlet weak var foodQuantityOnCart: UILabel!
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }

}
