//
//  Schedule.swift
//  Doctor
//
//  Created by vishnu vijayan on 2023-10-09.
//

import Foundation

enum AppointmentType: String, Codable {
    case video
    case inPerson
    case phone
}

struct Schedule: Codable, Identifiable {
    var id: Int
    let doctor: Doctor
    let appointmentType: AppointmentType
    let dateTime: String
}
