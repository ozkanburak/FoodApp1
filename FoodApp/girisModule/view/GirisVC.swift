//
//  GirisVC.swift
//  FoodApp
//
//  Created by Burak Özkan on 15.09.2022.
//

import UIKit
import Firebase

class GirisVC: UIViewController {

    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    var girisPresenterObject : ViewToPresenterLoginProtocol?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        update()
        
        LoginRouter.createModule(ref: self)
        
    
    }
    
    func update(){
        //email
        emailTextField.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        //Password textfield UI
        passwordTextField.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        
    }
    
    
    
    
    @IBAction func buttonKayit(_ sender: Any) {
        performSegue(withIdentifier: "toKayit", sender: nil)
    }
    @IBAction func buttonGiris(_ sender: Any) {
        
        let auth = Auth.auth()
        
        if let te = emailTextField.text, let tp = passwordTextField.text
        {
            girisPresenterObject?.loginAll(email: te, password: tp)
        }
        
        auth.addStateDidChangeListener(){ (auth,user) in
            if user != nil
            {
                print("Oturum açma başlat: " + (user?.email)! )
                self.performSegue(withIdentifier: "toHome", sender: nil)
                
            }else
            {
                let alert = UIAlertController(title: "Hata", message: "Mail veya Şifre yanlış", preferredStyle: .alert)
                let OKAction = UIAlertAction(title: "Tamam", style: .default){ action in
                    self.navigationController?.popToRootViewController(animated: true)
                }
                alert.addAction(OKAction)
                
                self.present(alert, animated: true)
                print("Kullanıcı bulunamadı.")
            }
            
        }
        
    }
    
}
    


