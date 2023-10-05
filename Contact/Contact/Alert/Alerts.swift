//
//  Alerts.swift
//  Contact
//
//  Created by Karthikeyan Muthu on 29/09/23.
//This file checks if fields are filled and validations

import Foundation

class Alerts{
    var title = ""
    var message = ""
    func validation(_ dataArray:[String]) -> Bool{
        for i in dataArray{
            if i.isEmpty{
                title = "Empty Fields"
                message = "Fill empty fields"
                return false
            }
        }
        //MARK: - call validation functions
        for i in 0...dataArray.count-1{
            if i == 3 || i == 4 || i == 5 || i == 6 || i == 7 || i == 12
            {
                continue
            }
            if !doesNotContainNumber(dataArray[i]){
                title = "No Numbers"
                message = "Do not add numbers in fields"
                return false
            }
        }
        if !endsWithGmail(dataArray[3])
        {
            title = "Mail error"
            message = "Mail should end with @gmail.com only"
            return false
        }
        if !containsOnlyNumbers(dataArray[4]){
            title = "Country code"
            message = "Choose only from Picker"
            return false
        }
        if !containsOnlyNumbersAndIs10CharactersLong(dataArray[5])
        {
            title = "Contact error"
            message = "Make sure number is 10 characters long"
            return false
        }
        if !isPasswordValid(dataArray[6])
        {
            title = "Strong password"
            message = "Include special character and number and more than 6 characters"
            return false
        }
        if !samePassword(dataArray[6], dataArray[7]){
            title = "Password error"
            message = "Password does not match"
            return false
        }
        if !containsOnlyNumbers(dataArray[12])
        {
            title = "Pin Code"
            message = "Pin should be number"
            return false
        }
        return true
    }

//MARK: - VALIDATION FUNCTIONS
    

    func gettitle() -> String{
        return title
    }
    func getmessage() -> String{
        return message
    }
    func containsOnlyNumbers(_ inputString: String) -> Bool {
        let numericCharacters = CharacterSet(charactersIn: "0123456789")
        return inputString.rangeOfCharacter(from: numericCharacters.inverted) == nil
    }
    func doesNotContainNumber(_ inputString: String) -> Bool {
        let numericCharacters = CharacterSet(charactersIn: "0123456789")
        return inputString.rangeOfCharacter(from: numericCharacters) == nil
    }
    func containsOnlyNumbersAndIs10CharactersLong(_ inputString: String) -> Bool {
        if inputString.count == 10 {
            let numericCharacters = CharacterSet(charactersIn: "0123456789")
            return inputString.rangeOfCharacter(from: numericCharacters.inverted) == nil
        }
        return false
    }
    func samePassword(_ string1: String, _ string2: String) -> Bool {
        return string1 == string2
    }
    func isPasswordValid(_ password: String) -> Bool {
        // Check if the password length is at least 6 characters
        if password.count < 6 {
            return false
        }
        
        // Define character sets for numbers and special characters
        let numbersCharacterSet = CharacterSet(charactersIn: "0123456789")
        let specialCharacterSet = CharacterSet(charactersIn: "!@#$%^&*()_-+=<>?")

        // Check if the password contains at least one number
        if password.rangeOfCharacter(from: numbersCharacterSet) == nil {
            return false
        }

        // Check if the password contains at least one special character
        if password.rangeOfCharacter(from: specialCharacterSet) == nil {
            return false
        }

        // If all checks pass, the password is valid
        return true
    }
    func endsWithGmail(_ email: String) -> Bool {
        return email.hasSuffix("@gmail.com") && email.count > 10
    }


}
