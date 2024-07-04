//
//  AviaTicketsApp.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 29.7.24..
//

import SwiftUI

@main
struct MyApp: App {
    @StateObject private var coordinator = MainCoordinator()
    
    var body: some Scene {
        WindowGroup {
            MainView(coordinator: coordinator)
        }
    }
}
