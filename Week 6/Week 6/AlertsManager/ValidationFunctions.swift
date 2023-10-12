//
//  ValidationFunctions.swift
//  Week 6
//
//  Created by Karthikeyan Muthu on 06/10/23.
//

import Foundation

class ValidationFunctions{
    var title = ""
    var message = ""
    func validation(value:[String]) -> Bool {
        if (value[0].count <= 0) || (value[1].count <= 0) || (value[2].count <= 0) || (value[3].count <= 0) || (value[4].count <= 0)
        {
            title = "Empty Field"
            message = "Fill all fields"
            return false
        }
        else{
           
            if isValidPhoneNumber(value[3]) && isNumericAndLessThan100(value[1])
            {
                return true
            }
            else{
                
                return false
            }
            
        }
    }
    func getmessage() -> String {
        return message
    }
    func getTitle() -> String {
        return title
    }
    func isValidPhoneNumber(_ phoneNumber: String) -> Bool {
        // Check if the string has exactly 10 characters
        guard phoneNumber.count == 10 else {
            title = "Phone Number error"
            message = "Phone number should be number and 10 characters long"
            return false
        }

        // Check if all characters are digits (numbers)
        for character in phoneNumber {
            if !character.isNumber {
                title = "Phone Number error"
                message = "Phone number should be number and 10 characters long"
                return false
            }
        }

        return true
    }
    func isNumericAndLessThan100(_ str: String) -> Bool {
        // Check if the string is empty
        guard !str.isEmpty else {
            title = "Experience error"
            message = "Experience in number"
            return false
        }
        
        // Create a character set containing digits
        let digits = CharacterSet.decimalDigits
        
        // Check if every character in the string is a digit
        guard str.unicodeScalars.allSatisfy({ digits.contains($0) }) else {
            title = "Experience error"
            message = "Experience in number"
            return false
        }
        
        // Convert the string to an integer and check if it's less than 100
        if let number = Int(str), number < 100 {
            return true
        }
        title = "Experience error"
        message = "Experience in number"
        return false
    }
}
    

