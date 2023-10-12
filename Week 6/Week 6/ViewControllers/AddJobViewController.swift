//
//  AddJobViewController.swift
//  Week 6
//
//  Created by Karthikeyan Muthu on 06/10/23.
//

import UIKit

class AddJobViewController: UIViewController {

    
    @IBOutlet weak var jobName: UITextField!
    
    @IBOutlet weak var experience: UITextField!
    
    @IBOutlet weak var location: UITextField!
    
    @IBOutlet weak var contactNumber: UITextField!
    
    @IBOutlet weak var jobDesc: UITextField!
    
    var index = 0
    
    let logics = ValidationFunctions()
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        jobName.layer.cornerRadius = 4
        experience.layer.cornerRadius = 4
        location.layer.cornerRadius = 4
        contactNumber.layer.cornerRadius = 4
        jobDesc.layer.cornerRadius = 4
        
    }
    

    @IBAction func saveBtn(_ sender: Any) {

        var array = [String]()
        array.append(jobName.text!.trimmingCharacters(in: .whitespaces))
        array.append(experience.text!.trimmingCharacters(in: .whitespaces))
        array.append(location.text!.trimmingCharacters(in: .whitespaces))
        array.append(contactNumber.text!.trimmingCharacters(in: .whitespaces))
        array.append(jobDesc.text!.trimmingCharacters(in: .whitespaces))
        if logics.validation(value: array)
        {
            //print("Yrt to be imple")
            DataManager.shared.modifyUser(at: index, job: JobModel(data: array))
            self.navigationController?.popViewController(animated: true)

        }
        else{
            AlertManager.shared.showAlert(from: self, withTitle: logics.getTitle(), message: logics.getmessage(),shouldNavigate: false)
        }
    }
    
    @IBAction func cancelBtn(_ sender: Any) {
        self.navigationController?.popViewController(animated: true)
    }
    
    
}
