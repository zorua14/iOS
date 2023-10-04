//
//  SignUpViewController.swift
//  Contact
//
//  Created by Karthikeyan Muthu on 29/09/23.
//

import UIKit

var viewmodel = ContactViewModel()
class SignUpViewController: UIViewController {
//MARK: - OUTLETS
    
    @IBOutlet weak var firstNameField: UITextField!
    
    @IBOutlet weak var lastNameField: UITextField!
    
    @IBOutlet weak var companyField: UITextField!
    
    @IBOutlet weak var mailField: UITextField!
    
    @IBOutlet weak var phoneField: UITextField!
    
    @IBOutlet weak var passField: UITextField!
    
    @IBOutlet weak var confirmField: UITextField!
    
    @IBOutlet weak var streetField: UITextField!
    
    @IBOutlet weak var street2Field: UITextField!
    
    @IBOutlet weak var citField: UITextField!
    
    @IBOutlet weak var stateField: UITextField!
    
    @IBOutlet weak var pinField: UITextField!
    
    @IBOutlet weak var countryNumber: UITextField!
    
    let pickData = ["91","93","213","1"]
    let logics = Alerts()
    //MARK: - VIEWDIDLOAD
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //PickerView setup
        countryNumber.delegate = self
        
        // Password securing
        passField.isSecureTextEntry = true
        passField.textContentType = .oneTimeCode
        confirmField.isSecureTextEntry = true
        confirmField.textContentType = .oneTimeCode
    }
    
    @IBAction func saveBtn(_ sender: Any) {
        var arr = [String]()
        arr.append(firstNameField.text!.trimmingCharacters(in: .whitespaces))
        arr.append(lastNameField.text!.trimmingCharacters(in: .whitespaces))
        arr.append(companyField.text!.trimmingCharacters(in: .whitespaces))
        arr.append(mailField.text!.trimmingCharacters(in: .whitespaces))
        arr.append(countryNumber.text!.trimmingCharacters(in: .whitespaces))
        arr.append(phoneField.text!.trimmingCharacters(in: .whitespaces))
        arr.append(passField.text!.trimmingCharacters(in: .whitespaces))
        arr.append(confirmField.text!.trimmingCharacters(in: .whitespaces))
        arr.append(streetField.text!.trimmingCharacters(in: .whitespaces))
        arr.append(street2Field.text!.trimmingCharacters(in: .whitespaces))
        arr.append(citField.text!.trimmingCharacters(in: .whitespaces))
        arr.append(stateField.text!.trimmingCharacters(in: .whitespaces))
        arr.append(pinField.text!.trimmingCharacters(in: .whitespaces))
        
        if logics.validation(arr)
        {
            viewmodel.addUser(arr)
            AlertManager.shared.showAlert(from: self, withTitle: "Yay signed up", message: "User has been created", shouldNavigate: true)

        }
        else{
            AlertManager.shared.showAlert(from: self, withTitle: logics.gettitle(), message: logics.getmessage(), shouldNavigate: false)
        }
    }
    
}
//MARK: - EXTENSIONS FOR PICKER DATASOURCE
extension SignUpViewController : UIPickerViewDelegate,UIPickerViewDataSource{
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return pickData.count
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        countryNumber.text = pickData[row]
        countryNumber.resignFirstResponder() // Hide the keyboard or pickerView
    }
    func pickerView(_ pickerView: UIPickerView, attributedTitleForRow row: Int, forComponent component: Int) -> NSAttributedString? {
        let title = pickData[row]
        let color = UIColor.red // inga .cgcolor kodutha error
        
        let attributes: [NSAttributedString.Key: Any] = [
            .foregroundColor: color,
            .font: UIFont.systemFont(ofSize: 18)
        ]
        
        return NSAttributedString(string: title, attributes: attributes)
        }
    
}
//MARK: - PICKER AND ALERT
extension SignUpViewController : UITextFieldDelegate{
    func textFieldDidBeginEditing(_ textField: UITextField) {
            if textField == countryNumber {
                self.openPicker()
            }
        }
}
extension SignUpViewController{
    func openPicker(){
        let pickerview = UIPickerView()
        pickerview.frame = CGRect(x: 0, y: 0, width: view.frame.size.width, height: 200)

        countryNumber.inputView = pickerview
        pickerview.delegate = self
        pickerview.dataSource = self
    }
    //MARK: - CANCEL
    @IBAction func cancelBtn(_ sender: Any){
        //self.navigationController?.popViewController(animated: true)
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let sc = storyboard.instantiateViewController(withIdentifier: "LoginNav")
        self.view.window?.rootViewController = sc
        self.view.window?.makeKeyAndVisible()
    }
    
}
