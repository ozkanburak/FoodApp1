//
//  DetayVC.swift
//  FoodApp
//
//  Created by Burak Özkan on 12.09.2022.
//

import UIKit
import Kingfisher
import Firebase

class DetayVC: UIViewController {

    
  
    @IBOutlet weak var artiDeger: UIButton!
    @IBOutlet weak var eksiDeger: UIButton!
    @IBOutlet weak var countLabel: UILabel!
    @IBOutlet weak var eksiButton: UIButton!
    @IBOutlet weak var yemekNameLabel: UILabel!
    @IBOutlet weak var yemekFiyatLabel: UILabel!
    @IBOutlet weak var sepeteEkleButton: UIButton!
    @IBOutlet weak var yemekImageview: UIImageView!
    
    var count : Int = 1
    var food : Yemekler?
    
    var foodDetailPresenterObject : ViewToPresenterFoodDetailProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateUI()
        
        if let f = food{
            yemekNameLabel.text = f.yemek_adi
            yemekFiyatLabel.text = "₺\(f.yemek_fiyat!).00"
            if let url = URL(string : "http://kasimadalan.pe.hu/yemekler/resimler/\(f.yemek_resim_adi!)")
            {
                DispatchQueue.main.async {
                    self.yemekImageview.kf.setImage(with : url)
                }
            }
            
        }
        
        FoodDetailRouter.createModule(ref: self)
    }
    
    func updateUI()
    {
        artiDeger.layer.cornerRadius = 10
        eksiDeger.layer.cornerRadius = 10
        sepeteEkleButton.layer.cornerRadius = 10
      
        
    }
    
    @IBAction func eksiButton(_ sender: Any) {
       azalt()
    }
    @IBAction func artiButton(_ sender: Any) {
        arttir()
    }
    
    @IBAction func sepeteEkleButton(_ sender: Any) {
        if let f = food{
            foodDetailPresenterObject?.addAllCart(yemek_adi: f.yemek_adi!, yemek_fiyat: f.yemek_fiyat!, yemek_resim_adi: f.yemek_resim_adi!, yemek_siparis_adet: String(count), kullanici_adi: "\(Auth.auth().currentUser?.email ?? "")")
            
            let alert = UIAlertController(title: "Sepete Ekle", message: "\(f.yemek_adi!) sepete eklendi!", preferredStyle: .alert)
            let OKAction = UIAlertAction(title: "Tamam", style: .default){ action in
                self.navigationController?.popToRootViewController(animated: true)
            }
            alert.addAction(OKAction)
            
            self.present(alert, animated: true)
    }
    
  
}
    
    
    func arttir()
    {
        if count >= 1 && count < 20
        {
            count += 1
        }
        countLabel.text = "\(count)"
        
        if let f = food
        {
            let dataPrice = Int(f.yemek_fiyat!)
            yemekFiyatLabel.text = "₺\(dataPrice! * count).00"
        }
    }
    
    func azalt()
    {
        if count > 1 && count <= 20
        {
            count -= 1
        }
        countLabel.text = "\(count)"
        
        if let f = food
        {
            let dataPrice = Int(f.yemek_fiyat!)
            yemekFiyatLabel.text = "₺\(dataPrice! * count).00"
        }
    }
    
    
}
