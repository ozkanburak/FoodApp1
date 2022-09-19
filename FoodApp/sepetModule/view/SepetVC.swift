//
//  SepetVC.swift
//  FoodApp
//
//  Created by Burak Özkan on 17.09.2022.
//

import UIKit
import Firebase

class SepetVC: UIViewController {

    
   

   
    @IBOutlet weak var foodTableViewCell: UITableView!
    @IBOutlet weak var foodTotalPrice: UILabel!
    @IBOutlet weak var foodDeleteButton: UIButton!
    @IBOutlet weak var bosSepetStack: UIStackView!
    @IBOutlet weak var odeButton: UIButton!
    
    var sepetYemek = [FoodsDetail]()
    var sepetPresenterObject : ViewToPresenterSepetProtocol?
    var click : Bool = false
    var foodsCount = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        foodTableViewCell.delegate = self
        foodTableViewCell.dataSource = self
        
        SepetRouter.createModule(ref: self)
        
        hiddenUI()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        sepetPresenterObject?.showAllSepet()
        sepetPresenterObject?.showCount()
        
    }
    
    @IBAction func odeme(_ sender: Any) {
    }
    
    @IBAction func deleteSepet(_ sender: Any) {
        self.sepetPresenterObject?.allDeleteItems(sepets: sepetYemek)
        self.performSegue(withIdentifier: "toAnasayfa", sender: nil)
    }
    
    
    func hiddenUI()
    {
        odeButton.isHidden = true
        bosSepetStack.isHidden = false
        foodDeleteButton.isHidden = true
        
    }
    
    func notHiddenUI()
    {
        odeButton.isHidden = false
        bosSepetStack.isHidden = true
        foodDeleteButton.isHidden = false
    }
    
    
}


extension SepetVC : PresenterToViewSepetProtocol
{
    
    func sendDataToView(foodCount: Int) {
        self.foodsCount = foodCount
        
        DispatchQueue.main.async {
            self.foodTableViewCell.reloadData()
            self.tabBarController?.tabBar.items![1].badgeValue = "\(self.foodsCount)"
            self.tabBarController?.tabBar.items![1].badgeColor = UIColor(named: "PrimaryColor2")
            
            if self.foodsCount >= 1
            {
                
                self.notHiddenUI()
            }
            
            print(self.foodsCount)
            
        }
        
    }
    
    
    func sendDataToView(sepetList: Array<FoodsDetail>) {
        self.sepetYemek = sepetList
        
        
        DispatchQueue.main.async {
            self.foodTableViewCell.reloadData()
            
            var total = 0
            
            self.sepetYemek.forEach{   cart_food in
                
                total = total  + (Int(cart_food.yemek_fiyat ?? "0")! * Int(cart_food.yemek_siparis_adet ?? "0")!)
                
            }
            self.foodTotalPrice.text = "₺\(total).00"
        }
    }
    
}



extension SepetVC : UITableViewDelegate, UITableViewDataSource
{
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return sepetYemek.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let sepetFood = sepetYemek[indexPath.row]
        let cell = tableView.dequeueReusableCell(withIdentifier: "cartCell", for: indexPath) as! SepetTableViewCell
        cell.foodNameLabel.text = sepetFood.yemek_adi!
        cell.foodPriceLabel.text = "₺\(Int(sepetFood.yemek_fiyat!)!).00"
        cell.foodCount.text = "\(sepetFood.yemek_siparis_adet!) adet"
        
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(sepetFood.yemek_resim_adi!)")
        {
            DispatchQueue.main.async {
                cell.foodImageView.kf.setImage(with : url)
                
            }
        }
        
        return cell
    }
    
    func tableView(_ tableView: UITableView, trailingSwipeActionsConfigurationForRowAt indexPath: IndexPath) -> UISwipeActionsConfiguration? {
        
        let deleteAction = UIContextualAction(style: .destructive, title: "Sil"){ (contextualAction,view,bool) in
            
            let sepet = self.sepetYemek[indexPath.row]
            
            self.sepetYemek.remove(at: indexPath.row)
            
            self.sepetPresenterObject?.deleteAllSepet(sepet: sepet, kullanici_adi: "\(Auth.auth().currentUser?.email ?? "")")
            
            tableView.reloadData()
            
            self.foodsCount -= 1
            
            self.tabBarController?.tabBar.items![1].badgeValue = "\(self.foodsCount)"
            
            if self.foodsCount == 0
            {
                self.tabBarController?.tabBar.items![1].badgeValue = nil
                self.performSegue(withIdentifier: "toAnasayfa", sender: nil)
            }
            print(self.foodsCount)
            
            
        }
        
        
        
        
        return UISwipeActionsConfiguration(actions: [deleteAction])
    }
    
}




