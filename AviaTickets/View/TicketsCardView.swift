//
//  TicketsCardView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 2.7.24..
//

import SwiftUI

struct TicketsCardView: View {
    var circleColor: Color = .aviaRed
    var badge: String?
    var price: Int = 7386
    var departureTime: String = "2024-02-23T03:15:00"
    var departureAirport: String = "DME"
    var arrivalTime: String = "2024-02-29T07:45:00"
    var arrivalAirport: String = "AER"
    var hasTransfer: Bool?
    var hasBadge: Bool
    
    init(circleColor: Color, badge: String? = nil, price: Int, departureTime: String, departureAirport: String, arrivalTime: String, arrivalAirport: String, hasTransfer: Bool? = false, hasBadge: Bool ) {
        self.circleColor = circleColor
        self.badge = badge
        self.price = price
        self.departureTime = departureTime
        self.departureAirport = departureAirport
        self.arrivalTime = arrivalTime
        self.arrivalAirport = arrivalAirport
        self.hasTransfer = hasTransfer
        self.hasBadge = hasBadge
    }
    
    var body: some View {
        
        let timeTravel = calculateTravelTime(departure: departureTime, arrival: arrivalTime)
        let formattedDepartureTime = formatTime(departureTime)
        let formattedArrivalTime = formatTime(arrivalTime)
        
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 12, style: .continuous)
                .fill(Color.aviaGrey2)
                .frame(maxWidth: .infinity)
                .frame(height: 120)
            
            if let badge = badge, hasBadge {
                ZStack {
                    Capsule()
                        .fill(.blue)
                        .frame(width: 150, height: 25)
                    Text(badge)
                        .italic()
                }.offset(y:-55)
            }
           
                
            
            VStack(alignment: .leading, spacing: 10) {
                HStack(spacing:5) {
                    let formattedPrice = formatPrice(price)
                    Text(formattedPrice)
                    Text("₽")
                }.font(.title2)
                    .bold()
                VStack(alignment: .leading) {
                    HStack(alignment: .center) {
                        Circle()
                            .fill(circleColor)
                            .frame(width: 27)
                            .fixedSize()
                        VStack(alignment: .leading, spacing: 3) {
                            HStack(spacing: 6) {
                                Text(formattedDepartureTime)
                                    .foregroundColor(.white)
                                    .italic()
                                Text("—")
                                    .foregroundStyle(Color.aviaGrey6)
                                Text(formattedArrivalTime)
                                    .foregroundColor(.white)
                                    .italic()
                                HStack(spacing: 2){
                                    Text(" \(timeTravel)ч в пути")
                                    if hasTransfer != false {
                                        Text("/")
                                            .foregroundStyle(Color.aviaGrey6)
                                        Text("Без пересадок")
                                            .foregroundColor(.white)
                                    }
                                }
                            }
                            HStack {
                                Text(departureAirport)
                                    .italic()
                                Text("   ")
                                Text(arrivalAirport)
                                    .italic()
                            }.foregroundStyle(Color.aviaGrey6)
                        }
                    }
                }.font(.system(size: 14))
                
            }.padding()
                .offset(y: 10)
        }.offset(y: hasBadge ? 9 : 7)
            .background(Color.clear)
    }
    private func formatPrice(_ value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
    
    func calculateTravelTime(departure: String, arrival: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        guard let departureDate = dateFormatter.date(from: departure),
              let arrivalDate = dateFormatter.date(from: arrival) else {
            return "0.0"
        }
        
        let travelTimeInSeconds = arrivalDate.timeIntervalSince(departureDate)
        let travelTimeInHours = travelTimeInSeconds / 3600
        
        let roundedTravelTime = (travelTimeInHours * 2).rounded() / 2
        return String(format: "%.1f", roundedTravelTime)
    }
    
    func formatTime(_ date: String) -> String {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ss"
        
        guard let date = dateFormatter.date(from: date) else {
            return ""
        }
        
        dateFormatter.dateFormat = "HH:mm"
        return dateFormatter.string(from: date)
    }
}


#Preview {
    TicketsCardView(circleColor: .aviaRed,
                    badge: "фывьащzxcvzш",
                    price: 7386,
                    departureTime: "2024-02-23T03:15:00",
                    departureAirport: "DME",
                    arrivalTime: "2024-02-29T07:45:00",
                    arrivalAirport: "AER",
                    hasTransfer: false,
                    hasBadge: true)
}

