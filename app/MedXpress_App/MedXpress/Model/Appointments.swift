//
//  Appointments.swift
//  MedXpress
//
//  Created by Mekhriddin Jumaev on 21/09/24.
//

import Foundation

// Payment history model
struct PaymentHistory: Decodable {
    let transactionId: Int
    let senderId: Int
    let receiverId: Int
    let amount: Double
    let date: String // You can also use a Date type if you prefer
}

// Doctor model
struct DoctorAppointmentModel: Decodable {
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
}

// Time frame model
struct TimeFrame: Decodable {
    let startDate: String // You can also use Date if you prefer
    let endDate: String // You can also use Date if you prefer
    let doctor: DoctorAppointmentModel // Updated to include the Doctor struct
}

// Appointment model
struct Appointment: Decodable {
    let id: Int
    let timeFrame: TimeFrame
}

