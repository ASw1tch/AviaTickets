//
//  OffersTicketsJSON.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 2.7.24..
//

import Foundation

struct OffersTicketsJSON {
    static let data = """
{
  "tickets_offers": [
    {
      "id": 1,
      "title": "Уральские авиалинии",
      "time_range": [
        "07:00",
        "09:10",
        "10:00",
        "11:30",
        "14:15",
        "19:10",
        "21:00",
        "23:30"
      ],
      "price": {
        "value": 3999
      }
    },
    {
      "id": 10,
      "title": "Победа",
      "time_range": [
        "09:10",
        "21:00"
      ],
      "price": {
        "value": 4999
      }
    },
    {
      "id": 30,
      "title": "NordStar",
      "time_range": [
        "07:00"
      ],
      "price": {
        "value": 2390
      }
    }
  ]
}
""".data(using: .utf8)
}

