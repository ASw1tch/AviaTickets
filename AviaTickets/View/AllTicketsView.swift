//
//  AllTicketsView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 30.6.24..
//

import SwiftUI

struct AllTicketsView: View {
    @StateObject private var ticketsViewModel = TicketsViewModel()
    
    var body: some View {
        ZStack {
            Color(.black).edgesIgnoringSafeArea(.all)
            
            ScrollView(.vertical) {
                VStack {
                    ForEach(ticketsViewModel.tickets, id: \.id) { ticket in
                        ticketCardView(ticket: ticket)
                    }
                }
            }.padding()
        }.onAppear {
            ticketsViewModel.fetchTickets()
        }
    }
    
    @ViewBuilder
    func ticketCardView(ticket: Ticket) -> some View {
        VStack(alignment: .leading, spacing: 8) {
            let formattedPrice = formatPrice(ticket.price.value)
            Text("Рейс: \(ticket.company)")
                .font(.headline)
                .foregroundStyle(.white)
            Text("Отправление: \(ticket.departure.town.rawValue) (\(ticket.departure.airport.rawValue))")
                .font(.subheadline)
                .foregroundStyle(.white)
            Text("Прибытие: \(ticket.arrival.town.rawValue) (\(ticket.arrival.airport.rawValue))")
                .font(.subheadline)
                .foregroundStyle(.white)
            Text("Цена: \(formattedPrice) ₽")
                .font(.subheadline)
                .foregroundStyle(.white)
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
    AllTicketsView()
}
