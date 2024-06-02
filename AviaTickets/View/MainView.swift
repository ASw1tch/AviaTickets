//
//  MainView.swift
//  AviaTickets
//
//  Created by Anatoliy Petrov on 29.5.24..
//

import SwiftUI

struct MainView: View {
    
    @ObservedObject var coordinator: MainCoordinator
    
    var body: some View {
        ZStack {
            
            Color(.black).edgesIgnoringSafeArea(.all)
            
            TabView(selection: $coordinator.selectedTab) {
                AviaView(coordinator: coordinator)
                    .tabItem {
                        Label("Авиабилеты", image: "planeMain")
                    }
                    .tag(MainCoordinator.Tab.avia)
                
                HotelsView()
                    .tabItem {
                        Label("Отели", image: "bed")
                    }
                    .tag(MainCoordinator.Tab.hotels)
                
                ShortlyView()
                    .tabItem {
                        Label("Короче", image: "locationMark")
                    }
                    .tag(MainCoordinator.Tab.cruises)
                
                SubscriptionsView()
                    .tabItem {
                        Label("Подписки", image: "bell")
                    }
                    .tag(MainCoordinator.Tab.subscriptions)
                
                ProfileView()
                    .tabItem {
                        Label("Профиль", image: "person")
                    }
                    .tag(MainCoordinator.Tab.profile)
                
            }
            .tint(.blue)
        }
    }
}

#Preview {
    MainView(coordinator: MainCoordinator())
}
