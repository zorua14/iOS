//
//  LoginViewController.swift
//  Week 6
//
//  Created by Karthikeyan Muthu on 06/10/23.
//

import UIKit

class LoginViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    
    @IBOutlet weak var passwordField: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        usernameField.layer.cornerRadius = 20
        passwordField.layer.cornerRadius = 20
        passwordField.isSecureTextEntry = true
        passwordField.textContentType = .oneTimeCode
    }
    
    @IBAction func loginBtn(_ sender: Any) {
        if usernameField.text!.isEmpty || passwordField.text!.isEmpty{
            AlertManager.shared.showAlert(from: self, withTitle: "Fill all Fields", message: "Fill Both fields",shouldNavigate: false)
        }
        else if (DataManager.shared.findIndexOfUser(withName: usernameField.text!) != nil){
            let usr = viewmodel.getUser(DataManager.shared.findIndexOfUser(withName: usernameField.text!)!)
            let arr = usr.getEmailandpass()
            
            if !(arr[1] == passwordField.text!){
                AlertManager.shared.showAlert(from: self, withTitle: "Invalid Credentials", message: "Try Giving Correct Password",shouldNavigate: false)
            }
            else{
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let sc = storyboard.instantiateViewController(withIdentifier: "ListScreenViewController") as! ListScreenViewController
                sc.usrIndex = DataManager.shared.findIndexOfUser(withName: usernameField.text!)!
                self.navigationController?.pushViewController(sc, animated: true)
                
            }
        }
        else{
            AlertManager.shared.showAlert(from: self, withTitle: "No such User", message: "Try proper credentials",shouldNavigate: false)
        }
    }
    
    
    @IBAction func signUpBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
        
    }
}
