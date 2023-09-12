//
//  ViewController.swift
//  nav
//
//  Created by Karthikeyan Muthu on 12/09/23.
//

import UIKit

class ViewController: UIViewController, dataPassing {
        
    

    @IBOutlet weak var displabel: UILabel!
    
    @IBOutlet weak var viewapp: UIButton!
    
    let logics = Logics()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        displabel.text = ""
        viewapp.isEnabled  = false
    }
    
    func pass(data: String) {
        displabel.text = data

        if logics.validation(data)
        {
            displabel.text = data
            viewapp.isEnabled = true
        }
        else{
            
        // Alert Information
            
            let alert:UIAlertController=UIAlertController(
                title: "Invalid UserName",
                message: logics.message,
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


    @IBAction func signupbtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let second = storyboard.instantiateViewController(withIdentifier: "Second") as! Second
        second.delegate = self
        self.navigationController?.pushViewController(second, animated: true)
    }
    @IBAction func viewappbtn(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let third = storyboard.instantiateViewController(withIdentifier: "Third") as! Third
        self.view.window?.rootViewController = third
        self.view.window?.makeKeyAndVisible()

    }
    
}

