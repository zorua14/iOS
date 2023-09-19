//
//  Third.swift
//  Navigation
//
//  Created by Karthikeyan Muthu on 13/09/23.
//

import UIKit

class Third: UIViewController {

    var text = ""
    
    @IBOutlet weak var welcomename: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        welcomename.text = text
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
