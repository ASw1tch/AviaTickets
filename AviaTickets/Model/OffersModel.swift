//
//  OffersModel.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 2.7.24..
//



// MARK: - OffersModel
struct OffersModel: Codable {
    let offers: [Offer]
}

// MARK: - Offer
struct Offer: Codable {
    let id: Int
    let title: String
    let town: String
    let price: OfferPrice
}

// MARK: - OfferPrice
struct OfferPrice: Codable {
    let value: Int
}


