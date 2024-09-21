//
//  User.swift
//  MedXpress
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import Foundation

import Foundation

struct MyUser: Decodable {
    let id: Int
    let firstName: String
    let middleName: String
    let lastName: String
    let sex: String
    let fullName: String
    let age: Int
    let dateTime: String
    let email: String
    let password: String
    let balance: Double
}

struct MyPayment: Decodable {
    let transactionId: Int
    let senderId: Int
    let receiverId: Int
    let amount: Double
    let date: String
}

struct MyAppointment: Decodable {
    let id: Int
    let userId: Int
    let user: String
    let timeFrame: MyTimeFrame
}

struct MyTimeFrame: Decodable {
    let id: Int
    let startDate: String
    let endDate: String
    let doctor: MyDoctor
    let dayOfWeek: Int
}

struct MyDoctor: Decodable {
    let id: Int
    let firstName: String
    let middleName: String
    let lastName: String
    let sex: String
    let ranking: Double
    let fullName: String
    let age: Int
    let workPlace: String
    let specializationArea: String
    let email: String
    let password: String
    let timeFrames: [String]
}
