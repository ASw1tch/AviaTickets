//
//  TicketsModel.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 2.7.24..
//

import Foundation

// MARK: - TicketsModel
struct TicketsModel: Codable {
    let tickets: [Ticket]
}

// MARK: - Ticket
struct Ticket: Codable {
    let id: Int
    let badge: String?
    let price: Price
    let provider_name: String
    let company: String
    let departure: Arrival
    let arrival: Arrival
    let has_transfer: Bool
    let has_visa_transfer: Bool
    let luggage: Luggage
    let hand_luggage: HandLuggage
    let is_returnable: Bool
    let is_exchangable: Bool
}

// MARK: - Arrival
struct Arrival: Codable {
    let town: Town
    let date: String
    let airport: Airport
}

// MARK: - Airport
enum Airport: String, Codable {
    case aer = "AER"
    case vko = "VKO"
}

// MARK: - Town
enum Town: String, Codable {
    case москва = "Москва"
    case сочи = "Сочи"
}

// MARK: - HandLuggage
struct HandLuggage: Codable {
    let has_hand_luggage: Bool
    let size: String?
}

// MARK: - Luggage
struct Luggage: Codable {
    let has_luggage: Bool
    let price: Price?
}

// MARK: - Price
struct Price: Codable {
    let value: Int
}
