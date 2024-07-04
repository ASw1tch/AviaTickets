//
//  FlightsCardView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 2.7.24..
//

import SwiftUI

struct FlightsCardView: View {
    
    var circleColor: Color
    var timeOfFlights: [String]
    var price: Int
    var carrier: String
    
    
    var truncatedFlights: String {
        if timeOfFlights.count > 6 {
            return timeOfFlights.prefix(6).joined(separator: " ") + "..."
        } else {
            return timeOfFlights.joined(separator: " ")
        }
    }
    
    var body: some View {
        VStack(spacing: 10) {
                HStack(alignment: .top) {
                    Circle()
                        .fill(circleColor)
                        .frame(width: 27)
                        .fixedSize()
                    VStack(alignment: .leading, spacing: 8) {
                        
                        HStack {
                            Text(carrier)
                                .font(.body)
                                .foregroundStyle(.white)
                                .italic()
                            Spacer()
                            HStack(spacing:3) {
                                let formattedPrice = formatPrice(price)
                                Text(formattedPrice)
                                Text("₽")
                                Image(systemName: "chevron.right")
                                    .font(.callout)
                                
                            }
                            .foregroundStyle(.blue)
                        }
                        HStack {
                            Text(truncatedFlights)
                                .font(.body)
                                .foregroundColor(.white)
                                .lineLimit(1)
                                .truncationMode(.tail)
                        }
                        
                    }
                }
                Rectangle()
                    .fill(Color.aviaGrey5)
                    .frame(height: 1)
                    .frame(maxWidth: .infinity)
                    
        }
    }
    
    
    private func formatPrice(_ value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
}


#Preview {
    FlightsCardView(circleColor: .aviaRed, timeOfFlights: ["10:12"], price: 20342, carrier: "RedWings")
}


