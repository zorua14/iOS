//
//  Second.swift
//  nav
//
//  Created by Karthikeyan Muthu on 12/09/23.
//

import UIKit

protocol dataPassing{
    func pass(data:String)
}

class Second: UIViewController {

    
    @IBOutlet weak var textfield: UITextField!
    
    var delegate:dataPassing?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationItem.title="sign up"
    }
    
    @IBAction func submit(_ sender: Any) {
        delegate?.pass(data: textfield.text!)
        self.navigationController?.popViewController(animated: true)
    }
    
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
