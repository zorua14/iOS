//
//  ActualAlert.swift
//  Contact
//
//  Created by Karthikeyan Muthu on 03/10/23.
//

import Foundation
import UIKit

class AlertManager {
    static let shared = AlertManager()
    
    private init() { }
    
    func showAlert(from viewController: UIViewController, withTitle title: String, message: String, shouldNavigate: Bool = false) {
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        //If needed also get input for ok
        let okAction = UIAlertAction(title: "OK", style: .default) { _ in
            if shouldNavigate {
                
                let storyboard = UIStoryboard(name: "Main", bundle: nil)
                let sc = storyboard.instantiateViewController(withIdentifier: "LoginNav")
               
                viewController.view.window?.rootViewController = sc
                viewController.view.window?.makeKeyAndVisible()
            }
        }
        
        alertController.addAction(okAction)
        
        viewController.present(alertController, animated: true, completion: nil)
    }
}
