//
//  ViewController.swift
//  FoodApp
//
//  Created by Burak Özkan on 12.09.2022.
//

import UIKit
import Kingfisher
import Firebase

class AnasayfaVC: UIViewController {

    @IBOutlet weak var yemeklerCollectionView: UICollectionView!
    @IBOutlet weak var searchBar: UISearchBar!
    var foodList = [Yemekler]()
    var filterFood = [Yemekler]()
    
    var homepagePresenterOnject : ViewToPresenterHomePageProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        searchBar.delegate = self
        yemeklerCollectionView.delegate = self
        yemeklerCollectionView.dataSource = self
        
        
        
        
        //Food collectionview UI
        let foodTasarim = UICollectionViewFlowLayout()
        foodTasarim.sectionInset = UIEdgeInsets(top: 5, left: 9, bottom: 5, right: 9)
        foodTasarim.minimumLineSpacing = 15
        foodTasarim.minimumInteritemSpacing = 5
        let width = yemeklerCollectionView.frame.size.width
        let cellWidht = (width - 30) / 2
        foodTasarim.itemSize = CGSize(width: cellWidht, height: cellWidht*1.1)
        yemeklerCollectionView.collectionViewLayout = foodTasarim
        
        HomeRouter.createModule(ref: self)
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        
        
        homepagePresenterOnject?.showFoods()
        homepagePresenterOnject?.showFoodCount()
        self.navigationItem.title = "FoodCenter"
        let apperance = UINavigationBarAppearance()
        apperance.titleTextAttributes = [.foregroundColor: UIColor(named: "yaziRenk1")!,.font: UIFont(name: "BreeSerif-Regular", size: 22)!]
        
        navigationController?.navigationBar.standardAppearance = apperance
        navigationController?.navigationBar.compactAppearance = apperance
        navigationController?.navigationBar.scrollEdgeAppearance = apperance
        
    }
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == "toDetay" {
            let food = sender as? Yemekler
            let destinationVC = segue.destination as! DetayVC
            destinationVC.food = food
        }
    }
    
   
}

extension AnasayfaVC : PresenterToViewHomePageProtocol
{
    
    func sendDataToView(foodCount: Int) {
        self.tabBarController?.tabBar.items![1].badgeValue = "\(foodCount)"
        self.tabBarController?.tabBar.items![1].badgeColor = UIColor(named: "PrimaryColor2")
    }
    
    func sendDataToView(foods: Array<Yemekler>) {
        
        self.foodList = foods
        self.filterFood = foods
        DispatchQueue.main.async {
            
            self.yemeklerCollectionView.reloadData()
           
        }
    }
}

extension AnasayfaVC : UISearchBarDelegate
{
    func searchBar(_ searchBar: UISearchBar, textDidChange searchText: String) {
        self.filterFood = self.foodList.filter { f in
            if f.yemek_adi!.lowercased().contains(searchText.lowercased()) {
                return true
            }
            if searchText.isEmpty {
                return true
            }
            return false
        }
        self.yemeklerCollectionView.reloadData()
    }
}


extension AnasayfaVC : UICollectionViewDelegate, UICollectionViewDataSource,UICollectionViewDelegateFlowLayout
{
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        
        return filterFood.count
        
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        
        
        let food = filterFood[indexPath.row]
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "yemekCell", for: indexPath) as! YemeklerCollectionViewCell
        cell.foodNameLabel.text = food.yemek_adi!
        cell.foodPriceLabel.text = "₺\(food.yemek_fiyat!).00"
        if let url = URL(string: "http://kasimadalan.pe.hu/yemekler/resimler/\(food.yemek_resim_adi!)")
        {
            DispatchQueue.main.async {
                cell.foodImageview.kf.setImage(with : url)
                
            }
        }
        cell.contentView.layer.borderColor = UIColor.lightGray.cgColor
        cell.contentView.layer.borderWidth = 0.3
        cell.contentView.layer.cornerRadius = 10.0
        cell.contentView.layer.masksToBounds = true;
        cell.layer.shadowColor = UIColor.white.cgColor
        cell.layer.shadowRadius = 1.0
        cell.layer.shadowOpacity = 0.9
        cell.layer.masksToBounds = false;
        cell.layer.shadowPath = UIBezierPath(roundedRect:cell.bounds, cornerRadius:cell.contentView.layer.cornerRadius).cgPath
        
        return cell
        
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        
        let food = filterFood[indexPath.row]
        performSegue(withIdentifier: "toDetay", sender: food)
        
        
    }
    
}
