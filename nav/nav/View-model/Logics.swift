//
//  Logics.swift
//  nav
//
//  Created by Karthikeyan Muthu on 12/09/23.
//

import Foundation

class Logics{
    var message = ""
    func validation(_ name:String) -> Bool {
        if name.count <= 0{
            message = "type something"
            return false
        }
        else if !name.contains("@gmail.com")
        {
            message = "Add @gmail.com at end"
            return false
        }
        
            return true
        
    }
}
