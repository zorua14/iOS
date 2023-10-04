//
//  LoginViewController.swift
//  Contact
//
//  Created by Karthikeyan Muthu on 03/10/23.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var userName: UITextField!
    
    @IBOutlet weak var password: UITextField!
    
    var userIsThere = false
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        password.isSecureTextEntry = true
        password.textContentType = .oneTimeCode
        
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        
        let users = DataManager.shared.getAllUsers()
        for user in users {
            if (user.getUserName() == userName.text!) && (user.getPassword() == password.text!){
                userIsThere = true
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let vc = storyboard.instantiateViewController(withIdentifier: "ContactViewController") as! ContactViewController
                self.navigationController?.pushViewController(vc, animated: true)
            }
        }
        // alert
        if userName.text!.isEmpty || password.text!.isEmpty{
            AlertManager.shared.showAlert(from: self, withTitle: "Empty Fields", message: "Fill all fields", shouldNavigate: false)
        }
        else if !userIsThere{
            AlertManager.shared.showAlert(from: self, withTitle: "Inconsistent Data", message: "Give Correct Credentials", shouldNavigate: false)
        }
        
    }
    
    @IBAction func signUpBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "SignUpViewController") as! SignUpViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    

}
