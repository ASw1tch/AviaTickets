//
//  OfferTicketsViewModel.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 1.7.24..
//

import Foundation

class OfferTicketsViewModel: ObservableObject {
    @Published var ticketsOffers: [TicketsOffer] = []
    @Published var isLoading = false
    @Published var errorMessage: String?
    
    func fetchOfferTickets() {
        isLoading = true
        errorMessage = nil
        
        NetworkManager.shared.fetchTicketsOffers { [weak self] result in
            DispatchQueue.main.async {
                self?.isLoading = false
                switch result {
                case .success(let offersTicketsModel):
                    self?.ticketsOffers = offersTicketsModel.ticketsOffers
                case .failure(let error):
                    self?.errorMessage = "Failed to load data: \(error.localizedDescription)"
                }
            }
        }
    }
}
