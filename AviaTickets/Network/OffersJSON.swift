//
//  offersJSON.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 1.7.24..
//

import Foundation

struct OffersJSON {
    static let data = """
{
    "offers": [
        {
            "id": 1,
            "title": "Die Antwoord",
            "town": "Будапешт",
            "price": {
                "value": 5000
            }
        },
        {
            "id": 2,
            "title": "Socrat&Lera",
            "town": "Санкт-Петербург",
            "price": {
                "value": 1999
            }
        },
        {
            "id": 3,
            "title": "Лампабикт",
            "town": "Москва",
            "price": {
                "value": 2390
            }
        }
    ]
}
""".data(using: .utf8)
}
