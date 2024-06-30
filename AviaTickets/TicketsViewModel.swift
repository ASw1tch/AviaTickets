//
//  TicketsViewModel.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 30.6.24..
//

import SwiftUI
import Combine

class TicketsViewModel: ObservableObject {
    @Published var tickets: [Ticket] = []
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchTickets() {
        NetworkManager.shared.fetchTickets { [weak self] result in
            switch result {
            case .success(let ticketsModel):
                DispatchQueue.main.async {
                    self?.tickets = ticketsModel.tickets
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = "Error fetching tickets: \(error)"
                }
            }
        }
    }
}
