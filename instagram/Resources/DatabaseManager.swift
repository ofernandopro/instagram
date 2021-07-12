//
//  DatabaseManager.swift
//  instagram
//
//  Created by Fernando Moreira on 10/07/21.
//  Copyright © 2021 Fernando Moreira. All rights reserved.
//

import FirebaseDatabase

public class DatabaseManager {
    
    static let shared = DatabaseManager()
    
    private let database = Database.database().reference()
    
    // Mark: - Public
    
    public func canCreateNewUser(with email: String, username: String, completion: (Bool) -> Void) {
        completion(true)
    }
    
    public func insertNewUser(with email: String, username: String, completion: @escaping (Bool) -> Void) {
        database.child(email.safeDatabaseKey()).setValue(["username": username]) { error, _ in
            if error == nil {
                // Succeeded
                completion(true)
                return
            }
            else {
                // Failed
                completion(false)
                return
            }
        }
    }
    
}
