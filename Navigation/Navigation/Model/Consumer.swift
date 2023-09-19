//
//  Consumer.swift
//  Navigation
//
//  Created by Karthikeyan Muthu on 13/09/23.
//

import Foundation


class Consumer{
    var name:String
    var email:String
    var password:String
    
    init(_ a:String,_ b:String,_ c:String)
    {
        name = a
        email = b
        password = c
    }
    
    public func getDetails() -> [String]
    {
        var detailsArray:[String] = []
        detailsArray.append(name)
        detailsArray.append(email)
        detailsArray.append(password)
        return detailsArray
        
    }
    
}
