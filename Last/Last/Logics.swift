//
//  Logics.swift
//  Last
//
//  Created by Karthikeyan Muthu on 16/09/23.
//

import Foundation

class Logics{
    var message = ""
    func validation(value:[String]) -> Bool {
        if (value[0].count <= 0) || (value[1].count <= 0) || (value[2].count <= 0 )
        {
            message = "Fill all fields"
            return false
        }
        else{
            return true
        }
    }
    func getmessage() -> String {
        return message
    }
}
