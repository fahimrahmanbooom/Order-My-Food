//
//  ViewController.swift
//  Order My Food
//
//  Created by Fahim Rahman on 3/1/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit

class MenuViewController: UIViewController {
    
    @IBOutlet weak var menuTableView: UITableView!
    
    @IBOutlet weak var kfcImage: UIImageView!
    
    
    @IBOutlet weak var backViewOfTheLogo: UIView!
    
    let catagoryName: [String] = [
        
        "Chicken",
        "Burgers",
        "Meal Deals",
        "Rice Meals",
        "Snacks",
        "Drinks",
        "Deals",
        "Meal For Four",
        "Meal For Four +"
    ]
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        kfcImage.layer.cornerRadius = 5
        kfcImage.layer.borderColor = UIColor.black.cgColor
        kfcImage.layer.borderWidth = 1
        
        
        
        backViewOfTheLogo.layer.cornerRadius = 5
        backViewOfTheLogo.layer.masksToBounds = true
        backViewOfTheLogo.layer.maskedCorners = [.layerMinXMinYCorner, .layerMaxXMinYCorner]
        
        self.menuTableView.delegate = self
        self.menuTableView.dataSource = self
        menuTableView.tableFooterView = UIView()
    }
}

extension MenuViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        
        return catagoryName.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
        let cell: MenuTableViewCell = menuTableView.dequeueReusableCell(withIdentifier: "cell", for: indexPath) as! MenuTableViewCell
        
        
        cell.menuItemNameLabel.text = catagoryName[indexPath.row]
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        
        if indexPath.row == 0 {
            
            let vc = self.storyboard?.instantiateViewController(withIdentifier: "ChickenViewController") as? ChickenViewController
            self.navigationController?.pushViewController(vc!, animated: true)
            
        }
    }
}

extension UINavigationController {
    
        override open var preferredStatusBarStyle: UIStatusBarStyle {
            return .lightContent
    }
}
