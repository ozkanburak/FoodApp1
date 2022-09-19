//
//  SepetInteractor.swift
//  FoodApp
//
//  Created by Burak Özkan on 17.09.2022.
//

import Foundation
import Alamofire
import Firebase

class SepetInteractor : PresenterToInteractorSepetProtocol
{
    var sepetPresenter: InteractorToPresenterSepetProtocol?
    
    func showSepet() {
        
        let param : Parameters = ["kullanici_adi" : "\(Auth.auth().currentUser?.email ?? "")"]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).responseJSON{ response in
            if let data = response.data
            {
                do {
                    let answer = try JSONDecoder().decode(FoodDetailResponse.self, from: data)
                    var list = [FoodsDetail]()
                    if let answerList = answer.sepet_yemekler
                    {
                        list = answerList
                    }
                    
                    self.sepetPresenter?.sendDataToPresenter(sepetList: list)
                    
                    
                } catch  {
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
    
    func deleteSepet(sepet: FoodsDetail, kullanici_adi: String) {
        
        let param : Parameters = ["sepet_yemek_id" : sepet.sepet_yemek_id!, "kullanici_adi" : Auth.auth().currentUser?.email ?? ""]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettenYemekSil.php", method: .post, parameters: param).response{ response in
            if let data = response.data {
                do{
                    if let json = try JSONSerialization.jsonObject(with: data, options: []) as? [String:Any] {
                        print(json)
                        self.showSepet()
                        }
                    
                }catch{
                    print(error.localizedDescription)
                }
            }
            
        }
        
    }
    
    func allDeleteItems(sepets : Array<FoodsDetail>)
    {
        for sepetItem in sepets{
            DispatchQueue.main.async { [weak self] in
                self?.deleteSepet(sepet: sepetItem, kullanici_adi: Auth.auth().currentUser?.email ?? "")
            }
        }
    }
    
    func showCount() {
        
        let param : Parameters = ["kullanici_adi" : "\(Auth.auth().currentUser?.email ?? "")"]
        
        AF.request("http://kasimadalan.pe.hu/yemekler/sepettekiYemekleriGetir.php", method: .post, parameters: param).responseJSON{ response in
            if let data = response.data
            {
                do {
                    let answer = try JSONDecoder().decode(FoodDetailResponse.self, from: data)
                    var list = [FoodsDetail]()
                    if let answerList = answer.sepet_yemekler
                    {
                        list = answerList
                    }
                    print(list)
                    
                    self.sepetPresenter?.sendDataToPresenter(foodCount: list.count);
                    
                } catch  {
                    print(error.localizedDescription)
                }
            }
        }
    }
    
    
}
