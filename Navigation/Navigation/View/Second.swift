//
//  Second.swift
//  Navigation
//
//  Created by Karthikeyan Muthu on 13/09/23.
//

import UIKit

protocol dataPassing{
    func passData(data:[String])
}



class Second: UIViewController {

    @IBOutlet weak var nametext: UITextField!
    
    @IBOutlet weak var passwordtext: UITextField!
    
    @IBOutlet weak var mailtext: UITextField!
    
    var delegate:dataPassing?
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func submitbtn(_ sender: Any) {
        let object = Consumer(nametext.text!, passwordtext.text!, mailtext.text!)
        delegate?.passData(data: object.getDetails())
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
