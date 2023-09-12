//
//  Third.swift
//  nav
//
//  Created by Karthikeyan Muthu on 12/09/23.
//

import UIKit

class Third: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        self.navigationController?.navigationItem.title="Logout"
        
    }
    

    @IBAction func logout(_ sender: Any) {
        let storyboard = UIStoryboard(name: "Main", bundle: nil)
        let first = storyboard.instantiateViewController(withIdentifier: "onenav") /* calling the first navigation controller not the first view ,
        else values wont be reset properly */
        self.view.window?.rootViewController = first
        self.view.window?.makeKeyAndVisible()

    }
    
}
