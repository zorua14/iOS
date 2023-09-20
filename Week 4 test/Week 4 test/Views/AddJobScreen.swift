//
//  AddJobScreen.swift
//  Week 4 test
//
//  Created by Karthikeyan Muthu on 20/09/23.
//

import UIKit

protocol dataPassing{
    func pass(data:[String])
}

class AddJobScreen: UIViewController {

    @IBOutlet weak var jobnameText: UITextField!
    
    @IBOutlet weak var experienceText: UITextField!
    
    @IBOutlet weak var locationText: UITextField!
    
    @IBOutlet weak var contactText: UITextField!
    
    @IBOutlet weak var descText: UITextField!
    var logics = Verification()
    var delegate:dataPassing?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func savebtn(_ sender: Any) {
        var arr = [String]()
        arr.append(jobnameText.text!)
        arr.append(experienceText.text!)
        arr.append(locationText.text!)
        arr.append(contactText.text!)
        arr.append(descText.text!)
        
        if logics.validation(value: arr)
        {
            delegate?.pass(data: arr)
            self.navigationController?.popViewController(animated: true)
        }
        else{
            let alert:UIAlertController=UIAlertController(
                            title: "Data Entry Error",
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
    
    
}
