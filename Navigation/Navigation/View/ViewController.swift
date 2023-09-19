//
//  ViewController.swift
//  Navigation
//
//  Created by Karthikeyan Muthu on 13/09/23.
//

import UIKit

class ViewController: UIViewController, dataPassing {
    let logics = Logics()
    var passtext = ""
    func passData(data: [String]) {
        if logics.validation(data)
        {
            passtext = data[0]
            passwordlabel.text = data[1]
            emaillabel.text = data[2]
            
            loginib.isEnabled  = true
        }
        else{
            
        // Alert Information
            
            let alert:UIAlertController=UIAlertController(
                title: "Fill Fields",
                message: logics.getmessage(),
                preferredStyle: UIAlertController.Style.alert
            )
            alert.addAction(
                UIAlertAction(
                    title: "Ok",
                    style: UIAlertAction.Style.default,
                    handler: nil
                )
            )
            present(alert,animated: true,completion: nil)
        }
        
    }
    

    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        loginib.isEnabled = false
    }
    @IBOutlet weak var emaillabel: UITextField!
    
    @IBOutlet weak var passwordlabel: UITextField!
    @IBOutlet weak var loginib: UIButton!
    @IBAction func loginbtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let third = storyboard.instantiateViewController(withIdentifier: "Third") as! Third
        third.text = "Welcome \(passtext)"
        self.navigationController?.pushViewController(third, animated: true)
    }
    @IBAction func signupbtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let second = storyboard.instantiateViewController(withIdentifier: "Second") as! Second
        second.delegate = self
        self.navigationController?.pushViewController(second, animated: true)
        
    }
    
}

