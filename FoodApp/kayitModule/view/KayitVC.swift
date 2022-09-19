//
//  KayitVC.swift
//  FoodApp
//
//  Created by Burak Özkan on 16.09.2022.
//

import UIKit

class KayitVC: UIViewController {

    @IBOutlet weak var passwordTextField2: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var emailTextField: UITextField!
    
    var kayitPresneterObject : ViewToPresenterRegisterProtocol?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        updateUI()
        
        RegisterRouter.createModule(ref: self)

        
    }
    func updateUI()
    {
        
        emailTextField.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor

        passwordTextField.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        
        passwordTextField2.layer.borderColor = UIColor(named: "PrimaryColor")?.cgColor
        
        
        
    }
    

    
    @IBAction func buttonGirisSay(_ sender: Any) {
        performSegue(withIdentifier: "toGiris", sender: nil)
    }
    
    @IBAction func buttonKayit(_ sender: Any) {
        
        if let te = emailTextField.text, let tp = passwordTextField.text
        {
            kayitPresneterObject?.registerAll(email: te, password: tp)
        }
        
        let alert = UIAlertController(title: "HOŞGELDİNİZ", message: "Kayıt olduğunuz için teşekkürler.", preferredStyle: .alert)
        
        let okayAction = UIAlertAction(title: "Tamam", style: .default)
        {
            action in
            
            self.performSegue(withIdentifier: "toGiris", sender: nil)
        }
        
        alert.addAction(okayAction)
        self.present(alert, animated: true)
    }
    
    
}

    
