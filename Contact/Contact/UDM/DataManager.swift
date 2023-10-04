//
//  DataManager.swift
//  Contact
//
//  Created by Karthikeyan Muthu on 03/10/23.
//

import Foundation


class DataManager {
    static let shared = DataManager()

    private let userDefaults = UserDefaults.standard
    private let key = "users"

    private var users: [ContactModel] {
        get {
            if let data = userDefaults.data(forKey: key),
               let users = try? JSONDecoder().decode([ContactModel].self, from: data) {
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

    func saveUser(_ user: ContactModel) {
        var updatedUsers = users
        updatedUsers.append(user)
        users = updatedUsers
    }
    func getAllUsers() -> [ContactModel] {
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
    
}




