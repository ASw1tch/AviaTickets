//
//  OffersTicketsModel.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 2.7.24..
//

import Foundation

// MARK: - OffersTicketsModel
struct OffersTicketsModel: Codable {
    let ticketsOffers: [TicketsOffer]
    
    enum CodingKeys: String, CodingKey {
        case ticketsOffers = "tickets_offers"
    }
}

// MARK: - TicketsOffer
struct TicketsOffer: Codable {
    let id: Int
    let title: String
    let timeRange: [String]
    let price: OfferTicketsPrice
    
    enum CodingKeys: String, CodingKey {
        case id
        case title
        case timeRange = "time_range"
        case price
    }
}

// MARK: - OfferTicketsPrice
struct OfferTicketsPrice: Codable {
    let value: Int
}
