//
//  FlightsCardView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 30.6.24..
//

import SwiftUI

struct FlightsCardView: View {
    
    var circleColor: Color /* = .aviaRed*/
    var carrier: String /*= "Победа"*/
    var timeOfFlights: [String]/* = ["07:00", "09:10", "10:30", "11:00", "12:30", "13:00", "12:00", "11:00", "12:00"]*/
    var price: Int /*= 2390*/
    
    
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
    FlightsCardView(circleColor: .aviaRed, carrier: "Победа", timeOfFlights: ["10:10"], price: 20323)
}


