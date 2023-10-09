//
//  UserViewModel.swift
//  Week 6
//
//  Created by Karthikeyan Muthu on 06/10/23.
//

import Foundation
class UserViewModel{
    
    func addUser(_ arr:[String]){
        DataManager.shared.saveUser(UserModel(data: arr))
    }
    
    func deleteUser(_ ind:Int){
        DataManager.shared.deleteUser(at: ind)
    }
    
    func getAllUsers() -> [UserModel]{
        return DataManager.shared.getAllUsers()
    }
    
    func getUsersCount() -> Int{
        return DataManager.shared.getAllUsers().count

    }
    
    func getUser(_ ind:Int) -> UserModel{
        
        return DataManager.shared.getUser(at: ind)!
    }
    
    func printUsers() {
        DataManager.shared.printAllUsers()
    }
}
    

