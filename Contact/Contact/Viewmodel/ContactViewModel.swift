//
//  ContactViewModel.swift
//  Contact
//
//  Created by Karthikeyan Muthu on 01/10/23.
//

import Foundation



class ContactViewModel{
    
    
    func addUser(_ arr:[String]){
        DataManager.shared.saveUser(ContactModel(arr))
    }
    
    func deleteUser(_ ind:Int){
        DataManager.shared.deleteUser(at: ind)
    }
    
    func getAllUsers() -> [ContactModel]{
        return DataManager.shared.getAllUsers()
    }
    
    func getUsersCount() -> Int{
        return DataManager.shared.getAllUsers().count

    }
    
    func getUser(_ ind:Int) -> [String]{
        let data = DataManager.shared.getAllUsers()
        return data[ind].getName()
    }
    
    func printUsers() {
        DataManager.shared.printAllUsers()
    }
}
