//
//  Doctor.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-09.
//

import Foundation

struct Doctor: Codable, Identifiable, Equatable {
    static func == (lhs: Doctor, rhs: Doctor) -> Bool {
        lhs.id == rhs.id
    }
    
    let id: Int
    let name: String
    var image: String?
    let specilaity: Category
    let availability: String
    let licenceId: String
    let rating: Double
    let rate: Double
}
