//
//  Logics.swift
//  Navigation
//
//  Created by Karthikeyan Muthu on 13/09/23.
//

import Foundation


class Logics{
    var message = ""

    func validation (_ submitarray:[String]) -> Bool {
                if (submitarray[0].count >= 1) && (submitarray[1].count >=  1) && (submitarray[2].count >= 1)
        {
            return true
        }
        else{
            message = "Fill all fields"
            return false
        }
                
        
        
    }
    public func getmessage() -> String{
        return message
    }

}

