//
//  ProfileVC.swift
//  FoodApp
//
//  Created by Burak Özkan on 17.09.2022.
//

import UIKit
import Firebase

class ProfileVC: UIViewController {
    
    
    @IBOutlet weak var emailLabel: UILabel!

    
    var profilePresenterObject : ViewToPresenterProfileProtocol?
    
    override func viewDidLoad() {
        
        super.viewDidLoad()
        
        ProfileRouter.createModule(ref: self)
        
    }
    
    override func viewWillAppear(_ animated: Bool) {
        profilePresenterObject?.showInfoAll()
    }
    
    
    @IBAction func cikisButton(_ sender: Any) {
        performSegue(withIdentifier: "toCikis", sender: nil)
    }
    
}

extension ProfileVC : PresenterToViewProfileProtocol
{
    func sendDataToView(email: String) {
        
        self.emailLabel.text = email
    }
    
}

    
