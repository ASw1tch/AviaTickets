//
//  AllTicketsView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 4.7.24..
//

import SwiftUI

struct AllTicketsView: View {
    
    @ObservedObject var coordinator: MainCoordinator
    @StateObject private var ticketsViewModel = TicketsViewModel()
    
    @Binding var flightFrom: String
    @Binding var flightTo: String
    @Binding var selectedDate: Date
    
    var body: some View {
        NavigationStack {
            ZStack {
                Color(.black).edgesIgnoringSafeArea(.all)
                VStack(alignment: .center) {
                    searchCardView()
                    ScrollView {
                        VStack(spacing: 20) {
                            ForEach(ticketsViewModel.tickets, id: \.id) { ticket in
                                ticketCardView(ticket: ticket)
                            }
                        }
                    }.padding(.horizontal, 10)
                        .padding(.vertical, 20)
                        .overlay {
                            ZStack {
                                Capsule()
                                    .fill(.blue)
                                    .frame(width: 250, height: 50)
                                HStack(spacing: 3) {
                                    Image("filter")
                                        .resizable()
                                        .frame(width: 20.0, height: 20.0)
                                    Text("Фильтр")
                                    Text("  ")
                                    Image("graph")
                                        .resizable()
                                        .frame(width: 20.0, height: 20.0)
                                    
                                    Text("График цен")
                                        .italic()
                                }
                            }
                            .offset(y: 260)
                        }
                    }
                
                }.onAppear {
                ticketsViewModel.fetchTickets()
            }
            
        }.navigationBarBackButtonHidden()
    }
    
    @ViewBuilder
    func searchCardView() -> some View {
        ZStack(alignment: .leading) {
            RoundedRectangle(cornerRadius: 5, style: .continuous)
                .fill(Color.aviaGrey4)
                .frame(maxWidth: .infinity)
                .frame(height:70)
                .padding(.horizontal, 10)
                .shadow(radius: 2, y: 3)
            
            HStack {
                Button(action: {
                    coordinator.popTo(view: AnyView(SearchResultView(
                        coordinator: coordinator,
                        flightFrom: $flightFrom,
                        flightTo: $flightTo
                    )))
                }, label: {
                    Image(systemName: "arrow.left")
                        .resizable()
                        .frame(width: 23.0, height: 23.0)
                        .foregroundStyle(.blue)
                        .padding(.horizontal, 5)
                })
                
                VStack(alignment: .leading) {
                    HStack(spacing: 0){
                        Text(flightFrom)
                        Text("-")
                        Text(flightTo)
                    }.bold()
                    HStack(spacing: 0) {
                        Text(formattedDate(date: selectedDate))
                        Text(", 1 пассажир")
                    }.foregroundStyle(Color.aviaGrey6)
                }
            }.offset(x: 20)
        }
    }
    
    
    @ViewBuilder
    func ticketCardView(ticket: Ticket) -> some View {
        
        TicketsCardView(circleColor: .aviaRed,
                        badge: ticket.badge,
                        price: ticket.price.value,
                        departureTime: ticket.departure.date,
                        departureAirport: ticket.departure.airport.rawValue,
                        arrivalTime: ticket.arrival.date,
                        arrivalAirport: ticket.arrival.airport.rawValue,
                        hasTransfer: ticket.has_transfer, hasBadge: ticket.badge != nil)
    }
    
    private func formatPrice(_ value: Int) -> String {
        let formatter = NumberFormatter()
        formatter.numberStyle = .decimal
        formatter.groupingSeparator = " "
        return formatter.string(from: NSNumber(value: value)) ?? "\(value)"
    }
    
    func formattedDate(date: Date) -> String {
        let formatter = DateFormatter()
        formatter.locale = Locale(identifier: "ru_RU")
        formatter.dateFormat = "dd MMM"
        return formatter.string(from: date)
    }
    
}

struct AllTicketsView_Previews: PreviewProvider {
    @State static var flightFrom = "Москvа"
    @State static var flightTo = "Сочаи"
    @State static var selectedDate = Date.now
    
    static var previews: some View {
        AllTicketsView(
            coordinator: MainCoordinator(),
            flightFrom: $flightFrom,
            flightTo: $flightTo,
            selectedDate: $selectedDate
        )
    }
}

