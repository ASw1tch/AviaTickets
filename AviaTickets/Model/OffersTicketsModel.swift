//
//  OffersTicketsModel.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 2.6.24..
//

import Foundation

// MARK: - OffersTicketsModel
struct OffersTicketsModel: Codable {
    let tickets_offers: [TicketsOffer]
}

// MARK: - TicketsOffer
struct TicketsOffer: Codable {
    let id: Int
    let title: String
    let time_range: [String]
    let price: OfferTicketsPrice
}

// MARK: - OfferTicketsPrice
struct OfferTicketsPrice: Codable {
    let value: Int
}
