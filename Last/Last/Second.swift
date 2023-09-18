//
//  Second.swift
//  Last
//
//  Created by Karthikeyan Muthu on 16/09/23.
//

import UIKit

protocol dataPassing{
    func pass(data:[String])
}

class Second: UIViewController,UIPickerViewDelegate,UIPickerViewDataSource  {

    @IBOutlet weak var pickerView: UIPickerView!
    
    @IBOutlet weak var appName: UITextField!
    
    @IBOutlet weak var versionName: UITextField!
    
    @IBOutlet weak var categoryName: UITextField!
    
    var delegate:dataPassing?
    
    let logics = Logics()
    
    var data = ["EDUCATION","SOCIAL NETWORKING","TRAVEL","NEWS","MARKETING"]
    override func viewDidLoad() {
        super.viewDidLoad()
        pickerView.isHidden = true
        pickerView.delegate = self
        pickerView.dataSource = self
    }
    
    // MARK: - BUTTON ACTIONS
    @IBAction func dropDown(_ sender: Any) {
        if pickerView.isHidden{
            pickerView.isHidden = false
        }
    }
    
    @IBAction func savebtn(_ sender: Any) {
        var arr = [String]()
        arr.append(appName.text!)
        arr.append(versionName.text!)
        arr.append(categoryName.text!)
       
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
    // MARK: - EXTENSIONS
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
            return data.count
        
    }
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        let a = data[pickerView.selectedRow(inComponent: 0)]
        categoryName.text = "\(a)"
        pickerView.isHidden = true
    }
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
    
            return data[row]
        
        
    }
    

}
