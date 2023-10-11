//
//  User.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-09.
//

import Foundation


struct User {
    let username: String
    let firstName: String
    let lastName: String
    let userid: String
    var name: String {
        "\(firstName) \(lastName)"
    }
}
