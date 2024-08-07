//
//  TicketsJSON.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 1.7.24..
//

import Foundation

struct TicketsJSON {
    static let data = """
{
    "tickets": [
        {
            "id": 100,
            "badge": "Самый удобный",
            "price": {
                "value": 1999
            },
            "provider_name": "На сайте Купибилет",
            "company": "Якутия",
            "departure": {
                "town": "Москва",
                "date": "2024-02-23T03:15:00",
                "airport": "VKO"
            },
            "arrival": {
                "town": "Сочи",
                "date": "2024-02-23T07:10:00",
                "airport": "AER"
            },
            "has_transfer": false,
            "has_visa_transfer": false,
            "luggage": {
                "has_luggage": false,
                "price": {
                    "value": 1082
                }
            },
            "hand_luggage": {
                "has_hand_luggage": true,
                "size": "55x20x40"
            },
            "is_returnable": false,
            "is_exchangable": true
        },
        {
            "id": 101,
            "price": {
                "value": 9999
            },
            "provider_name": "На сайте Победа",
            "company": "Победа",
            "departure": {
                "town": "Москва",
                "date": "2024-02-23T04:00:00",
                "airport": "VKO"
            },
            "arrival": {
                "town": "Сочи",
                "date": "2024-02-23T08:30:00",
                "airport": "AER"
            },
            "has_transfer": false,
            "has_visa_transfer": false,
            "luggage": {
                "has_luggage": false,
                "price": {
                    "value": 1602
                }
            },
            "hand_luggage": {
                "has_hand_luggage": true,
                "size": "36x30x27"
            },
            "is_returnable": false,
            "is_exchangable": true
        },
        {
            "id": 102,
            "price": {
                "value": 8500
            },
            "provider_name": "На сайте Turkish Airlines",
            "company": "Турецкие авиалинии",
            "departure": {
                "town": "Москва",
                "date": "2024-02-23T15:00:00",
                "airport": "VKO"
            },
            "arrival": {
                "town": "Сочи",
                "date": "2024-02-23T18:40:00",
                "airport": "AER"
            },
            "has_transfer": false,
            "has_visa_transfer": false,
            "luggage": {
                "has_luggage": true
            },
            "hand_luggage": {
                "has_hand_luggage": true,
                "size": "55x20x40"
            },
            "is_returnable": false,
            "is_exchangable": false
        },
        {
            "id": 103,
            "badge": "Рекомендуемый",
            "price": {
                "value": 8086
            },
            "provider_name": "На сайте Уральские авиалинии",
            "company": "Уральские авиалинии",
            "departure": {
                "town": "Москва",
                "date": "2024-02-23T11:30:00",
                "airport": "VKO"
            },
            "arrival": {
                "town": "Сочи",
                "date": "2024-02-23T15:00:00",
                "airport": "AER"
            },
            "has_transfer": false,
            "has_visa_transfer": false,
            "luggage": {
                "has_luggage": false,
                "price": {
                    "value": 1570
                }
            },
            "hand_luggage": {
                "has_hand_luggage": true,
                "size": "55x20x40"
            },
            "is_returnable": true,
            "is_exchangable": true
        },
        {
            "id": 104,
            "price": {
                "value": 11560
            },
            "provider_name": "На сайте Aeroflot",
            "company": "Аэрофлот",
            "departure": {
                "town": "Москва",
                "date": "2024-02-23T11:50:00",
                "airport": "VKO"
            },
            "arrival": {
                "town": "Сочи",
                "date": "2024-02-23T15:20:00",
                "airport": "AER"
            },
            "has_transfer": true,
            "has_visa_transfer": false,
            "luggage": {
                "has_luggage": false,
                "price": {
                    "value": 999
                }
            },
            "hand_luggage": {
                "has_hand_luggage": true,
                "size": "55x20x40"
            },
            "is_returnable": false,
            "is_exchangable": true
        },
        {
            "id": 105,
            "price": {
                "value": 15600
            },
            "provider_name": "На сайте Aeroflot",
            "company": "Аэрофлот",
            "departure": {
                "town": "Москва",
                "date": "2024-02-23T13:50:00",
                "airport": "VKO"
            },
            "arrival": {
                "town": "Сочи",
                "date": "2024-02-23T17:20:00",
                "airport": "AER"
            },
            "has_transfer": true,
            "has_visa_transfer": true,
            "luggage": {
                "has_luggage": false,
                "price": {
                    "value": 1999
                }
            },
            "hand_luggage": {
                "has_hand_luggage": true,
                "size": "55x20x40"
            },
            "is_returnable": true,
            "is_exchangable": true
        },
        {
            "id": 106,
            "price": {
                "value": 9500
            },
            "provider_name": "На сайте Aeroflot",
            "company": "Аэрофлот",
            "departure": {
                "town": "Москва",
                "date": "2024-02-23T21:00:00",
                "airport": "VKO"
            },
            "arrival": {
                "town": "Сочи",
                "date": "2024-02-24T00:20:00",
                "airport": "AER"
            },
            "has_transfer": false,
            "has_visa_transfer": false,
            "luggage": {
                "has_luggage": false,
                "price": {
                    "value": 5999
                }
            },
            "hand_luggage": {
                "has_hand_luggage": false
            },
            "is_returnable": false,
            "is_exchangable": false
        }
    ]
}
""".data(using: .utf8)
}
