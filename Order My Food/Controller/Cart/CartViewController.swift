//
//  cartViewController.swift
//  Order My Food
//
//  Created by Fahim Rahman on 4/1/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit

class CartViewController: UIViewController {
    
    
    @IBOutlet weak var cartTableView: UITableView!
    
    @IBOutlet weak var cartTotalLabel: UILabel!
    
    @IBOutlet weak var cartCheckoutButton: UIButton!
    
    
    var cartFoodName: [String] = ["demo1","demo2","demo3","demo4"]
    var cartFoodPrice: [String] = ["Tk 500.00","Tk 500.00","Tk 500.00","Tk 500.00"]
    var cartFoodQuantity: [String] = ["1","1","1","1"]
    var cartFoodImage: [UIImage] = [#imageLiteral(resourceName: "4 Pcs Hot & Crispy Chicken"),#imageLiteral(resourceName: "8Pc Smoky Grilled"),#imageLiteral(resourceName: "4Pc Smoky Grilled"),#imageLiteral(resourceName: "12 Pcs Bucket")]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        cartCheckoutButton.layer.cornerRadius = 5
        
        cartTableView.delegate = self
        cartTableView.dataSource = self
        cartTableView.tableFooterView = UIView()
        
    }
    
    
    @IBAction func cartCheckoutButton(_ sender: UIButton) {
    
    }
    
}


extension CartViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return cartFoodName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: CartTableViewCell = cartTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! CartTableViewCell
        
        cell.foodNameOnCart.text = cartFoodName[indexPath.row]
        print(cartFoodName)
        cell.foodPriceOnCart.text = cartFoodPrice[indexPath.row]
        cell.foodQuantityOnCart.text = cartFoodQuantity[indexPath.row]
        cell.foodImageOnCart.image = cartFoodImage[indexPath.row]
        
        return cell
    }
}
