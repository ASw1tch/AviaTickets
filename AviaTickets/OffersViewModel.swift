//
//  OffersViewModel.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 30.6.24..
//

import SwiftUI
import Combine

class OffersViewModel: ObservableObject {
    @Published var offers: [Offer] = []
    @Published var errorMessage: String?
    
    private var cancellables = Set<AnyCancellable>()
    
    func fetchOffers() {
        NetworkManager.shared.fetchOffers { [weak self] result in
            switch result {
            case .success(let offersModel):
                DispatchQueue.main.async {
                    self?.offers = offersModel.offers
                }
            case .failure(let error):
                DispatchQueue.main.async {
                    self?.errorMessage = "Error fetching offers: \(error)"
                }
            }
        }
    }
}
