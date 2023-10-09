//
//  DataManager.swift
//  Week 6
//
//  Created by Karthikeyan Muthu on 06/10/23.
//

import Foundation

class DataManager {
    static let shared = DataManager()

    private let userDefaults = UserDefaults.standard
    private let key = "users"

    private var users: [UserModel] {
        get {
            if let data = userDefaults.data(forKey: key),
               let users = try? JSONDecoder().decode([UserModel].self, from: data) {
                return users
            }
            return []
        }
        set {
            if let data = try? JSONEncoder().encode(newValue) {
                userDefaults.set(data, forKey: key)
            }
        }
    }

    func saveUser(_ user: UserModel) {
        var updatedUsers = users
        updatedUsers.append(user)
        users = updatedUsers
    }
    func getAllUsers() -> [UserModel] {
            return users
        }
    func deleteUser(at index: Int) {
            var updatedUsers = users
            if index >= 0 && index < updatedUsers.count {
                updatedUsers.remove(at: index)
                users = updatedUsers
            }
        }

    func printAllUsers() {
        for user in users {
            print(user.getName())
        }
    }
    
    func findIndexOfUser(withName name: String) -> Int? {
            for (index, user) in users.enumerated() {
                if user.getName() == name {
                    return index
                }
            }
            return nil
        }
    //Add job
    func modifyUser(at index: Int, job: JobModel) {
            var updatedUsers = users
            if index >= 0 && index < updatedUsers.count {
                updatedUsers[index].jobs.append(job)
                users = updatedUsers
            }
        }
    func getUser(at index: Int) -> UserModel? {
        if index >= 0 && index < users.count {
            return users[index]
        }
        return nil
    }
    func deleteJob(_ userIndex:Int,_ jobIndex:Int){
        var updateUser = users
        if userIndex >= 0 && userIndex < updateUser.count {
            updateUser[userIndex].jobs.remove(at: jobIndex)
            users = updateUser
        }
    }
    
}
