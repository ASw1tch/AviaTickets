//
//  MainCoordinator.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 29.5.24..
//

import SwiftUI

class MainCoordinator: ObservableObject {
    
    @Published var selectedTab: Tab = .avia
    @Published var isSheetPresented: Bool = false
    
    enum Tab: String {
        case avia = "Авиабилеты"
        case hotels = "Отели"
        case shortly = "Короче"
        case cruises = "Круизы"
        case subscriptions = "Подписки"
        case profile = "Профиль"
    }
    
    func selectTab(_ tab: Tab) {
        selectedTab = tab
    }
    
    func showSheet() {
        isSheetPresented = true
    }
}
