//
//  ContactModel.swift
//  Contact
//
//  Created by Karthikeyan Muthu on 01/10/23.
//

import Foundation

class ContactModel:Encodable,Decodable{
    var firstName:String
    var lastName:String
    var company:String
    var mail:String
    var countryNumber:String
    var phone:String
    var password:String
    var confirm:String
    var street:String
    var street2:String
    var city:String
    var state:String
    var pin:String
    
    init(_ dataArray:[String]){
        firstName = dataArray[0]
        lastName = dataArray[1]
        company = dataArray[2]
        mail = dataArray[3]
        countryNumber = dataArray[4]
        phone = dataArray[5]
        password = dataArray[6]
        confirm = dataArray[7]
        street = dataArray[8]
        street2 = dataArray[9]
        city = dataArray[10]
        state = dataArray[11]
        pin = dataArray[12]

    }
    
    func getName() -> [String]{
        var nameArray = [String]()
        nameArray.append(firstName)
        nameArray.append(lastName)
        return nameArray
        
    }
    func getUserName() -> String{
        return self.firstName
        
    }
    func getPassword() -> String{
        return self.password
    }
}
