//
//  ViewController.swift
//  Week 6
//
//  Created by Karthikeyan Muthu on 06/10/23.
//

import UIKit

var viewmodel = UserViewModel()
class SignUpViewController: UIViewController {

    
    @IBOutlet weak var usernameField: UITextField!
    
    
    @IBOutlet weak var passwordFied: UITextField!
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        usernameField.layer.cornerRadius = 20
        passwordFied.layer.cornerRadius = 20
        passwordFied.isSecureTextEntry = true
        passwordFied.textContentType = .oneTimeCode

    }


    
    @IBAction func signUpBtn(_ sender: Any) {
        if usernameField.text!.isEmpty || passwordFied.text!.isEmpty{
            AlertManager.shared.showAlert(from: self, withTitle: "Fill all Fields", message: "Fill Both fields",shouldNavigate: false)
        }
        else if !(isPasswordValid(passwordFied.text!)){
            AlertManager.shared.showAlert(from: self, withTitle: "Need Strong password", message: "Should include number and special character",shouldNavigate: false)
        }
        else{
            let storyboard = UIStoryboard(name: "Main", bundle: nil)
            let sc = storyboard.instantiateViewController(withIdentifier: "ListScreenViewController") as! ListScreenViewController
            var usr = [String]()
            usr.append(usernameField.text!)
            usr.append(passwordFied.text!)
            viewmodel.addUser(usr)
            sc.usrIndex = DataManager.shared.findIndexOfUser(withName: usernameField.text!)!
            self.navigationController?.pushViewController(sc, animated: true)
        }
    }
    
    
    @IBAction func loginBtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let vc  = storyboard.instantiateViewController(withIdentifier: "LoginViewController") as! LoginViewController
        self.navigationController?.pushViewController(vc, animated: true)
    }
    
}
func isPasswordValid(_ password: String) -> Bool {
    // Check if the password length is at least 6 characters
    if password.count < 6 {
        return false
    }
    
    // Define character sets for numbers and special characters
    let numbersCharacterSet = CharacterSet(charactersIn: "0123456789")
    let specialCharacterSet = CharacterSet(charactersIn: "!@#$%^&*()_-+=<>?")

    // Check if the password contains at least one number
    if password.rangeOfCharacter(from: numbersCharacterSet) == nil {
        return false
    }

    // Check if the password contains at least one special character
    if password.rangeOfCharacter(from: specialCharacterSet) == nil {
        return false
    }

    // If all checks pass, the password is valid
    return true
}


