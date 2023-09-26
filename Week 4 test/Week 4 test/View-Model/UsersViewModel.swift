//
//  UsersViewModel.swift
//  Week 4 test
//
//  Created by Karthikeyan Muthu on 27/09/23.
//

import Foundation

class UsersViewModel{
    var users = [UserDetails]()
    func addUser(_ arr:[String])
    {
        users.append(UserDetails(data: arr))
        var sorted = users.sorted { $0.getName() < $1.getName() }
        users = []
        users = sorted
    }
    
    func removeUser(_ ind:Int){
        users.remove(at: ind)
    }
    
    func getCount() -> Int{
        return users.count
    }
    
    func getUser(_ ind:Int) -> [String]{
        return users[ind].getData()
    }
}
