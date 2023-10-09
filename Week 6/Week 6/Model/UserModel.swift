//
//  UserModel.swift
//  Week 6
//
//  Created by Karthikeyan Muthu on 06/10/23.
//

import Foundation

class UserModel: Encodable,Decodable{
    let email:String
    let password:String
    var jobs = [JobModel]()
    
    init(data:[String]) {
        self.email = data[0]
        self.password = data[1]
    }
    
    func getName() -> String{
        return email
    }
    
    func getEmailandpass() -> [String]{
        var arr = [String]()
        arr.append(email)
        arr.append(password)
        return arr
    }
    
    func getJobs() -> [JobModel]{
        return jobs
    }
    func getJobCount() -> Int{
        return jobs.count
    }
    func setJob(_ data:[String]){
        jobs.append(JobModel(data: data))
    }
}
