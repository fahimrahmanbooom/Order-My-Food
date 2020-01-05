//
//  FoodViewController.swift
//  Order My Food
//
//  Created by Fahim Rahman on 3/1/20.
//  Copyright © 2020 Fahim Rahman. All rights reserved.
//

import UIKit

class ChickenViewController: UIViewController {

    @IBOutlet weak var chickenCollectionView: UICollectionView!
    
    
    let chicken: [Chicken] = [
        
        Chicken(
                chickenImage: UIImage(named: "2Pc Smoky Grilled")!,
                chickenName: "2Pc Smoky Grilled",
                chickenPrice: "Tk 279.00",
                chickenDesc: "Colonel’s Spicy and Juicy grilled chicken with a mix of special marinade and secret herbs- grilled to a Smoky perfection."),
        
        
        
        Chicken(
                chickenImage: UIImage(named: "4Pc Smoky Grilled")!,
                chickenName: "4Pc Smoky Grilled",
                chickenPrice: "Tk 549.00",
                chickenDesc: "Colonel’s Spicy and Juicy grilled chicken with a mix of special marinade and secret herbs- grilled to a Smoky perfection"),
        
        
        
        Chicken(
                chickenImage: UIImage(named: "8Pc Smoky Grilled")!,
                chickenName: "8Pc Smoky Grilled",
                chickenPrice: "Tk 1039.00",
                chickenDesc: "Colonel’s Spicy and Juicy grilled chicken with a mix of special marinade and secret herbs- grilled to a Smoky perfection"),
        
        
        Chicken(
            chickenImage: UIImage(named: "4 Pcs Hot & Crispy Chicken")!,
            chickenName: "4 Pcs Hot & Crispy Chicken",
            chickenPrice: "Tk 549.00",
            chickenDesc: "Treat your taste buds to spicy, crunchy, juicy chicken that sets your taste buds alight."),
        
        Chicken(
            chickenImage: UIImage(named: "12 Pcs Bucket")!,
            chickenName: "12 Pcs Bucket",
            chickenPrice: "Tk 1549.00",
            chickenDesc: "Treat your taste buds to spicy, crunchy, juicy chicken that sets your taste buds alight."),
        
        Chicken(
            chickenImage: UIImage(named: "Miingles Bucket")!,
            chickenName: "Miingles Bucket",
            chickenPrice: "Tk 499.00",
            chickenDesc: "Sample it all in one bucket with KFC Mingles. 5 pcs Hot Wings, 2 pcs Boneless Strips an 1 Regular Pop Corn Chicken!")
    ]
    
    
    var itemName: String!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        chickenCollectionView.delegate = self
        chickenCollectionView.dataSource = self
        chickenCollectionView.indicatorStyle = UIScrollView.IndicatorStyle.white
    }
    
    
    @IBAction func cartButton(_ sender: UIButton) {
        
        let vc = self.storyboard?.instantiateViewController(withIdentifier: "CartViewController") as? CartViewController
        self.navigationController?.pushViewController(vc!, animated: true)
        
    }
    
}

extension ChickenViewController: UICollectionViewDelegate, UICollectionViewDataSource {
    
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return chicken.count
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        let cell: ChickenCollectionViewCell = chickenCollectionView.dequeueReusableCell(withReuseIdentifier: "cell", for: indexPath) as! ChickenCollectionViewCell
        
        cell.addToCart.layer.cornerRadius = 5
        cell.chickenCollectionViewImage.layer.cornerRadius = 10
        
        cell.chickenCollectionViewImage.image = chicken[indexPath.row].chickenImage
        cell.chickenNameCollectionViewLabel.text = chicken[indexPath.row].chickenName
        cell.chickenPriceCollectionViewLabel.text = chicken[indexPath.row].chickenPrice
        cell.chickenDescCollectionViewLabel.text = chicken[indexPath.row].chickenDesc
        
        cell.addToCart.tag = indexPath.row
        cell.addToCart.addTarget(self, action: #selector(addToCartButton), for: UIControl.Event.touchUpInside)
        
        return cell
    }
   
    @IBAction func addToCartButton(_ sender: UIButton) {
        
        for i in 0...chicken.count - 1 {
            
            if i == 0 {
                itemName = "2Pc Smoky Grilled"
            }
            if i == 1 {
                itemName = "4Pc Smoky Grilled"
            }
            if i == 2 {
                itemName = "8Pc Smoky Grilled"
            }
            if i == 3 {
                itemName = "4 Pcs Hot & Crispy Chicken"
            }
            if i == 4 {
                itemName = "12 Pcs Bucket"
            }
            if i == 5 {
                itemName = "Miingles Bucket"
            }
            
            if sender.tag == i {
                
                let alert = UIAlertController(title: "Success!", message: "\(itemName!) is added to your cart.", preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(alert, animated: true)
                
            }
        }
    }
}
