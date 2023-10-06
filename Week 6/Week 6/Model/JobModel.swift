//
//  JobModel.swift
//  Week 6
//
//  Created by Karthikeyan Muthu on 06/10/23.
//

import Foundation

class JobModel:Encodable,Decodable{
    let jobName:String
    let experience:String
    let location:String
    let contactNumber:String
    let description:String
    
    init(data:[String]) {
        self.jobName = data[0]
        self.experience = data[1]
        self.location = data[2]
        self.contactNumber = data[3]
        self.description = data[4]
    }
    
    func getData() -> [String]{
        var dataArray = [String]()
        dataArray.append(jobName)
        dataArray.append(experience)
        dataArray.append(location)
        dataArray.append(contactNumber)
        dataArray.append(description)
        return dataArray
    }
}
