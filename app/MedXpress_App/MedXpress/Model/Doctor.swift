//
//  Model.swift
//  MedXpress
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import Foundation

// Doctor model conforming to Decodable
struct Doctor: Decodable {
    let id: Int
    let firstName: String
    let middleName: String?
    let lastName: String
    let sex: String
    let ranking: Double
    let fullName: String
    let age: Int
    let workPlace: String
    let specializationArea: String
    let email: String
    let password: String
    let paymentHistory: String?
    let timeFrames: String?
}
