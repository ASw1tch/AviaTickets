//
//  NetworkManager.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 2.6.24..
//

import Foundation

class NetworkManager {
    static let shared = NetworkManager()
    
    private init() {}
    
    enum NetworkError: Error {
        case noData
    }
    

    // Fetch Tickets from local JSON data
    func fetchTickets(completion: @escaping (Result<TicketsModel, Error>) -> Void) {
        guard let data = TicketsJSON.data else {
            completion(.failure(NetworkError.noData))
            return
        }
        decodeData(data: data, completion: completion)
    }
    
    // Fetch Offers from local JSON data
    func fetchOffers(completion: @escaping (Result<OffersModel, Error>) -> Void) {
        guard let data = OffersJSON.data else {
            completion(.failure(NetworkError.noData))
            return
        }
        
        
        decodeData(data: data, completion: completion)
    }
    
    // Fetch Tickets Offers from local JSON data
    func fetchTicketsOffers(completion: @escaping (Result<OffersTicketsModel, Error>) -> Void) {
        guard let data = OffersTicketsJSON.data else {
            completion(.failure(NetworkError.noData))
            return
        }
        
        decodeData(data: data, completion: completion)
    }
    
    
    private func decodeData<T: Decodable>(data: Data, completion: @escaping (Result<T, Error>) -> Void) {
        do {
            let decodedData = try JSONDecoder().decode(T.self, from: data)
            completion(.success(decodedData))
        } catch {
            completion(.failure(error))
        }
    }
}


